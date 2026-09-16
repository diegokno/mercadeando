-- Mercadeando initial Supabase schema
-- Review before running in a Supabase project.

create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  avatar_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.dishes (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  name text not null,
  base text not null,
  preparation text not null,
  category text not null,
  preparation_key text not null,
  image_path text,
  image_url text,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.ingredients (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  default_unit text not null,
  category text not null,
  created_at timestamptz not null default now()
);

create table if not exists public.dish_ingredients (
  id uuid primary key default gen_random_uuid(),
  dish_id uuid not null references public.dishes(id) on delete cascade,
  ingredient_id uuid not null references public.ingredients(id) on delete restrict,
  quantity numeric(10, 3) not null check (quantity > 0),
  unit text not null,
  sort_order integer not null default 1,
  unique (dish_id, ingredient_id, unit)
);

create table if not exists public.recipe_steps (
  id uuid primary key default gen_random_uuid(),
  dish_id uuid not null references public.dishes(id) on delete cascade,
  step_number integer not null check (step_number > 0),
  body text not null,
  unique (dish_id, step_number)
);

create table if not exists public.user_preferences (
  user_id uuid primary key references auth.users(id) on delete cascade,
  onboarding_completed boolean not null default false,
  people integer not null default 2 check (people > 0),
  portion text not null default 'regular' check (portion in ('poco', 'regular', 'taypa')),
  market_frequency text check (market_frequency in ('Todos los días', '1 vez por semana', 'Cada 2 semanas', '1 vez al mes')),
  no_cook_days text[] not null default '{}',
  quick_days integer[] not null default '{}',
  variety text not null default 'balanceada' check (variety in ('practica', 'balanceada', 'variada')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.user_dishes (
  user_id uuid not null references auth.users(id) on delete cascade,
  dish_id uuid not null references public.dishes(id) on delete cascade,
  status text not null check (status in ('accepted', 'rejected')),
  favorite boolean not null default false,
  enabled boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (user_id, dish_id)
);

create table if not exists public.weekly_plans (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  week_start date not null,
  generated_for_month date,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, week_start)
);

create table if not exists public.weekly_plan_items (
  id uuid primary key default gen_random_uuid(),
  weekly_plan_id uuid not null references public.weekly_plans(id) on delete cascade,
  plan_date date not null,
  dish_id uuid references public.dishes(id) on delete set null,
  custom_dish_name text,
  custom_base text,
  custom_preparation text,
  rations integer not null default 2 check (rations >= 0),
  skip_shopping boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (weekly_plan_id, plan_date),
  check (dish_id is not null or custom_dish_name is not null)
);

create table if not exists public.user_recipe_overrides (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  dish_id uuid references public.dishes(id) on delete cascade,
  weekly_plan_item_id uuid references public.weekly_plan_items(id) on delete cascade,
  ingredient_id uuid references public.ingredients(id) on delete restrict,
  custom_ingredient_name text,
  unit text,
  quantity numeric(10, 3),
  action text not null check (action in ('add_ingredient', 'remove_ingredient', 'update_quantity', 'update_step')),
  step_number integer,
  step_body text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  check (dish_id is not null or weekly_plan_item_id is not null)
);

create table if not exists public.shopping_lists (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  scope text not null check (scope in ('Diario', 'Semanal', 'Quincenal', 'Mensual')),
  date_from date not null,
  date_to date not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, scope, date_from, date_to)
);

create table if not exists public.shopping_list_items (
  id uuid primary key default gen_random_uuid(),
  shopping_list_id uuid not null references public.shopping_lists(id) on delete cascade,
  ingredient_id uuid references public.ingredients(id) on delete restrict,
  custom_product_name text,
  category text not null,
  unit text not null,
  quantity numeric(10, 3) not null default 1 check (quantity >= 0),
  checked boolean not null default false,
  uses text[] not null default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  check (ingredient_id is not null or custom_product_name is not null)
);

alter table public.profiles enable row level security;
alter table public.user_preferences enable row level security;
alter table public.user_dishes enable row level security;
alter table public.weekly_plans enable row level security;
alter table public.weekly_plan_items enable row level security;
alter table public.user_recipe_overrides enable row level security;
alter table public.shopping_lists enable row level security;
alter table public.shopping_list_items enable row level security;

alter table public.dishes enable row level security;
alter table public.ingredients enable row level security;
alter table public.dish_ingredients enable row level security;
alter table public.recipe_steps enable row level security;

create policy "Public dishes are readable" on public.dishes for select using (true);
create policy "Public ingredients are readable" on public.ingredients for select using (true);
create policy "Public dish ingredients are readable" on public.dish_ingredients for select using (true);
create policy "Public recipe steps are readable" on public.recipe_steps for select using (true);

create policy "Users manage own profile" on public.profiles
  for all using (auth.uid() = id) with check (auth.uid() = id);

create policy "Users manage own preferences" on public.user_preferences
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "Users manage own dish choices" on public.user_dishes
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "Users manage own weekly plans" on public.weekly_plans
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "Users read own weekly plan items" on public.weekly_plan_items
  for select using (
    exists (
      select 1 from public.weekly_plans p
      where p.id = weekly_plan_items.weekly_plan_id
      and p.user_id = auth.uid()
    )
  );

create policy "Users insert own weekly plan items" on public.weekly_plan_items
  for insert with check (
    exists (
      select 1 from public.weekly_plans p
      where p.id = weekly_plan_items.weekly_plan_id
      and p.user_id = auth.uid()
    )
  );

create policy "Users update own weekly plan items" on public.weekly_plan_items
  for update using (
    exists (
      select 1 from public.weekly_plans p
      where p.id = weekly_plan_items.weekly_plan_id
      and p.user_id = auth.uid()
    )
  ) with check (
    exists (
      select 1 from public.weekly_plans p
      where p.id = weekly_plan_items.weekly_plan_id
      and p.user_id = auth.uid()
    )
  );

create policy "Users delete own weekly plan items" on public.weekly_plan_items
  for delete using (
    exists (
      select 1 from public.weekly_plans p
      where p.id = weekly_plan_items.weekly_plan_id
      and p.user_id = auth.uid()
    )
  );

create policy "Users manage own recipe overrides" on public.user_recipe_overrides
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "Users manage own shopping lists" on public.shopping_lists
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "Users read own shopping list items" on public.shopping_list_items
  for select using (
    exists (
      select 1 from public.shopping_lists l
      where l.id = shopping_list_items.shopping_list_id
      and l.user_id = auth.uid()
    )
  );

create policy "Users insert own shopping list items" on public.shopping_list_items
  for insert with check (
    exists (
      select 1 from public.shopping_lists l
      where l.id = shopping_list_items.shopping_list_id
      and l.user_id = auth.uid()
    )
  );

create policy "Users update own shopping list items" on public.shopping_list_items
  for update using (
    exists (
      select 1 from public.shopping_lists l
      where l.id = shopping_list_items.shopping_list_id
      and l.user_id = auth.uid()
    )
  ) with check (
    exists (
      select 1 from public.shopping_lists l
      where l.id = shopping_list_items.shopping_list_id
      and l.user_id = auth.uid()
    )
  );

create policy "Users delete own shopping list items" on public.shopping_list_items
  for delete using (
    exists (
      select 1 from public.shopping_lists l
      where l.id = shopping_list_items.shopping_list_id
      and l.user_id = auth.uid()
    )
  );

grant usage on schema public to anon, authenticated;

grant select on
  public.dishes,
  public.ingredients,
  public.dish_ingredients,
  public.recipe_steps
to anon, authenticated;

grant select, insert, update, delete on
  public.profiles,
  public.user_preferences,
  public.user_dishes,
  public.weekly_plans,
  public.weekly_plan_items,
  public.user_recipe_overrides,
  public.shopping_lists,
  public.shopping_list_items
to authenticated;
