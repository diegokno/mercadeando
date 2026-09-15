# Codex Context For Mercadeando

Antes de trabajar en Mercadeando, Codex debe leer este archivo y, si la tarea toca decisiones previas, consultar:

- `docs/codex-thread-transcript.md`
- `docs/conversation-history.md`
- `docs/production-plan.md`

## Propósito

Este archivo no es documentación para el usuario. Es memoria operativa para Codex.

Diego pidió explícitamente que se conserve el historial de lo conversado para que, aunque el chat crezca o se compacte, Codex pueda volver a consultar el contexto desde el inicio del proyecto.

## Fuente Principal

`docs/codex-thread-transcript.md` contiene una exportación local del historial del task de Codex `019fa646-45f4-76b3-96be-3031c7de5bdd`.

También existe `docs/codex-thread-transcript.jsonl`, que es la exportación cruda completa en JSONL. Ese archivo es local y pesado; no debe tratarse como archivo publicable ni subirse al deploy.

## Cómo Usarlo

1. Para decisiones de producto, UX, diseño o lógica, buscar primero en `docs/codex-thread-transcript.md`.
2. Para una versión compacta de decisiones y estado actual, leer `docs/conversation-history.md`.
3. Para publicación y Supabase, leer `docs/production-plan.md` y `supabase/schema.sql`.
4. No contradecir decisiones previas sin avisarle a Diego.
5. No inventar diseño, iconos, colores ni lógica cuando ya fue definido antes.

## Criterio De Fidelidad

Diego no quiere que este historial sea solo un resumen bonito. Quiere que sirva para recordar matices concretos de la conversación. Cuando haya duda, preferir buscar texto literal en el transcript antes de asumir.
