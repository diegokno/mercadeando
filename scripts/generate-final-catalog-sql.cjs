const fs = require('node:fs');
const core = require('../lib/recipe-core.js');
const catalog = JSON.parse(fs.readFileSync('data/catalog.final.json', 'utf8'));
const q = value => value == null ? 'NULL' : "'" + String(value).replaceAll("'", "''") + "'";
const json = value => q(JSON.stringify(value)) + '::jsonb';
const sql = [
  '-- Human-reviewed catalog. Run only after checking the local preview and image completion.',
  '-- Idempotent, transactional, preserves dish UUIDs and user data.',
  'begin;',
  'alter table public.dishes add column if not exists recipe_payload jsonb;',
  'alter table public.dishes add column if not exists catalog_version text;'
];
for (const d of catalog.dishes) {
  sql.push(`insert into public.dishes (slug,name,base,preparation,category,preparation_key,image_path,is_active,recipe_payload,catalog_version)
values (${[d.slug,d.n,d.base,d.prep,d.cat,d.p,`imagenes-platos/webp/${d.slug}.webp`].map(q).join(',')},${d.active},${json(d)},${q(catalog.version)})
on conflict (slug) do update set name=excluded.name,base=excluded.base,preparation=excluded.preparation,category=excluded.category,preparation_key=excluded.preparation_key,image_path=excluded.image_path,is_active=excluded.is_active,recipe_payload=excluded.recipe_payload,catalog_version=excluded.catalog_version;`);
  // JSON payload is authoritative for qualitative amounts and individual culinary roles.
  sql.push(`delete from public.recipe_steps where dish_id=(select id from public.dishes where slug=${q(d.slug)});`);
  d.steps.forEach((body, i) => sql.push(`insert into public.recipe_steps(dish_id,step_number,body) select id,${i+1},${q(body)} from public.dishes where slug=${q(d.slug)};`));
  sql.push(`delete from public.dish_ingredients where dish_id=(select id from public.dishes where slug=${q(d.slug)});`);
  for (const item of core.aggregate([d])) {
    for (const m of item.components) {
      if (m.q === null || m.q <= 0) continue;
      if (m.u === 'kg' && m.q < .001) { m.q *= 1000; m.u = 'g'; }
      sql.push(`insert into public.ingredients(name,default_unit,category) values (${q(item.n)},${q(m.u)},${q(item.cat||'Abarrotes')}) on conflict(name) do nothing;`);
      sql.push(`insert into public.dish_ingredients(dish_id,ingredient_id,unit,quantity,sort_order) select d.id,i.id,${q(m.u)},${Number(m.q.toFixed(3))},1 from public.dishes d,public.ingredients i where d.slug=${q(d.slug)} and i.name=${q(item.n)} on conflict(dish_id,ingredient_id,unit) do update set quantity=excluded.quantity;`);
    }
  }
}
sql.push(`create table if not exists public.user_meal_plan_snapshots (
user_id uuid primary key references auth.users(id) on delete cascade,
catalog_version text not null, payload jsonb not null, updated_at timestamptz not null default now());
alter table public.user_meal_plan_snapshots enable row level security;
drop policy if exists "Own meal plan snapshots" on public.user_meal_plan_snapshots;
create policy "Own meal plan snapshots" on public.user_meal_plan_snapshots for all to authenticated using(user_id=auth.uid()) with check(user_id=auth.uid());
grant select,insert,update,delete on public.user_meal_plan_snapshots to authenticated;
commit;`);
fs.writeFileSync('supabase/final-catalog-2026-10-07.sql', sql.join('\n\n')+'\n');
console.log(`Prepared migration for ${catalog.dishes.length} dishes. Not executed remotely.`);
