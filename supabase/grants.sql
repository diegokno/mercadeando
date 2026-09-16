-- Mercadeando Data API grants
-- Run this after schema.sql when Supabase tables are not auto-exposed.

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
