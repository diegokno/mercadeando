# Recetas y restricciones

## Clasificacion principal de platos

Para balancear la semana no basta una categoria unica. Cada plato debe tener dos etiquetas visibles:

- Base principal: lo que mas se siente como repeticion alimentaria.
- Preparacion: la forma del plato o tecnica principal.

Ejemplo: Lomo saltado = `Res` + `Saltado`. Locro de pecho = `Res` + `Guiso`.

La categoria principal sigue sirviendo para ordenar el catalogo, pero el balance semanal debe mirar especialmente esas dos etiquetas visibles.

1. Guisos y estofados
2. Arroces
3. Pastas y fideos
4. Saltados
5. Menestras y granos
6. Sopas y caldos
7. Fritos y plancha
8. Platos frios / ensaladas
9. Cremas y salsas con base
10. Horno y fuente
11. Escabeches

Los filtros secundarios no reemplazan la categoria principal. Sirven para balancear, buscar o excluir:

- Proteina: pollo, res, cerdo, pescado, vegetariano.
- Base: arroz, papa, pasta, menestra, sopa/caldo, salsa/crema.
- Esfuerzo: rapido, medio, largo.
- Tecnica: olla, saltado, horno, fritura, frio.
- Region/estilo: peruano casero, arequipeno, andino/sur andino, criollo, chifa casero, italiano casero.

## Clasificacion de platos actual

Esta es la clasificacion operativa para el balance del menu semanal. La UI deberia mostrar principalmente `Base visible` + `Preparacion visible`; la categoria principal sirve para ordenar el catalogo y el balance interno queda para reglas, filtros y explicaciones secundarias.

| Plato | Base visible | Preparacion visible | Categoria principal | Balance interno |
|---|---|---|---|---|
| Aji de gallina | Pollo | Crema | Cremas y salsas con base | contundente, con arroz, con papa |
| Lomo saltado | Res | Saltado | Saltados | contundente, con arroz, con papa, fritura |
| Tallarin saltado | Res | Saltado | Saltados | pasta, chifa/criollo, rapido |
| Pollo al horno | Pollo | Horno | Horno y fuente | contundente, con arroz, con papa |
| Salpicon de pollo | Pollo | Frio | Platos frios / ensaladas | ligero, con papa, mayonesa |
| Lentejas | Menestra | Guiso | Menestras y granos | con arroz, olla |
| Porotos | Menestra | Guiso | Menestras y granos | con arroz, olla |
| Saltado de atun | Pescado | Saltado | Saltados | rapido, con arroz, con papa |
| Lawa de chuno | Res | Sopa | Sopas y caldos | andino, contundente |
| Tarwi | Menestra | Frio | Menestras y granos | andino, ligero |
| Caldo de pollo | Pollo | Sopa | Sopas y caldos | caldoso, ligero/medio |
| Torrejas de verduras arequipenas con arroz | Vegetariano | Frito | Fritos y plancha | con arroz, huevo |
| Soltero de queso | Vegetariano | Frio | Platos frios / ensaladas | arequipeno, queso |
| Pastel de berenjena | Res | Horno | Horno y fuente | con queso, fuente |
| Fetuccini en salsa roja | Res | Pasta | Pastas y fideos | salsa roja, casero |
| Arroz chaufa de pollo | Pollo | Arroz | Arroces | chifa, rapido |
| Aji de fideos / fideitos | Vegetariano | Pasta | Pastas y fideos | cremoso, con papa |
| Matasca | Res | Guiso | Guisos y estofados | con arroz, con papa |
| Estofado de pollo | Pollo | Guiso | Guisos y estofados | con arroz, con papa |
| Palta rellena | Pollo | Frio | Platos frios / ensaladas | ligero, mayonesa |
| Tallarin al pesto | Vegetariano | Pasta | Pastas y fideos | cremoso, verde |
| Higado frito con arroz | Res | Frito | Fritos y plancha | con arroz, con papa/pure |
| Bistec a lo pobre | Res | Plancha | Fritos y plancha | contundente, huevo, platano, papa |
| Arroz a la cubana | Vegetariano | Arroz | Arroces | huevo, rapido, platano |
| Chuleta de chancho al horno | Cerdo | Horno | Horno y fuente | con arroz, con papa |
| Chuleta de chancho frita con arroz y ensalada | Cerdo | Frito | Fritos y plancha | con arroz, con papa, ensalada |
| Chancho a la olla | Cerdo | Guiso | Guisos y estofados | con arroz, con papa |
| Seco de cerdo | Cerdo | Guiso | Guisos y estofados | con arroz, con papa |
| Croquetas de atun con arroz | Pescado | Frito | Fritos y plancha | atun en conserva, con arroz |
| Tallarines rojos con atun | Pescado | Pasta | Pastas y fideos | atun en conserva, salsa roja |
| Locro de zapallo | Vegetariano | Guiso | Guisos y estofados | con arroz, andino |
| Ocopa arequipena | Vegetariano | Crema | Cremas y salsas con base | arequipeno, frio, papa |
| Arroz tapado | Res | Arroz | Arroces | carne molida, huevo |
| Seco de res | Res | Guiso | Guisos y estofados | con arroz, con papa |
| Olluquito con carne | Res | Guiso | Guisos y estofados | andino, con arroz |
| Arroz con pollo | Pollo | Arroz | Arroces | criollo, culantro |
| Caigua rellena | Res | Relleno | Guisos y estofados | con arroz, verduras |
| Guiso de quinua | Menestra | Guiso | Menestras y granos | andino, con arroz |
| Pepian de choclo | Vegetariano | Crema | Cremas y salsas con base | con arroz, choclo |
| Tallarin rojo con pollo | Pollo | Pasta | Pastas y fideos | salsa roja |
| Arroz a la jardinera | Pollo | Arroz | Arroces | verduras, criollo |
| Arroz con chancho | Cerdo | Arroz | Arroces | contundente |
| Asado al vino | Res | Horno | Horno y fuente | largo, con pure |
| Asado de res con pure | Res | Horno | Horno y fuente | largo, con pure |
| Cau cau de pollo | Pollo | Guiso | Guisos y estofados | con arroz, con papa |
| Cauche de queso | Vegetariano | Crema | Cremas y salsas con base | arequipeno, queso, papa |
| Chaque | Res | Sopa | Sopas y caldos | arequipeno, contundente |
| Escabeche de pollo | Pollo | Escabeche | Escabeches | con arroz, avinagrado |
| Causa rellena de pollo | Pollo | Frio | Platos frios / ensaladas | papa amarilla, palta, mayonesa |
| Escabeche de pescado | Pescado | Escabeche | Escabeches | pescado frito, con arroz, camote, avinagrado |
| Malaya dorada | Res | Frito | Fritos y plancha | arequipeno, con arroz, con papa |
| Estofado de carne | Res | Guiso | Guisos y estofados | con arroz, con papa |
| Frejoles con seco de res | Menestra | Guiso | Menestras y granos | res, con arroz, contundente |
| Garbanzos con acelga | Menestra | Guiso | Menestras y granos | vegetal, acelga |
| Guiso de coliflor | Vegetariano | Guiso | Guisos y estofados | con arroz |
| Locro de pecho | Res | Guiso | Guisos y estofados | arequipeno, con arroz |
| Matasquita de pollo | Pollo | Guiso | Guisos y estofados | con arroz, con papa |
| Milanesa de pollo | Pollo | Frito | Fritos y plancha | con arroz, con papa |
| Papa rellena con arroz | Res | Frito | Fritos y plancha | relleno, con arroz |
| Rocoto relleno con pastel de papa | Res | Horno | Horno y fuente | arequipeno, ocasion |
| Seco de pollo | Pollo | Guiso | Guisos y estofados | con arroz, frejoles |
| Tallarines a la bolonesa | Res | Pasta | Pastas y fideos | salsa roja, carne molida |

## Reglas de balance sugeridas

- Variedad suave: no repetir plato; permite repetir base si cambia la preparacion.
- Variedad media: evitar repetir preparacion en dias seguidos; intentar no repetir base si hay opciones.
- Variedad alta: evitar repetir base y preparacion en dias seguidos.
- Si hoy es `Res + Saltado`, manana evitar primero otro `Saltado`; en variedad alta evitar tambien `Res`.
- Las tarjetas pueden mostrar solo `Base visible` y `Preparacion visible`. Lo demas queda para el algoritmo.

## Escala de porcion

Las recetas se guardan como cantidades por una porcion regular.

```js
portionScale = {
  poco: 0.75,
  regular: 1,
  taypa: 1.5
}
```

Calculo:

```js
cantidadFinal = cantidadPorPorcionRegular * personas * portionScale
```

## Restricciones como pills

La pregunta debe ser algo como: "Que quieres evitar?". Por eso las pills no llevan la palabra "sin".

### Recomendadas visibles al inicio

Estas son las mas utiles para mostrar primero, porque excluyen varios platos o ingredientes frecuentes.

- Res
- Pollo
- Cerdo
- Pescado / atun
- Higado / visceras
- Lacteos
- Huevo
- Mani / pecanas
- Gluten / harinas
- Sillao / soya
- Menestras
- Arroz
- Pasta / fideos
- Papa
- Aji / picante
- Cebolla
- Ajo
- Tomate
- Culantro
- Huacatay
- Frituras
- Horno

### Proteinas

- Res
- Pollo
- Cerdo
- Pescado / atun
- Higado / visceras
- Carne molida

### Lacteos, huevo y cremosos

- Lacteos
- Queso
- Leche evaporada
- Mantequilla
- Huevo
- Mayonesa

### Menestras, granos y semillas

- Menestras
- Lentejas
- Porotos / frejoles
- Garbanzos
- Tarwi
- Quinua
- Trigo / mote
- Mani / pecanas

### Abarrotes y bases

- Arroz
- Pasta / fideos
- Gluten / harinas
- Pan
- Galleta
- Pan rallado
- Sillao / soya

### Verduras, hierbas y condimentos sensibles

- Cebolla
- Ajo
- Tomate
- Aji / picante
- Rocoto
- Culantro
- Huacatay
- Albahaca
- Hierbabuena
- Kion

### Ingredientes especificos de la base actual

- Papa
- Camote
- Zapallo
- Choclo
- Habas
- Palta
- Platano bellaco
- Aceituna
- Pasas
- Vino
- Vinagre

### Restricciones practicas

- Frituras
- Horno
- Licuadora
- Remojo previo
- Platos frios
- Sopas / caldos
- Platos largos
- Platos de ocasion

## Prototipo de seleccion sin agobio

El flujo debe sentirse como una seleccion guiada, no como un formulario enorme.

### Pantalla

Titulo:

> Hay algo que prefieres evitar?

Texto corto:

> Elige solo lo que realmente importa. Puedes cambiarlo despues.

Buscador:

> Buscar ingrediente o restriccion

Fila de seleccion actual:

> Seleccionaste: Res, Mani / pecanas

Secciones plegables:

1. Mas comunes
2. Proteinas
3. Lacteos y huevo
4. Menestras y granos
5. Bases y abarrotes
6. Verduras y condimentos
7. Practicas de cocina

Por defecto, solo "Mas comunes" aparece abierta. Las demas se abren si el usuario busca o toca "Ver mas".

### Comportamiento

- Cada pill es toggle.
- Al seleccionar una restriccion amplia, se pueden marcar internamente ingredientes relacionados.
- Ejemplo: "Lacteos" cubre queso, leche evaporada y mantequilla.
- Si el usuario busca "queso", aparece "Queso" y tambien se sugiere "Lacteos".
- Si una restriccion descarta muchos platos, mostrar una nota breve:

> Esto quitara varios platos con pollo.

- Si una restriccion no afecta ningun plato activo, no debe mostrarse en la lista principal.

### Estructura sugerida de datos

```js
{
  id: "lacteos",
  label: "Lacteos",
  group: "Lacteos y huevo",
  aliases: ["leche", "queso", "mantequilla"],
  ingredientMatches: ["queso fresco", "queso rallado", "leche evaporada", "mantequilla"],
  dishTagMatches: [],
  priority: "common"
}
```
