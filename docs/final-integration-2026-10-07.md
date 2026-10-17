# Integracion de la revision final

## Ajustes del 16 de octubre

Tarjetas en orden Fisher-Yates aleatorio por nueva seleccion, estable mientras se responde/deshace. Control de deshacer centrado entre No y Si segun Figma 12469:25048, con su SVG local original. Cambios aleatorios del plan: primeras dos opciones ordenadas por variedad, repeticion, familia de plato y vecinos de ambos lados (tambien al cruzar semanas); siguientes aleatorias sin repetir hasta agotar el conjunto elegible. Las preferencias, temporada y dias rapidos se mantienen. Las sesiones de alternativas se reinician si cambia el contexto del dia.

- 135 activos: se archivaron Caldo de pollo e Higado frito con arroz en favor de Sopa de Pollo e Higado Encebollado con Pure de A Comer. Los planes previos se redirigen mediante alias, sin mezclar ingredientes antiguos con la receta ganadora.
- Matasquita se llama Picante de pollo (mataska). Picante de Carne es otro plato y permanece independiente. Pollo a la Coca-Cola recupera su nombre.
- Compras excluye fechas pasadas y conserva el inicio del plan al refrescar. El check y los cambios de cantidad mantienen el scroll.
- Presentacion de compras: una medida, redondeo hacia arriba para no comprar de menos, medios para cantidades pequenas por unidad y escalones de 50 g/ml. Recetas sin redondear. Liquidos: taza domestica de 240 ml. Unidades incompatibles no se convierten sin evidencia: se indica Por definir y el usuario puede editar; cantidades cualitativas: Al gusto.
- Tarjetas: contador arriba a la derecha, titulo de dos lineas al fondo, deshacer ultima eleccion.
- Favicon SVG basado en la M original e icono PNG para iPhone. Prototipo separado en /review-changes.html, sin alterar el progreso real.

## Estado local

- Exportacion original conservada sin modificar: 141 revisiones verificadas.
- Catalogo activo: 137 platos. Los cuatro descartados siguen archivados, no eliminados.
- Recetas aprobadas de A Comer conservadas, salvo correcciones expresas del usuario.
- Adaptaciones de la base antigua documentadas con fuente, rendimiento original y base de dos porciones regulares.
- 82 imagenes generadas desde referencias aprobadas; 55 conservadas. Build: 137 imagenes WebP, aproximadamente 12 MB en total.
- Ingredientes canonicos compartidos por recetas y compras. Basicos de despensa y opcionales excluidos de compras. Cantidades desconocidas se muestran como tales, no como cero.
- Conversion del arroz seco: 1 taza = 180 g. No se inventan conversiones de hojas a cabezas, atados a gramos ni latas sin peso declarado.
- Planificador con busqueda acotada: variedad, exclusiones, dias rapidos, dias sin cocinar, temporada y reutilizacion de sobrantes segun unidad compatible, ventana de compra y frescura estimada. No es una garantia de optimo global ni de conservacion de alimentos.
- Plan local persistente por usuario; sincronizacion remota preparada, pendiente de migracion.

## Pendientes editoriales

Guiso de Quinua y Arroz con Pollo y Huancaina corregidos contra sus fuentes con autorizacion posterior del usuario. Ingredientes y cantidades aprobados conservados; los enlaces de referencia ya no se muestran en la app.

Pollo al horno y Chuleta frita tienen menciones genericas de ensalada sin composicion aprobada. No se inventaron ingredientes para ellas. La chuleta incorpora las papas solicitadas, pero su solicitud de revision de fuente sigue registrada como pendiente.

Algunas cantidades editoriales o no especificadas por las fuentes siguen marcadas como inferidas/desconocidas; no deben presentarse como medidas verificadas de la fuente.

## Verificacion

`node scripts/test-final-catalog.cjs` valida el catalogo, las recetas protegidas, conversiones, despensa, sobrantes, temporadas, exclusiones, dias rapidos/sin cocina y ocho tamanos de hogar.

`node scripts/check-app.mjs` valida sintaxis. Se probaron plan, compras, recetas y recuperacion al refrescar en navegador local; capturas desktop, iPad y movil en la carpeta privada de integracion.

## Publicacion pendiente

No se ejecuto SQL remoto, no se hizo push ni despliegue. La migracion preparada es `supabase/final-catalog-2026-10-07.sql`: transaccion, upserts de catalogo y tabla de snapshots con RLS por usuario; conserva tablas de datos del usuario. Revisar y aplicar en Supabase antes de probar sincronizacion autenticada. Esta migracion no fue ejecutada contra PostgreSQL en esta sesion.

Reproduccion del build local:

```powershell
python scripts/integrate-final-review.py
node scripts/generate-final-catalog-sql.cjs
node scripts/test-final-catalog.cjs
node scripts/check-app.mjs
node scripts/build-public.mjs
```

El build normal rechaza imagenes pendientes. No incluir exportaciones privadas, audios, modelos ni referencias descargadas en un commit/publicacion.
