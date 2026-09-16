import fs from 'node:fs';
import path from 'node:path';

const root = process.cwd();
const dataPath = path.join(root, 'data', 'dishes.seed.json');
const outPath = path.join(root, 'supabase', 'seed.sql');
const data = JSON.parse(fs.readFileSync(dataPath, 'utf8'));

const ingredientCategories = [
  ['verduras', ['ají', 'ajo', 'cebolla', 'tomate', 'papa', 'zanahoria', 'zapallo', 'choclo', 'arveja', 'vainita', 'coliflor', 'berenjena', 'acelga', 'rocoto', 'caigua', 'olluco', 'limón', 'lechuga', 'palta', 'apio', 'poro', 'nabos', 'habas', 'cilantro', 'culantro', 'perejil', 'huacatay', 'espinaca']],
  ['carnes', ['res', 'carne', 'bistec', 'malaya', 'pecho', 'hígado']],
  ['avícolas', ['pollo', 'gallina', 'huevo', 'pechuga', 'pierna']],
  ['pescados', ['pescado', 'atún']],
  ['menestras', ['lenteja', 'frejol', 'frijol', 'garbanzo', 'tarwi', 'poroto']],
  ['lácteos', ['leche', 'queso', 'mantequilla', 'crema']],
  ['abarrotes', ['arroz', 'fideo', 'tallarín', 'tallarines', 'quinua', 'pan', 'harina', 'pan rallado', 'aceite', 'aceituna', 'vinagre', 'sillao', 'pasta', 'pasas', 'maní', 'chuño', 'orégano', 'comino', 'sal', 'pimienta']]
];

function categoryForIngredient(name) {
  const normalized = name.toLowerCase();
  const match = ingredientCategories.find(([, terms]) => terms.some((term) => normalized.includes(term)));
  return match?.[0] ?? 'abarrotes';
}

function sql(value) {
  if (value === null || value === undefined) return 'null';
  if (typeof value === 'number') return Number.isFinite(value) ? String(value) : 'null';
  if (typeof value === 'boolean') return value ? 'true' : 'false';
  return `'${String(value).replaceAll("'", "''")}'`;
}

const dishes = data.dishes;
const ingredientMap = new Map();

for (const dish of dishes) {
  for (const ingredient of dish.ingredients) {
    const current = ingredientMap.get(ingredient.name);
    if (!current) {
      ingredientMap.set(ingredient.name, {
        name: ingredient.name,
        default_unit: ingredient.unit,
        category: categoryForIngredient(ingredient.name)
      });
    }
  }
}

const dishRows = dishes.map((dish) => [
  dish.slug,
  dish.name,
  dish.base,
  dish.preparation,
  dish.category,
  dish.preparation_key,
  `imagenes-platos/webp/${dish.slug}.webp`,
  null,
  true
]);

const ingredientRows = [...ingredientMap.values()]
  .sort((a, b) => a.name.localeCompare(b.name, 'es'))
  .map((ingredient) => [
    ingredient.name,
    ingredient.default_unit,
    ingredient.category
  ]);

const slugList = dishes.map((dish) => sql(dish.slug)).join(', ');

const sections = [];
sections.push(`-- Mercadeando seed data
-- Generated from data/dishes.seed.json.
-- Safe to run more than once.

begin;
`);

sections.push(`insert into public.dishes (
  slug,
  name,
  base,
  preparation,
  category,
  preparation_key,
  image_path,
  image_url,
  is_active
) values
${dishRows.map((row) => `  (${row.map(sql).join(', ')})`).join(',\n')}
on conflict (slug) do update set
  name = excluded.name,
  base = excluded.base,
  preparation = excluded.preparation,
  category = excluded.category,
  preparation_key = excluded.preparation_key,
  image_path = excluded.image_path,
  image_url = excluded.image_url,
  is_active = excluded.is_active,
  updated_at = now();
`);

sections.push(`insert into public.ingredients (
  name,
  default_unit,
  category
) values
${ingredientRows.map((row) => `  (${row.map(sql).join(', ')})`).join(',\n')}
on conflict (name) do update set
  default_unit = excluded.default_unit,
  category = excluded.category;
`);

sections.push(`delete from public.recipe_steps
using public.dishes
where recipe_steps.dish_id = dishes.id
  and dishes.slug in (${slugList});

delete from public.dish_ingredients
using public.dishes
where dish_ingredients.dish_id = dishes.id
  and dishes.slug in (${slugList});
`);

const dishIngredientInserts = [];
for (const dish of dishes) {
  for (const ingredient of dish.ingredients) {
    dishIngredientInserts.push(`select d.id, i.id, ${sql(ingredient.quantity)}, ${sql(ingredient.unit)}, ${sql(ingredient.sort_order)}
from public.dishes d
join public.ingredients i on i.name = ${sql(ingredient.name)}
where d.slug = ${sql(dish.slug)}`);
  }
}

sections.push(`insert into public.dish_ingredients (
  dish_id,
  ingredient_id,
  quantity,
  unit,
  sort_order
)
${dishIngredientInserts.join('\nunion all\n')};
`);

const stepInserts = [];
for (const dish of dishes) {
  for (const step of dish.recipe_steps) {
    stepInserts.push(`select d.id, ${sql(step.step_number)}, ${sql(step.body)}
from public.dishes d
where d.slug = ${sql(dish.slug)}`);
  }
}

sections.push(`insert into public.recipe_steps (
  dish_id,
  step_number,
  body
)
${stepInserts.join('\nunion all\n')};
`);

sections.push(`commit;
`);

fs.writeFileSync(outPath, sections.join('\n'), 'utf8');

console.log(`Generated ${path.relative(root, outPath)}`);
console.log(`${dishes.length} dishes`);
console.log(`${ingredientRows.length} ingredients`);
