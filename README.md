# Mercadeando

Web app mobile-first para planificar almuerzos peruanos y convertir el plan en una lista de compras editable.

## Estado actual

La app principal sigue siendo una implementación simple en HTML/CSS/JavaScript vanilla:

- Fuente de trabajo: `app.html`
- Servidor local: `local-server.js`
- Datos extraídos: `data/dishes.seed.json`
- Build publicable: `public/`
- Esquema Supabase pendiente de revisión: `supabase/schema.sql`
- Historial del proyecto: `docs/conversation-history.md`
- Contexto obligatorio para Codex: `CODEX_CONTEXT.md`

No hay backend conectado todavía. La versión actual funciona como prototipo local y el estado vive en memoria del navegador.

## Comandos

```bash
npm run dev
```

Levanta la app local en `http://localhost:8000/app.html`. Por defecto sirve `public/`, que contiene el bundle optimizado.

```bash
npm run extract:data
```

Extrae platos, ingredientes y pasos desde `app.html` hacia `data/dishes.seed.json`.

```bash
npm run build:public
```

Genera `public/` para Vercel, copia assets necesarios y optimiza las imágenes finales de platos a WebP.

```bash
npm run check
```

Verifica que el JavaScript embebido en `app.html` parsea correctamente y busca patrones sensibles básicos.

## Producción

La arquitectura objetivo es:

- Hosting/frontend: Vercel
- Repositorio: GitHub
- Backend, Auth, PostgreSQL y Storage: Supabase
- Login invitado: Supabase Anonymous Auth
- Login Google: Supabase Google OAuth

Nunca exponer una `service_role` key en frontend. El cliente debe usar solo la publishable/anon key.
