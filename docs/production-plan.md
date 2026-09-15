# Mercadeando Production Plan

## Current Source

- Working prototype: `app.html`
- Local static server: `npm run dev`
- Production bundle: `npm run build:public`
- Deploy output: `public/`

## Phase Order

1. Clean static deploy bundle and optimize public assets.
2. Extract recipe data into reproducible seed files.
3. Review and approve Supabase SQL schema.
4. Create Supabase project and configure Auth/Storage.
5. Import global dishes, ingredients, recipe steps, and images.
6. Add Supabase client with Anonymous Auth and Google OAuth.
7. Persist user preferences, selected dishes, weekly plans, overrides, and shopping lists.
8. Connect GitHub to Vercel and deploy from `public/`.

## Manual Values Needed Later

- Supabase project URL
- Supabase publishable/anon key
- Google OAuth client ID and secret configured inside Supabase
- Production domain for redirect URLs

Never expose a Supabase `service_role` key in the frontend.
