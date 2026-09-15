# Mercadeando Conversation History

Este documento funciona como memoria viva del proyecto. No pretende ser una transcripción literal de cada mensaje, sino un historial consultable de decisiones, criterios de diseño, bugs importantes, cambios realizados y próximos pasos.

## Proyecto

- Nombre: Mercadeando
- Objetivo: web app mobile-first para planificar almuerzos peruanos familiares y convertir el plan en una lista de compras editable.
- Usuario central: familias peruanas que cocinan en casa, compran en mercados de abastos y necesitan decidir qué cocinar sin convertir la app en una herramienta rígida de recetas.
- Principio clave: la compra es el centro; la receta es apoyo.

## Criterios De Diseño Recurrentes

- Respetar el Figma con mucho cuidado: tamaños, pesos, spacing, colores, iconos y componentes.
- Tipografía principal: DM Sans.
- Fondo general aproximado: `#FAFAF7`.
- Evitar azules inventados salvo donde existan explícitamente en diseño.
- No inventar iconos cuando existen SVGs en `assets/`.
- La UI debe sentirse mobile-first, simple, familiar y limpia.
- Los drawers deben mantener inputs blancos con sombra sutil y suficiente contraste respecto al fondo.
- Los fades deben evitar cortes bruscos de contenido y no comerse componentes en estado inicial.
- Motion: elegante, breve, útil para comunicar cambios de estado, no decorativo ni exagerado.

## Flujos Diseñados

### Onboarding

1. Login inicial con logo.
   - Google visible pero deshabilitado por ahora.
   - Invitado activo.
2. Bienvenida.
   - Usa asset `assets/welcome.png`.
3. Personas.
   - Selector más/menos, default 2.
4. Cómo comen.
   - Slider `poco`, `regular`, `taypa`.
   - Imagen de plato con contenedor cuadrado.
5. Frecuencia de compra.
   - Opciones actuales: `1 vez por semana`, `Cada 2 semanas`, `Todos los días`, `1 vez al mes`.
   - Se eliminó `2 veces por semana` por complejidad conceptual y de configuración.
6. Días sin cocinar.
   - Multi-selección.
   - El scroll no debe resetearse al seleccionar.
7. Días de cocina rápida.
   - Círculos con iniciales de días.
8. Variedad.
   - Slider `Práctica`, `Balanceada`, `Muy Variada`.
   - El texto no debe generar saltos visuales.
9. Selección de platos.
   - Interacción tipo Tinder con pila de cartas.
   - Swipe derecha acepta, izquierda rechaza.
   - Mínimo 20 platos para continuar.
   - La pila y el swipe funcionan bien y se pidió no tocar demasiado.

### App

La app tiene tres secciones principales:

- Semana
- Compras
- Ajustes

El navbar usa iconos desde `assets/figma-nav/` y el indicador verde debe desplazarse suavemente entre secciones.

## Semana

- El plan semanal muestra resumen de bases de platos.
- Internamente la planificación debe proyectarse a un mes para evitar repetición y permitir navegar semanas siguientes.
- Los días sin cocinar no deben mostrarse como plato normal.
- Para esos días se usa CTA `Planificar este día`.
- Si se planifica ese día, se genera un plato automáticamente sin romper el balance.
- Swipe lateral en tarjetas de días permite eliminar día, pero:
  - No aplica a días pasados.
  - No aplica a días sin planificar.
  - El bloque completo día + tarjeta debe moverse unido.
  - No debe quedar a medio abrir después de un gesto diagonal.

## Detalle Del Día

- Muestra plato, imagen, badges, favorito, cambiar plato, raciones, ingredientes y preparación.
- Si se expande ingredientes o preparación, la tarjeta del plato se compacta.
- Los acordeones no deben quedar cortados a media altura ni convertirse en scroll pequeño.
- Ingredientes y preparación deben verse como componentes completos, con stroke y cuatro esquinas redondeadas al expandir.
- Se corrigió un bug grave: la preparación sugerida estaba usando un fallback global de croquetas de atún para otros platos.
  - Ahora existen pasos en `dishSteps` para 62 platos.
  - `prepBody()` usa `recipeSteps(d)`.
  - Se eliminó el fallback viejo `recipe`.
- Crear plato nuevo:
  - Debe iniciar con ingredientes vacíos.
  - La tarjeta no tiene imagen y debe aparecer compacta.

## Compras

- La lista de compras debe derivarse del plan y de los ingredientes reales.
- Las cantidades deben escalar con personas y tamaño de porción.
- Las compras pueden verse por periodo:
  - Diario
  - Semanal
  - Quincenal
  - Mensual
- Se eliminó la opción `2 compras/semana` porque requeriría pedir días exactos y creaba demasiada ambigüedad.
- El fade superior de la lista de compras quedó funcionando bien.
- Los acordeones de compras funcionan mejor como referencia para el comportamiento deseado de secciones expandidas.
- `Más/Menos` en usos de ingredientes no debe resetear el scroll.
- La lista de platos donde se usa un ingrediente debe truncarse a una línea y ofrecer expandir cuando falte contenido.

## Ajustes

- Debe respetar la jerarquía visual de `Plan Semanal` y `Compras`.
- En mobile se rompió varias veces por falta de espacio; se ocultó temporalmente el resumen `Tu hogar` para recuperar altura.
- Cada drawer de ajustes debe replicar el diseño específico de Figma, no usar un drawer genérico inventado.
- Opciones:
  - Personas
  - Cómo comen
  - Platos considerados
  - Frecuencia de compra
  - Días sin cocinar
  - Variedad
  - Cerrar sesión
  - Eliminar cuenta

## Datos Actuales

- App principal: `app.html`.
- Datos globales hardcodeados actualmente:
  - `dishes`
  - `dishRecipes`
  - `dishSteps`
- Estado principal actual:
  - `state`
  - `planMonth`
  - `manualProducts`
- Se extrajeron los datos a `data/dishes.seed.json`.
- Hay 62 platos con ingredientes y pasos.

## Assets

- Assets UI principales: `assets/`.
- Imágenes de platos de trabajo: `imagenes-platos/`.
- Para producción se generó `public/imagenes-platos/webp/`.
- Optimización realizada:
  - 62 imágenes usadas por la app.
  - De aproximadamente 137.39 MB a 5.15 MB.

## Publicación Y Producción

Arquitectura objetivo:

- GitHub: repositorio del proyecto.
- Vercel: hosting.
- Supabase:
  - PostgreSQL
  - Auth
  - Anonymous Auth para invitado
  - Google OAuth
  - Storage para imágenes públicas de platos

No se quiere VPS ni API propia salvo necesidad real.

## Supabase

Se creó `supabase/schema.sql` para revisión, no ejecutado todavía.

Tablas contempladas:

- `profiles`
- `dishes`
- `ingredients`
- `dish_ingredients`
- `recipe_steps`
- `user_preferences`
- `user_dishes`
- `weekly_plans`
- `weekly_plan_items`
- `user_recipe_overrides`
- `shopping_lists`
- `shopping_list_items`

Reglas:

- Los platos globales no se duplican por usuario.
- Las modificaciones del usuario deben guardarse como overrides.
- RLS activo para datos de usuario.
- Nunca exponer `service_role` en frontend.
- Frontend solo debe usar anon/publishable key.

## Archivos De Producción Preparados

- `package.json`
- `.gitignore`
- `.env.example`
- `vercel.json`
- `docs/production-plan.md`
- `docs/conversation-history.md`
- `scripts/check-app.mjs`
- `scripts/extract-data.mjs`
- `scripts/build-public.mjs`
- `data/dishes.seed.json`
- `supabase/schema.sql`
- `public/`

## Comandos

```bash
npm run dev
npm run check
npm run extract:data
npm run build:public
```

## Último Estado Técnico Relevante

- `npm run extract:data` extrae 62 platos.
- `npm run build:public` genera WebP y `public/`.
- `npm run check` valida sintaxis JS y patrones sensibles básicos.
- `public/app.html` también fue validado con parseo JS.
- Este directorio todavía no era un repo Git al momento de la auditoría.

## Próximo Paso Manual Del Usuario

Crear un repositorio vacío en GitHub, idealmente privado, llamado `mercadeando` o `mercadeando-app`, y compartir la URL para inicializar Git y hacer el primer commit limpio.

Después: revisar `supabase/schema.sql` antes de crear/importar datos en Supabase.

## Pendientes Importantes

- Revisar y aprobar el SQL antes de ejecutarlo.
- Crear proyecto Supabase.
- Configurar Google OAuth dentro de Supabase.
- Implementar Anonymous Auth.
- Implementar guest to Google mediante `linkIdentity`.
- Migrar persistencia por fases:
  - onboarding
  - platos aceptados/rechazados
  - planes
  - overrides de recetas
  - listas de compras
- Subir imágenes finales a Supabase Storage o decidir si se mantienen servidas por Vercel en la fase inicial.
- QA con usuarios reales en iPhone, Android y desktop.
