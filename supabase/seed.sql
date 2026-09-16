-- Mercadeando seed data
-- Generated from data/dishes.seed.json.
-- Safe to run more than once.

begin;

insert into public.dishes (
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
  ('aji-de-gallina', 'Ají de gallina', 'Pollo', 'Crema', 'pollo', 'crema', 'imagenes-platos/webp/aji-de-gallina.webp', null, true),
  ('lomo-saltado', 'Lomo saltado', 'Res', 'Saltado', 'res', 'saltado', 'imagenes-platos/webp/lomo-saltado.webp', null, true),
  ('tallarin-saltado', 'Tallarín saltado', 'Res', 'Saltado', 'res', 'saltado', 'imagenes-platos/webp/tallarin-saltado.webp', null, true),
  ('pollo-al-horno', 'Pollo al horno', 'Pollo', 'Horno', 'pollo', 'horno', 'imagenes-platos/webp/pollo-al-horno.webp', null, true),
  ('salpicon-de-pollo', 'Salpicón de pollo', 'Pollo', 'Frío', 'pollo', 'frio', 'imagenes-platos/webp/salpicon-de-pollo.webp', null, true),
  ('lentejas', 'Lentejas', 'Menestra', 'Guiso', 'menestra', 'guiso', 'imagenes-platos/webp/lentejas.webp', null, true),
  ('porotos', 'Porotos', 'Menestra', 'Guiso', 'menestra', 'guiso', 'imagenes-platos/webp/porotos.webp', null, true),
  ('saltado-de-atun', 'Saltado de atún', 'Pescado', 'Saltado', 'pescado', 'saltado', 'imagenes-platos/webp/saltado-de-atun.webp', null, true),
  ('lawa-de-chuno', 'Lawa de chuño', 'Res', 'Sopa', 'res', 'sopa', 'imagenes-platos/webp/lawa-de-chuno.webp', null, true),
  ('tarwi', 'Tarwi', 'Menestra', 'Frío', 'menestra', 'frio', 'imagenes-platos/webp/tarwi.webp', null, true),
  ('caldo-de-pollo', 'Caldo de pollo', 'Pollo', 'Sopa', 'pollo', 'sopa', 'imagenes-platos/webp/caldo-de-pollo.webp', null, true),
  ('torrejas-de-verduras-arequipenas-con-arroz', 'Torrejas de verduras arequipeñas con arroz', 'Vegetariano', 'Frito', 'vegetariano', 'frito', 'imagenes-platos/webp/torrejas-de-verduras-arequipenas-con-arroz.webp', null, true),
  ('soltero-de-queso', 'Soltero de queso', 'Vegetariano', 'Frío', 'vegetariano', 'frio', 'imagenes-platos/webp/soltero-de-queso.webp', null, true),
  ('pastel-de-berenjena', 'Pastel de berenjena', 'Res', 'Horno', 'res', 'horno', 'imagenes-platos/webp/pastel-de-berenjena.webp', null, true),
  ('fetuccini-en-salsa-roja', 'Fetuccini en salsa roja', 'Res', 'Pasta', 'res', 'pasta', 'imagenes-platos/webp/fetuccini-en-salsa-roja.webp', null, true),
  ('arroz-chaufa-de-pollo', 'Arroz chaufa de pollo', 'Pollo', 'Arroz', 'pollo', 'arroz', 'imagenes-platos/webp/arroz-chaufa-de-pollo.webp', null, true),
  ('aji-de-fideos-fideitos', 'Ají de fideos / fideitos', 'Vegetariano', 'Pasta', 'vegetariano', 'pasta', 'imagenes-platos/webp/aji-de-fideos-fideitos.webp', null, true),
  ('matasca', 'Matasca', 'Res', 'Guiso', 'res', 'guiso', 'imagenes-platos/webp/matasca.webp', null, true),
  ('estofado-de-pollo', 'Estofado de pollo', 'Pollo', 'Guiso', 'pollo', 'guiso', 'imagenes-platos/webp/estofado-de-pollo.webp', null, true),
  ('palta-rellena', 'Palta rellena', 'Pollo', 'Frío', 'pollo', 'frio', 'imagenes-platos/webp/palta-rellena.webp', null, true),
  ('tallarin-al-pesto', 'Tallarín al pesto', 'Vegetariano', 'Pasta', 'vegetariano', 'pasta', 'imagenes-platos/webp/tallarin-al-pesto.webp', null, true),
  ('higado-frito-con-arroz', 'Hígado frito con arroz', 'Res', 'Frito', 'res', 'frito', 'imagenes-platos/webp/higado-frito-con-arroz.webp', null, true),
  ('bistec-a-lo-pobre', 'Bistec a lo pobre', 'Res', 'Plancha', 'res', 'plancha', 'imagenes-platos/webp/bistec-a-lo-pobre.webp', null, true),
  ('arroz-a-la-cubana', 'Arroz a la cubana', 'Vegetariano', 'Arroz', 'vegetariano', 'arroz', 'imagenes-platos/webp/arroz-a-la-cubana.webp', null, true),
  ('locro-de-zapallo', 'Locro de zapallo', 'Vegetariano', 'Guiso', 'vegetariano', 'guiso', 'imagenes-platos/webp/locro-de-zapallo.webp', null, true),
  ('ocopa-arequipena', 'Ocopa arequipeña', 'Vegetariano', 'Crema', 'vegetariano', 'crema', 'imagenes-platos/webp/ocopa-arequipena.webp', null, true),
  ('arroz-tapado', 'Arroz tapado', 'Res', 'Arroz', 'res', 'arroz', 'imagenes-platos/webp/arroz-tapado.webp', null, true),
  ('seco-de-res', 'Seco de res', 'Res', 'Guiso', 'res', 'guiso', 'imagenes-platos/webp/seco-de-res.webp', null, true),
  ('olluquito-con-carne', 'Olluquito con carne', 'Res', 'Guiso', 'res', 'guiso', 'imagenes-platos/webp/olluquito-con-carne.webp', null, true),
  ('arroz-con-pollo', 'Arroz con pollo', 'Pollo', 'Arroz', 'pollo', 'arroz', 'imagenes-platos/webp/arroz-con-pollo.webp', null, true),
  ('caigua-rellena', 'Caigua rellena', 'Res', 'Relleno', 'res', 'relleno', 'imagenes-platos/webp/caigua-rellena.webp', null, true),
  ('guiso-de-quinua', 'Guiso de quinua', 'Menestra', 'Guiso', 'menestra', 'guiso', 'imagenes-platos/webp/guiso-de-quinua.webp', null, true),
  ('pepian-de-choclo', 'Pepián de choclo', 'Vegetariano', 'Crema', 'vegetariano', 'crema', 'imagenes-platos/webp/pepian-de-choclo.webp', null, true),
  ('tallarin-rojo-con-pollo', 'Tallarín rojo con pollo', 'Pollo', 'Pasta', 'pollo', 'pasta', 'imagenes-platos/webp/tallarin-rojo-con-pollo.webp', null, true),
  ('arroz-a-la-jardinera', 'Arroz a la jardinera', 'Pollo', 'Arroz', 'pollo', 'arroz', 'imagenes-platos/webp/arroz-a-la-jardinera.webp', null, true),
  ('arroz-con-chancho', 'Arroz con chancho', 'Cerdo', 'Arroz', 'cerdo', 'arroz', 'imagenes-platos/webp/arroz-con-chancho.webp', null, true),
  ('asado-al-vino', 'Asado al vino', 'Res', 'Horno', 'res', 'horno', 'imagenes-platos/webp/asado-al-vino.webp', null, true),
  ('asado-de-res-con-pure', 'Asado de res con puré', 'Res', 'Horno', 'res', 'horno', 'imagenes-platos/webp/asado-de-res-con-pure.webp', null, true),
  ('cau-cau-de-pollo', 'Cau cau de pollo', 'Pollo', 'Guiso', 'pollo', 'guiso', 'imagenes-platos/webp/cau-cau-de-pollo.webp', null, true),
  ('cauche-de-queso', 'Cauche de queso', 'Vegetariano', 'Crema', 'vegetariano', 'crema', 'imagenes-platos/webp/cauche-de-queso.webp', null, true),
  ('chaque', 'Chaque', 'Res', 'Sopa', 'res', 'sopa', 'imagenes-platos/webp/chaque.webp', null, true),
  ('escabeche-de-pollo', 'Escabeche de pollo', 'Pollo', 'Escabeche', 'pollo', 'escabeche', 'imagenes-platos/webp/escabeche-de-pollo.webp', null, true),
  ('causa-rellena-de-pollo', 'Causa rellena de pollo', 'Pollo', 'Frío', 'pollo', 'frio', 'imagenes-platos/webp/causa-rellena-de-pollo.webp', null, true),
  ('escabeche-de-pescado', 'Escabeche de pescado', 'Pescado', 'Escabeche', 'pescado', 'escabeche', 'imagenes-platos/webp/escabeche-de-pescado.webp', null, true),
  ('malaya-dorada', 'Malaya dorada', 'Res', 'Frito', 'res', 'frito', 'imagenes-platos/webp/malaya-dorada.webp', null, true),
  ('estofado-de-carne', 'Estofado de carne', 'Res', 'Guiso', 'res', 'guiso', 'imagenes-platos/webp/estofado-de-carne.webp', null, true),
  ('frejoles-con-seco-de-res', 'Frejoles con seco de res', 'Menestra', 'Guiso', 'menestra', 'guiso', 'imagenes-platos/webp/frejoles-con-seco-de-res.webp', null, true),
  ('garbanzos-con-acelga', 'Garbanzos con acelga', 'Menestra', 'Guiso', 'menestra', 'guiso', 'imagenes-platos/webp/garbanzos-con-acelga.webp', null, true),
  ('guiso-de-coliflor', 'Guiso de coliflor', 'Vegetariano', 'Guiso', 'vegetariano', 'guiso', 'imagenes-platos/webp/guiso-de-coliflor.webp', null, true),
  ('locro-de-pecho', 'Locro de pecho', 'Res', 'Guiso', 'res', 'guiso', 'imagenes-platos/webp/locro-de-pecho.webp', null, true),
  ('matasquita-de-pollo', 'Matasquita de pollo', 'Pollo', 'Guiso', 'pollo', 'guiso', 'imagenes-platos/webp/matasquita-de-pollo.webp', null, true),
  ('milanesa-de-pollo', 'Milanesa de pollo', 'Pollo', 'Frito', 'pollo', 'frito', 'imagenes-platos/webp/milanesa-de-pollo.webp', null, true),
  ('papa-rellena-con-arroz', 'Papa rellena con arroz', 'Res', 'Frito', 'res', 'frito', 'imagenes-platos/webp/papa-rellena-con-arroz.webp', null, true),
  ('rocoto-relleno-con-pastel-de-papa', 'Rocoto relleno con pastel de papa', 'Res', 'Horno', 'res', 'horno', 'imagenes-platos/webp/rocoto-relleno-con-pastel-de-papa.webp', null, true),
  ('seco-de-pollo', 'Seco de pollo', 'Pollo', 'Guiso', 'pollo', 'guiso', 'imagenes-platos/webp/seco-de-pollo.webp', null, true),
  ('tallarines-a-la-bolonesa', 'Tallarines a la boloñesa', 'Res', 'Pasta', 'res', 'pasta', 'imagenes-platos/webp/tallarines-a-la-bolonesa.webp', null, true),
  ('chuleta-de-chancho-al-horno', 'Chuleta de chancho al horno', 'Cerdo', 'Horno', 'cerdo', 'horno', 'imagenes-platos/webp/chuleta-de-chancho-al-horno.webp', null, true),
  ('chuleta-de-chancho-frita-con-arroz-y-ensalada', 'Chuleta de chancho frita con arroz y ensalada', 'Cerdo', 'Frito', 'cerdo', 'frito', 'imagenes-platos/webp/chuleta-de-chancho-frita-con-arroz-y-ensalada.webp', null, true),
  ('chancho-a-la-olla', 'Chancho a la olla', 'Cerdo', 'Guiso', 'cerdo', 'guiso', 'imagenes-platos/webp/chancho-a-la-olla.webp', null, true),
  ('seco-de-cerdo', 'Seco de cerdo', 'Cerdo', 'Guiso', 'cerdo', 'guiso', 'imagenes-platos/webp/seco-de-cerdo.webp', null, true),
  ('croquetas-de-atun-con-arroz', 'Croquetas de atún con arroz', 'Pescado', 'Frito', 'pescado', 'frito', 'imagenes-platos/webp/croquetas-de-atun-con-arroz.webp', null, true),
  ('tallarines-rojos-con-atun', 'Tallarines rojos con atún', 'Pescado', 'Pasta', 'pescado', 'pasta', 'imagenes-platos/webp/tallarines-rojos-con-atun.webp', null, true)
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

insert into public.ingredients (
  name,
  default_unit,
  category
) values
  ('Aceite', 'ml', 'abarrotes'),
  ('Aceituna', 'unid', 'abarrotes'),
  ('Acelga', 'unidad', 'verduras'),
  ('Ají amarillo', 'unid', 'verduras'),
  ('Ají panca', 'unid', 'verduras'),
  ('Ajo', 'unidad', 'verduras'),
  ('Albahaca', 'unidad', 'abarrotes'),
  ('Apio', 'unidad', 'verduras'),
  ('Arroz', 'kg', 'abarrotes'),
  ('Arveja', 'taza', 'verduras'),
  ('Atún', 'lata', 'pescados'),
  ('Berenjena', 'unid', 'verduras'),
  ('Bistec de res', 'kg', 'carnes'),
  ('Caigua', 'unid', 'verduras'),
  ('Camote', 'unid', 'abarrotes'),
  ('Carne de res', 'kg', 'carnes'),
  ('Carne molida', 'kg', 'carnes'),
  ('Cebolla china', 'unidad', 'verduras'),
  ('Cebolla roja', 'unid', 'verduras'),
  ('Cerdo', 'kg', 'abarrotes'),
  ('Choclo', 'unid', 'verduras'),
  ('Chuleta de chancho', 'kg', 'abarrotes'),
  ('Chuño', 'kg', 'abarrotes'),
  ('Coliflor', 'unidad', 'verduras'),
  ('Culantro', 'unidad', 'verduras'),
  ('Ensalada', 'unidad', 'abarrotes'),
  ('Espinaca', 'unidad', 'verduras'),
  ('Fetuccini', 'paquete', 'abarrotes'),
  ('Fideo', 'taza', 'abarrotes'),
  ('Frejol', 'kg', 'menestras'),
  ('Garbanzo', 'kg', 'menestras'),
  ('Haba', 'taza', 'abarrotes'),
  ('Harina', 'taza', 'abarrotes'),
  ('Hierbabuena', 'unidad', 'abarrotes'),
  ('Hígado de res', 'kg', 'carnes'),
  ('Huevo', 'unid', 'avícolas'),
  ('Leche', 'taza', 'lácteos'),
  ('Lenteja', 'kg', 'menestras'),
  ('Limón', 'unid', 'verduras'),
  ('Lomo de res', 'kg', 'carnes'),
  ('Malaya de res', 'kg', 'carnes'),
  ('Maní', 'taza', 'abarrotes'),
  ('Mantequilla', 'g', 'lácteos'),
  ('Mayonesa', 'taza', 'abarrotes'),
  ('Olluco', 'kg', 'verduras'),
  ('Palta', 'unid', 'verduras'),
  ('Pan', 'unid', 'abarrotes'),
  ('Pan rallado', 'taza', 'abarrotes'),
  ('Papa', 'unid', 'verduras'),
  ('Papa amarilla', 'unid', 'verduras'),
  ('Pecho de res', 'kg', 'carnes'),
  ('Pechuga de pollo', 'presa', 'avícolas'),
  ('Pescado', 'kg', 'pescados'),
  ('Plátano', 'unid', 'abarrotes'),
  ('Pollo', 'presa', 'avícolas'),
  ('Queso', 'g', 'lácteos'),
  ('Queso fresco', 'g', 'carnes'),
  ('Quinua', 'kg', 'abarrotes'),
  ('Rocoto', 'unid', 'verduras'),
  ('Sillao', 'ml', 'abarrotes'),
  ('Tallarín', 'paquete', 'abarrotes'),
  ('Tarwi', 'kg', 'menestras'),
  ('Tomate', 'unid', 'verduras'),
  ('Trigo', 'taza', 'abarrotes'),
  ('Verduras', 'unidad', 'abarrotes'),
  ('Vinagre', 'ml', 'abarrotes'),
  ('Vino', 'taza', 'abarrotes'),
  ('Zanahoria', 'unid', 'verduras'),
  ('Zapallito italiano', 'unid', 'abarrotes'),
  ('Zapallo', 'kg', 'verduras')
on conflict (name) do update set
  default_unit = excluded.default_unit,
  category = excluded.category;

delete from public.recipe_steps
using public.dishes
where recipe_steps.dish_id = dishes.id
  and dishes.slug in ('aji-de-gallina', 'lomo-saltado', 'tallarin-saltado', 'pollo-al-horno', 'salpicon-de-pollo', 'lentejas', 'porotos', 'saltado-de-atun', 'lawa-de-chuno', 'tarwi', 'caldo-de-pollo', 'torrejas-de-verduras-arequipenas-con-arroz', 'soltero-de-queso', 'pastel-de-berenjena', 'fetuccini-en-salsa-roja', 'arroz-chaufa-de-pollo', 'aji-de-fideos-fideitos', 'matasca', 'estofado-de-pollo', 'palta-rellena', 'tallarin-al-pesto', 'higado-frito-con-arroz', 'bistec-a-lo-pobre', 'arroz-a-la-cubana', 'locro-de-zapallo', 'ocopa-arequipena', 'arroz-tapado', 'seco-de-res', 'olluquito-con-carne', 'arroz-con-pollo', 'caigua-rellena', 'guiso-de-quinua', 'pepian-de-choclo', 'tallarin-rojo-con-pollo', 'arroz-a-la-jardinera', 'arroz-con-chancho', 'asado-al-vino', 'asado-de-res-con-pure', 'cau-cau-de-pollo', 'cauche-de-queso', 'chaque', 'escabeche-de-pollo', 'causa-rellena-de-pollo', 'escabeche-de-pescado', 'malaya-dorada', 'estofado-de-carne', 'frejoles-con-seco-de-res', 'garbanzos-con-acelga', 'guiso-de-coliflor', 'locro-de-pecho', 'matasquita-de-pollo', 'milanesa-de-pollo', 'papa-rellena-con-arroz', 'rocoto-relleno-con-pastel-de-papa', 'seco-de-pollo', 'tallarines-a-la-bolonesa', 'chuleta-de-chancho-al-horno', 'chuleta-de-chancho-frita-con-arroz-y-ensalada', 'chancho-a-la-olla', 'seco-de-cerdo', 'croquetas-de-atun-con-arroz', 'tallarines-rojos-con-atun');

delete from public.dish_ingredients
using public.dishes
where dish_ingredients.dish_id = dishes.id
  and dishes.slug in ('aji-de-gallina', 'lomo-saltado', 'tallarin-saltado', 'pollo-al-horno', 'salpicon-de-pollo', 'lentejas', 'porotos', 'saltado-de-atun', 'lawa-de-chuno', 'tarwi', 'caldo-de-pollo', 'torrejas-de-verduras-arequipenas-con-arroz', 'soltero-de-queso', 'pastel-de-berenjena', 'fetuccini-en-salsa-roja', 'arroz-chaufa-de-pollo', 'aji-de-fideos-fideitos', 'matasca', 'estofado-de-pollo', 'palta-rellena', 'tallarin-al-pesto', 'higado-frito-con-arroz', 'bistec-a-lo-pobre', 'arroz-a-la-cubana', 'locro-de-zapallo', 'ocopa-arequipena', 'arroz-tapado', 'seco-de-res', 'olluquito-con-carne', 'arroz-con-pollo', 'caigua-rellena', 'guiso-de-quinua', 'pepian-de-choclo', 'tallarin-rojo-con-pollo', 'arroz-a-la-jardinera', 'arroz-con-chancho', 'asado-al-vino', 'asado-de-res-con-pure', 'cau-cau-de-pollo', 'cauche-de-queso', 'chaque', 'escabeche-de-pollo', 'causa-rellena-de-pollo', 'escabeche-de-pescado', 'malaya-dorada', 'estofado-de-carne', 'frejoles-con-seco-de-res', 'garbanzos-con-acelga', 'guiso-de-coliflor', 'locro-de-pecho', 'matasquita-de-pollo', 'milanesa-de-pollo', 'papa-rellena-con-arroz', 'rocoto-relleno-con-pastel-de-papa', 'seco-de-pollo', 'tallarines-a-la-bolonesa', 'chuleta-de-chancho-al-horno', 'chuleta-de-chancho-frita-con-arroz-y-ensalada', 'chancho-a-la-olla', 'seco-de-cerdo', 'croquetas-de-atun-con-arroz', 'tallarines-rojos-con-atun');

insert into public.dish_ingredients (
  dish_id,
  ingredient_id,
  quantity,
  unit,
  sort_order
)
select d.id, i.id, 2, 'presa', 1
from public.dishes d
join public.ingredients i on i.name = 'Pechuga de pollo'
where d.slug = 'aji-de-gallina'
union all
select d.id, i.id, 2, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Ají amarillo'
where d.slug = 'aji-de-gallina'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Pan'
where d.slug = 'aji-de-gallina'
union all
select d.id, i.id, 1, 'taza', 4
from public.dishes d
join public.ingredients i on i.name = 'Leche'
where d.slug = 'aji-de-gallina'
union all
select d.id, i.id, 2, 'unid', 5
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'aji-de-gallina'
union all
select d.id, i.id, 2, 'unid', 6
from public.dishes d
join public.ingredients i on i.name = 'Huevo'
where d.slug = 'aji-de-gallina'
union all
select d.id, i.id, 4, 'unid', 7
from public.dishes d
join public.ingredients i on i.name = 'Aceituna'
where d.slug = 'aji-de-gallina'
union all
select d.id, i.id, 0.35, 'kg', 8
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'aji-de-gallina'
union all
select d.id, i.id, 0.45, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Lomo de res'
where d.slug = 'lomo-saltado'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'lomo-saltado'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'lomo-saltado'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Tomate'
where d.slug = 'lomo-saltado'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'lomo-saltado'
union all
select d.id, i.id, 60, 'ml', 6
from public.dishes d
join public.ingredients i on i.name = 'Sillao'
where d.slug = 'lomo-saltado'
union all
select d.id, i.id, 1, 'paquete', 1
from public.dishes d
join public.ingredients i on i.name = 'Tallarín'
where d.slug = 'tallarin-saltado'
union all
select d.id, i.id, 0.35, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Carne de res'
where d.slug = 'tallarin-saltado'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'tallarin-saltado'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Tomate'
where d.slug = 'tallarin-saltado'
union all
select d.id, i.id, 60, 'ml', 5
from public.dishes d
join public.ingredients i on i.name = 'Sillao'
where d.slug = 'tallarin-saltado'
union all
select d.id, i.id, 2, 'presa', 1
from public.dishes d
join public.ingredients i on i.name = 'Pollo'
where d.slug = 'pollo-al-horno'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'pollo-al-horno'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Camote'
where d.slug = 'pollo-al-horno'
union all
select d.id, i.id, 1, 'unidad', 4
from public.dishes d
join public.ingredients i on i.name = 'Ensalada'
where d.slug = 'pollo-al-horno'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'pollo-al-horno'
union all
select d.id, i.id, 1, 'presa', 1
from public.dishes d
join public.ingredients i on i.name = 'Pechuga de pollo'
where d.slug = 'salpicon-de-pollo'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'salpicon-de-pollo'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Zanahoria'
where d.slug = 'salpicon-de-pollo'
union all
select d.id, i.id, 0.5, 'taza', 4
from public.dishes d
join public.ingredients i on i.name = 'Arveja'
where d.slug = 'salpicon-de-pollo'
union all
select d.id, i.id, 0.5, 'taza', 5
from public.dishes d
join public.ingredients i on i.name = 'Mayonesa'
where d.slug = 'salpicon-de-pollo'
union all
select d.id, i.id, 2, 'unid', 6
from public.dishes d
join public.ingredients i on i.name = 'Limón'
where d.slug = 'salpicon-de-pollo'
union all
select d.id, i.id, 0.35, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Lenteja'
where d.slug = 'lentejas'
union all
select d.id, i.id, 0.35, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'lentejas'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'lentejas'
union all
select d.id, i.id, 1, 'unidad', 4
from public.dishes d
join public.ingredients i on i.name = 'Ajo'
where d.slug = 'lentejas'
union all
select d.id, i.id, 1, 'unid', 5
from public.dishes d
join public.ingredients i on i.name = 'Zanahoria'
where d.slug = 'lentejas'
union all
select d.id, i.id, 0.35, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Frejol'
where d.slug = 'porotos'
union all
select d.id, i.id, 0.35, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'porotos'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'porotos'
union all
select d.id, i.id, 1, 'unidad', 4
from public.dishes d
join public.ingredients i on i.name = 'Ajo'
where d.slug = 'porotos'
union all
select d.id, i.id, 2, 'lata', 1
from public.dishes d
join public.ingredients i on i.name = 'Atún'
where d.slug = 'saltado-de-atun'
union all
select d.id, i.id, 1, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'saltado-de-atun'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Tomate'
where d.slug = 'saltado-de-atun'
union all
select d.id, i.id, 2, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'saltado-de-atun'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'saltado-de-atun'
union all
select d.id, i.id, 0.35, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Carne de res'
where d.slug = 'lawa-de-chuno'
union all
select d.id, i.id, 0.25, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Chuño'
where d.slug = 'lawa-de-chuno'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'lawa-de-chuno'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Zanahoria'
where d.slug = 'lawa-de-chuno'
union all
select d.id, i.id, 1, 'unidad', 5
from public.dishes d
join public.ingredients i on i.name = 'Hierbabuena'
where d.slug = 'lawa-de-chuno'
union all
select d.id, i.id, 0.35, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Tarwi'
where d.slug = 'tarwi'
union all
select d.id, i.id, 1, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'tarwi'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Tomate'
where d.slug = 'tarwi'
union all
select d.id, i.id, 2, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Limón'
where d.slug = 'tarwi'
union all
select d.id, i.id, 0.25, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'tarwi'
union all
select d.id, i.id, 2, 'presa', 1
from public.dishes d
join public.ingredients i on i.name = 'Pollo'
where d.slug = 'caldo-de-pollo'
union all
select d.id, i.id, 2, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'caldo-de-pollo'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Zanahoria'
where d.slug = 'caldo-de-pollo'
union all
select d.id, i.id, 0.5, 'taza', 4
from public.dishes d
join public.ingredients i on i.name = 'Fideo'
where d.slug = 'caldo-de-pollo'
union all
select d.id, i.id, 1, 'unidad', 5
from public.dishes d
join public.ingredients i on i.name = 'Apio'
where d.slug = 'caldo-de-pollo'
union all
select d.id, i.id, 2, 'unid', 1
from public.dishes d
join public.ingredients i on i.name = 'Huevo'
where d.slug = 'torrejas-de-verduras-arequipenas-con-arroz'
union all
select d.id, i.id, 0.75, 'taza', 2
from public.dishes d
join public.ingredients i on i.name = 'Harina'
where d.slug = 'torrejas-de-verduras-arequipenas-con-arroz'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Zanahoria'
where d.slug = 'torrejas-de-verduras-arequipenas-con-arroz'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Zapallito italiano'
where d.slug = 'torrejas-de-verduras-arequipenas-con-arroz'
union all
select d.id, i.id, 1, 'unidad', 5
from public.dishes d
join public.ingredients i on i.name = 'Cebolla china'
where d.slug = 'torrejas-de-verduras-arequipenas-con-arroz'
union all
select d.id, i.id, 0.35, 'kg', 6
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'torrejas-de-verduras-arequipenas-con-arroz'
union all
select d.id, i.id, 250, 'ml', 7
from public.dishes d
join public.ingredients i on i.name = 'Aceite'
where d.slug = 'torrejas-de-verduras-arequipenas-con-arroz'
union all
select d.id, i.id, 250, 'g', 1
from public.dishes d
join public.ingredients i on i.name = 'Queso fresco'
where d.slug = 'soltero-de-queso'
union all
select d.id, i.id, 1, 'taza', 2
from public.dishes d
join public.ingredients i on i.name = 'Haba'
where d.slug = 'soltero-de-queso'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Choclo'
where d.slug = 'soltero-de-queso'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'soltero-de-queso'
union all
select d.id, i.id, 1, 'unid', 5
from public.dishes d
join public.ingredients i on i.name = 'Tomate'
where d.slug = 'soltero-de-queso'
union all
select d.id, i.id, 6, 'unid', 6
from public.dishes d
join public.ingredients i on i.name = 'Aceituna'
where d.slug = 'soltero-de-queso'
union all
select d.id, i.id, 2, 'unid', 7
from public.dishes d
join public.ingredients i on i.name = 'Limón'
where d.slug = 'soltero-de-queso'
union all
select d.id, i.id, 2, 'unid', 1
from public.dishes d
join public.ingredients i on i.name = 'Berenjena'
where d.slug = 'pastel-de-berenjena'
union all
select d.id, i.id, 0.35, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Carne molida'
where d.slug = 'pastel-de-berenjena'
union all
select d.id, i.id, 150, 'g', 3
from public.dishes d
join public.ingredients i on i.name = 'Queso'
where d.slug = 'pastel-de-berenjena'
union all
select d.id, i.id, 2, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Tomate'
where d.slug = 'pastel-de-berenjena'
union all
select d.id, i.id, 1, 'paquete', 1
from public.dishes d
join public.ingredients i on i.name = 'Fetuccini'
where d.slug = 'fetuccini-en-salsa-roja'
union all
select d.id, i.id, 0.35, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Carne de res'
where d.slug = 'fetuccini-en-salsa-roja'
union all
select d.id, i.id, 3, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Tomate'
where d.slug = 'fetuccini-en-salsa-roja'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'fetuccini-en-salsa-roja'
union all
select d.id, i.id, 0.45, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'arroz-chaufa-de-pollo'
union all
select d.id, i.id, 1, 'presa', 2
from public.dishes d
join public.ingredients i on i.name = 'Pollo'
where d.slug = 'arroz-chaufa-de-pollo'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Huevo'
where d.slug = 'arroz-chaufa-de-pollo'
union all
select d.id, i.id, 1, 'unidad', 4
from public.dishes d
join public.ingredients i on i.name = 'Cebolla china'
where d.slug = 'arroz-chaufa-de-pollo'
union all
select d.id, i.id, 80, 'ml', 5
from public.dishes d
join public.ingredients i on i.name = 'Sillao'
where d.slug = 'arroz-chaufa-de-pollo'
union all
select d.id, i.id, 1, 'paquete', 1
from public.dishes d
join public.ingredients i on i.name = 'Fideo'
where d.slug = 'aji-de-fideos-fideitos'
union all
select d.id, i.id, 1, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Ají panca'
where d.slug = 'aji-de-fideos-fideitos'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'aji-de-fideos-fideitos'
union all
select d.id, i.id, 120, 'g', 4
from public.dishes d
join public.ingredients i on i.name = 'Queso fresco'
where d.slug = 'aji-de-fideos-fideitos'
union all
select d.id, i.id, 0.4, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Carne de res'
where d.slug = 'matasca'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'matasca'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'matasca'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Tomate'
where d.slug = 'matasca'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'matasca'
union all
select d.id, i.id, 2, 'presa', 1
from public.dishes d
join public.ingredients i on i.name = 'Pollo'
where d.slug = 'estofado-de-pollo'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'estofado-de-pollo'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Zanahoria'
where d.slug = 'estofado-de-pollo'
union all
select d.id, i.id, 0.5, 'taza', 4
from public.dishes d
join public.ingredients i on i.name = 'Arveja'
where d.slug = 'estofado-de-pollo'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'estofado-de-pollo'
union all
select d.id, i.id, 2, 'unid', 1
from public.dishes d
join public.ingredients i on i.name = 'Palta'
where d.slug = 'palta-rellena'
union all
select d.id, i.id, 1, 'presa', 2
from public.dishes d
join public.ingredients i on i.name = 'Pollo'
where d.slug = 'palta-rellena'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'palta-rellena'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Zanahoria'
where d.slug = 'palta-rellena'
union all
select d.id, i.id, 0.5, 'taza', 5
from public.dishes d
join public.ingredients i on i.name = 'Mayonesa'
where d.slug = 'palta-rellena'
union all
select d.id, i.id, 1, 'paquete', 1
from public.dishes d
join public.ingredients i on i.name = 'Tallarín'
where d.slug = 'tallarin-al-pesto'
union all
select d.id, i.id, 1, 'unidad', 2
from public.dishes d
join public.ingredients i on i.name = 'Albahaca'
where d.slug = 'tallarin-al-pesto'
union all
select d.id, i.id, 1, 'unidad', 3
from public.dishes d
join public.ingredients i on i.name = 'Espinaca'
where d.slug = 'tallarin-al-pesto'
union all
select d.id, i.id, 150, 'g', 4
from public.dishes d
join public.ingredients i on i.name = 'Queso fresco'
where d.slug = 'tallarin-al-pesto'
union all
select d.id, i.id, 0.5, 'taza', 5
from public.dishes d
join public.ingredients i on i.name = 'Leche'
where d.slug = 'tallarin-al-pesto'
union all
select d.id, i.id, 0.45, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Hígado de res'
where d.slug = 'higado-frito-con-arroz'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'higado-frito-con-arroz'
union all
select d.id, i.id, 0.35, 'kg', 3
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'higado-frito-con-arroz'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'higado-frito-con-arroz'
union all
select d.id, i.id, 0.45, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Bistec de res'
where d.slug = 'bistec-a-lo-pobre'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'bistec-a-lo-pobre'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Huevo'
where d.slug = 'bistec-a-lo-pobre'
union all
select d.id, i.id, 2, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Plátano'
where d.slug = 'bistec-a-lo-pobre'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'bistec-a-lo-pobre'
union all
select d.id, i.id, 0.45, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'arroz-a-la-cubana'
union all
select d.id, i.id, 2, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Huevo'
where d.slug = 'arroz-a-la-cubana'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Plátano'
where d.slug = 'arroz-a-la-cubana'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Tomate'
where d.slug = 'arroz-a-la-cubana'
union all
select d.id, i.id, 0.7, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Zapallo'
where d.slug = 'locro-de-zapallo'
union all
select d.id, i.id, 2, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'locro-de-zapallo'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Choclo'
where d.slug = 'locro-de-zapallo'
union all
select d.id, i.id, 150, 'g', 4
from public.dishes d
join public.ingredients i on i.name = 'Queso fresco'
where d.slug = 'locro-de-zapallo'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'locro-de-zapallo'
union all
select d.id, i.id, 4, 'unid', 1
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'ocopa-arequipena'
union all
select d.id, i.id, 2, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Ají amarillo'
where d.slug = 'ocopa-arequipena'
union all
select d.id, i.id, 180, 'g', 3
from public.dishes d
join public.ingredients i on i.name = 'Queso fresco'
where d.slug = 'ocopa-arequipena'
union all
select d.id, i.id, 0.5, 'taza', 4
from public.dishes d
join public.ingredients i on i.name = 'Maní'
where d.slug = 'ocopa-arequipena'
union all
select d.id, i.id, 0.5, 'taza', 5
from public.dishes d
join public.ingredients i on i.name = 'Leche'
where d.slug = 'ocopa-arequipena'
union all
select d.id, i.id, 2, 'unid', 6
from public.dishes d
join public.ingredients i on i.name = 'Huevo'
where d.slug = 'ocopa-arequipena'
union all
select d.id, i.id, 0.45, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'arroz-tapado'
union all
select d.id, i.id, 0.35, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Carne molida'
where d.slug = 'arroz-tapado'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Huevo'
where d.slug = 'arroz-tapado'
union all
select d.id, i.id, 6, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Aceituna'
where d.slug = 'arroz-tapado'
union all
select d.id, i.id, 1, 'unid', 5
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'arroz-tapado'
union all
select d.id, i.id, 0.45, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Carne de res'
where d.slug = 'seco-de-res'
union all
select d.id, i.id, 1, 'unidad', 2
from public.dishes d
join public.ingredients i on i.name = 'Culantro'
where d.slug = 'seco-de-res'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'seco-de-res'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Zanahoria'
where d.slug = 'seco-de-res'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'seco-de-res'
union all
select d.id, i.id, 0.6, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Olluco'
where d.slug = 'olluquito-con-carne'
union all
select d.id, i.id, 0.35, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Carne de res'
where d.slug = 'olluquito-con-carne'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'olluquito-con-carne'
union all
select d.id, i.id, 0.35, 'kg', 4
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'olluquito-con-carne'
union all
select d.id, i.id, 2, 'presa', 1
from public.dishes d
join public.ingredients i on i.name = 'Pollo'
where d.slug = 'arroz-con-pollo'
union all
select d.id, i.id, 0.45, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'arroz-con-pollo'
union all
select d.id, i.id, 1, 'unidad', 3
from public.dishes d
join public.ingredients i on i.name = 'Culantro'
where d.slug = 'arroz-con-pollo'
union all
select d.id, i.id, 0.5, 'taza', 4
from public.dishes d
join public.ingredients i on i.name = 'Arveja'
where d.slug = 'arroz-con-pollo'
union all
select d.id, i.id, 1, 'unid', 5
from public.dishes d
join public.ingredients i on i.name = 'Zanahoria'
where d.slug = 'arroz-con-pollo'
union all
select d.id, i.id, 4, 'unid', 1
from public.dishes d
join public.ingredients i on i.name = 'Caigua'
where d.slug = 'caigua-rellena'
union all
select d.id, i.id, 0.35, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Carne molida'
where d.slug = 'caigua-rellena'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Huevo'
where d.slug = 'caigua-rellena'
union all
select d.id, i.id, 0.35, 'kg', 4
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'caigua-rellena'
union all
select d.id, i.id, 1, 'unid', 5
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'caigua-rellena'
union all
select d.id, i.id, 0.35, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Quinua'
where d.slug = 'guiso-de-quinua'
union all
select d.id, i.id, 2, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'guiso-de-quinua'
union all
select d.id, i.id, 120, 'g', 3
from public.dishes d
join public.ingredients i on i.name = 'Queso fresco'
where d.slug = 'guiso-de-quinua'
union all
select d.id, i.id, 0.25, 'kg', 4
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'guiso-de-quinua'
union all
select d.id, i.id, 3, 'unid', 1
from public.dishes d
join public.ingredients i on i.name = 'Choclo'
where d.slug = 'pepian-de-choclo'
union all
select d.id, i.id, 120, 'g', 2
from public.dishes d
join public.ingredients i on i.name = 'Queso fresco'
where d.slug = 'pepian-de-choclo'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'pepian-de-choclo'
union all
select d.id, i.id, 0.35, 'kg', 4
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'pepian-de-choclo'
union all
select d.id, i.id, 1, 'paquete', 1
from public.dishes d
join public.ingredients i on i.name = 'Tallarín'
where d.slug = 'tallarin-rojo-con-pollo'
union all
select d.id, i.id, 2, 'presa', 2
from public.dishes d
join public.ingredients i on i.name = 'Pollo'
where d.slug = 'tallarin-rojo-con-pollo'
union all
select d.id, i.id, 3, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Tomate'
where d.slug = 'tallarin-rojo-con-pollo'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'tallarin-rojo-con-pollo'
union all
select d.id, i.id, 0.45, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'arroz-a-la-jardinera'
union all
select d.id, i.id, 1, 'presa', 2
from public.dishes d
join public.ingredients i on i.name = 'Pollo'
where d.slug = 'arroz-a-la-jardinera'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Zanahoria'
where d.slug = 'arroz-a-la-jardinera'
union all
select d.id, i.id, 0.5, 'taza', 4
from public.dishes d
join public.ingredients i on i.name = 'Arveja'
where d.slug = 'arroz-a-la-jardinera'
union all
select d.id, i.id, 1, 'unid', 5
from public.dishes d
join public.ingredients i on i.name = 'Choclo'
where d.slug = 'arroz-a-la-jardinera'
union all
select d.id, i.id, 0.45, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Cerdo'
where d.slug = 'arroz-con-chancho'
union all
select d.id, i.id, 0.45, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'arroz-con-chancho'
union all
select d.id, i.id, 1, 'unidad', 3
from public.dishes d
join public.ingredients i on i.name = 'Culantro'
where d.slug = 'arroz-con-chancho'
union all
select d.id, i.id, 0.5, 'taza', 4
from public.dishes d
join public.ingredients i on i.name = 'Arveja'
where d.slug = 'arroz-con-chancho'
union all
select d.id, i.id, 0.55, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Carne de res'
where d.slug = 'asado-al-vino'
union all
select d.id, i.id, 1, 'taza', 2
from public.dishes d
join public.ingredients i on i.name = 'Vino'
where d.slug = 'asado-al-vino'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'asado-al-vino'
union all
select d.id, i.id, 3, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'asado-al-vino'
union all
select d.id, i.id, 0.55, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Carne de res'
where d.slug = 'asado-de-res-con-pure'
union all
select d.id, i.id, 4, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'asado-de-res-con-pure'
union all
select d.id, i.id, 0.5, 'taza', 3
from public.dishes d
join public.ingredients i on i.name = 'Leche'
where d.slug = 'asado-de-res-con-pure'
union all
select d.id, i.id, 50, 'g', 4
from public.dishes d
join public.ingredients i on i.name = 'Mantequilla'
where d.slug = 'asado-de-res-con-pure'
union all
select d.id, i.id, 2, 'presa', 1
from public.dishes d
join public.ingredients i on i.name = 'Pollo'
where d.slug = 'cau-cau-de-pollo'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'cau-cau-de-pollo'
union all
select d.id, i.id, 1, 'unidad', 3
from public.dishes d
join public.ingredients i on i.name = 'Hierbabuena'
where d.slug = 'cau-cau-de-pollo'
union all
select d.id, i.id, 0.35, 'kg', 4
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'cau-cau-de-pollo'
union all
select d.id, i.id, 280, 'g', 1
from public.dishes d
join public.ingredients i on i.name = 'Queso fresco'
where d.slug = 'cauche-de-queso'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'cauche-de-queso'
union all
select d.id, i.id, 1, 'taza', 3
from public.dishes d
join public.ingredients i on i.name = 'Leche'
where d.slug = 'cauche-de-queso'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Ají amarillo'
where d.slug = 'cauche-de-queso'
union all
select d.id, i.id, 0.25, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'cauche-de-queso'
union all
select d.id, i.id, 0.4, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Carne de res'
where d.slug = 'chaque'
union all
select d.id, i.id, 2, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'chaque'
union all
select d.id, i.id, 0.25, 'kg', 3
from public.dishes d
join public.ingredients i on i.name = 'Chuño'
where d.slug = 'chaque'
union all
select d.id, i.id, 0.5, 'taza', 4
from public.dishes d
join public.ingredients i on i.name = 'Trigo'
where d.slug = 'chaque'
union all
select d.id, i.id, 1, 'unidad', 5
from public.dishes d
join public.ingredients i on i.name = 'Verduras'
where d.slug = 'chaque'
union all
select d.id, i.id, 2, 'presa', 1
from public.dishes d
join public.ingredients i on i.name = 'Pollo'
where d.slug = 'escabeche-de-pollo'
union all
select d.id, i.id, 2, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'escabeche-de-pollo'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Ají amarillo'
where d.slug = 'escabeche-de-pollo'
union all
select d.id, i.id, 80, 'ml', 4
from public.dishes d
join public.ingredients i on i.name = 'Vinagre'
where d.slug = 'escabeche-de-pollo'
union all
select d.id, i.id, 2, 'unid', 5
from public.dishes d
join public.ingredients i on i.name = 'Camote'
where d.slug = 'escabeche-de-pollo'
union all
select d.id, i.id, 0.35, 'kg', 6
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'escabeche-de-pollo'
union all
select d.id, i.id, 5, 'unid', 1
from public.dishes d
join public.ingredients i on i.name = 'Papa amarilla'
where d.slug = 'causa-rellena-de-pollo'
union all
select d.id, i.id, 1, 'presa', 2
from public.dishes d
join public.ingredients i on i.name = 'Pollo'
where d.slug = 'causa-rellena-de-pollo'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Ají amarillo'
where d.slug = 'causa-rellena-de-pollo'
union all
select d.id, i.id, 3, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Limón'
where d.slug = 'causa-rellena-de-pollo'
union all
select d.id, i.id, 1, 'unid', 5
from public.dishes d
join public.ingredients i on i.name = 'Palta'
where d.slug = 'causa-rellena-de-pollo'
union all
select d.id, i.id, 0.5, 'taza', 6
from public.dishes d
join public.ingredients i on i.name = 'Mayonesa'
where d.slug = 'causa-rellena-de-pollo'
union all
select d.id, i.id, 0.45, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Pescado'
where d.slug = 'escabeche-de-pescado'
union all
select d.id, i.id, 2, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'escabeche-de-pescado'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Ají amarillo'
where d.slug = 'escabeche-de-pescado'
union all
select d.id, i.id, 80, 'ml', 4
from public.dishes d
join public.ingredients i on i.name = 'Vinagre'
where d.slug = 'escabeche-de-pescado'
union all
select d.id, i.id, 2, 'unid', 5
from public.dishes d
join public.ingredients i on i.name = 'Camote'
where d.slug = 'escabeche-de-pescado'
union all
select d.id, i.id, 0.35, 'kg', 6
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'escabeche-de-pescado'
union all
select d.id, i.id, 0.55, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Malaya de res'
where d.slug = 'malaya-dorada'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'malaya-dorada'
union all
select d.id, i.id, 0.35, 'kg', 3
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'malaya-dorada'
union all
select d.id, i.id, 1, 'unidad', 4
from public.dishes d
join public.ingredients i on i.name = 'Ensalada'
where d.slug = 'malaya-dorada'
union all
select d.id, i.id, 0.45, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Carne de res'
where d.slug = 'estofado-de-carne'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'estofado-de-carne'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Zanahoria'
where d.slug = 'estofado-de-carne'
union all
select d.id, i.id, 0.5, 'taza', 4
from public.dishes d
join public.ingredients i on i.name = 'Arveja'
where d.slug = 'estofado-de-carne'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'estofado-de-carne'
union all
select d.id, i.id, 0.35, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Frejol'
where d.slug = 'frejoles-con-seco-de-res'
union all
select d.id, i.id, 0.35, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Carne de res'
where d.slug = 'frejoles-con-seco-de-res'
union all
select d.id, i.id, 1, 'unidad', 3
from public.dishes d
join public.ingredients i on i.name = 'Culantro'
where d.slug = 'frejoles-con-seco-de-res'
union all
select d.id, i.id, 0.35, 'kg', 4
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'frejoles-con-seco-de-res'
union all
select d.id, i.id, 0.35, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Garbanzo'
where d.slug = 'garbanzos-con-acelga'
union all
select d.id, i.id, 1, 'unidad', 2
from public.dishes d
join public.ingredients i on i.name = 'Acelga'
where d.slug = 'garbanzos-con-acelga'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'garbanzos-con-acelga'
union all
select d.id, i.id, 0.35, 'kg', 4
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'garbanzos-con-acelga'
union all
select d.id, i.id, 1, 'unidad', 1
from public.dishes d
join public.ingredients i on i.name = 'Coliflor'
where d.slug = 'guiso-de-coliflor'
union all
select d.id, i.id, 2, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'guiso-de-coliflor'
union all
select d.id, i.id, 0.5, 'taza', 3
from public.dishes d
join public.ingredients i on i.name = 'Arveja'
where d.slug = 'guiso-de-coliflor'
union all
select d.id, i.id, 0.35, 'kg', 4
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'guiso-de-coliflor'
union all
select d.id, i.id, 0.45, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Pecho de res'
where d.slug = 'locro-de-pecho'
union all
select d.id, i.id, 0.6, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Zapallo'
where d.slug = 'locro-de-pecho'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'locro-de-pecho'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Choclo'
where d.slug = 'locro-de-pecho'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'locro-de-pecho'
union all
select d.id, i.id, 2, 'presa', 1
from public.dishes d
join public.ingredients i on i.name = 'Pollo'
where d.slug = 'matasquita-de-pollo'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'matasquita-de-pollo'
union all
select d.id, i.id, 1, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'matasquita-de-pollo'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Tomate'
where d.slug = 'matasquita-de-pollo'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'matasquita-de-pollo'
union all
select d.id, i.id, 2, 'presa', 1
from public.dishes d
join public.ingredients i on i.name = 'Pechuga de pollo'
where d.slug = 'milanesa-de-pollo'
union all
select d.id, i.id, 1, 'taza', 2
from public.dishes d
join public.ingredients i on i.name = 'Pan rallado'
where d.slug = 'milanesa-de-pollo'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Huevo'
where d.slug = 'milanesa-de-pollo'
union all
select d.id, i.id, 3, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'milanesa-de-pollo'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'milanesa-de-pollo'
union all
select d.id, i.id, 5, 'unid', 1
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'papa-rellena-con-arroz'
union all
select d.id, i.id, 0.35, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Carne molida'
where d.slug = 'papa-rellena-con-arroz'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Huevo'
where d.slug = 'papa-rellena-con-arroz'
union all
select d.id, i.id, 6, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Aceituna'
where d.slug = 'papa-rellena-con-arroz'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'papa-rellena-con-arroz'
union all
select d.id, i.id, 4, 'unid', 1
from public.dishes d
join public.ingredients i on i.name = 'Rocoto'
where d.slug = 'rocoto-relleno-con-pastel-de-papa'
union all
select d.id, i.id, 0.35, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Carne molida'
where d.slug = 'rocoto-relleno-con-pastel-de-papa'
union all
select d.id, i.id, 180, 'g', 3
from public.dishes d
join public.ingredients i on i.name = 'Queso fresco'
where d.slug = 'rocoto-relleno-con-pastel-de-papa'
union all
select d.id, i.id, 4, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'rocoto-relleno-con-pastel-de-papa'
union all
select d.id, i.id, 0.5, 'taza', 5
from public.dishes d
join public.ingredients i on i.name = 'Leche'
where d.slug = 'rocoto-relleno-con-pastel-de-papa'
union all
select d.id, i.id, 2, 'presa', 1
from public.dishes d
join public.ingredients i on i.name = 'Pollo'
where d.slug = 'seco-de-pollo'
union all
select d.id, i.id, 1, 'unidad', 2
from public.dishes d
join public.ingredients i on i.name = 'Culantro'
where d.slug = 'seco-de-pollo'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'seco-de-pollo'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Zanahoria'
where d.slug = 'seco-de-pollo'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'seco-de-pollo'
union all
select d.id, i.id, 1, 'paquete', 1
from public.dishes d
join public.ingredients i on i.name = 'Tallarín'
where d.slug = 'tallarines-a-la-bolonesa'
union all
select d.id, i.id, 0.35, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Carne molida'
where d.slug = 'tallarines-a-la-bolonesa'
union all
select d.id, i.id, 3, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Tomate'
where d.slug = 'tallarines-a-la-bolonesa'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'tallarines-a-la-bolonesa'
union all
select d.id, i.id, 0.55, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Chuleta de chancho'
where d.slug = 'chuleta-de-chancho-al-horno'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'chuleta-de-chancho-al-horno'
union all
select d.id, i.id, 1, 'unidad', 3
from public.dishes d
join public.ingredients i on i.name = 'Ensalada'
where d.slug = 'chuleta-de-chancho-al-horno'
union all
select d.id, i.id, 0.35, 'kg', 4
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'chuleta-de-chancho-al-horno'
union all
select d.id, i.id, 0.55, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Chuleta de chancho'
where d.slug = 'chuleta-de-chancho-frita-con-arroz-y-ensalada'
union all
select d.id, i.id, 0.35, 'kg', 2
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'chuleta-de-chancho-frita-con-arroz-y-ensalada'
union all
select d.id, i.id, 1, 'unidad', 3
from public.dishes d
join public.ingredients i on i.name = 'Ensalada'
where d.slug = 'chuleta-de-chancho-frita-con-arroz-y-ensalada'
union all
select d.id, i.id, 250, 'ml', 4
from public.dishes d
join public.ingredients i on i.name = 'Aceite'
where d.slug = 'chuleta-de-chancho-frita-con-arroz-y-ensalada'
union all
select d.id, i.id, 0.55, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Cerdo'
where d.slug = 'chancho-a-la-olla'
union all
select d.id, i.id, 3, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'chancho-a-la-olla'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Camote'
where d.slug = 'chancho-a-la-olla'
union all
select d.id, i.id, 0.35, 'kg', 4
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'chancho-a-la-olla'
union all
select d.id, i.id, 0.5, 'kg', 1
from public.dishes d
join public.ingredients i on i.name = 'Cerdo'
where d.slug = 'seco-de-cerdo'
union all
select d.id, i.id, 1, 'unidad', 2
from public.dishes d
join public.ingredients i on i.name = 'Culantro'
where d.slug = 'seco-de-cerdo'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'seco-de-cerdo'
union all
select d.id, i.id, 0.35, 'kg', 4
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'seco-de-cerdo'
union all
select d.id, i.id, 2, 'lata', 1
from public.dishes d
join public.ingredients i on i.name = 'Atún'
where d.slug = 'croquetas-de-atun-con-arroz'
union all
select d.id, i.id, 2, 'unid', 2
from public.dishes d
join public.ingredients i on i.name = 'Papa'
where d.slug = 'croquetas-de-atun-con-arroz'
union all
select d.id, i.id, 2, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Huevo'
where d.slug = 'croquetas-de-atun-con-arroz'
union all
select d.id, i.id, 0.5, 'taza', 4
from public.dishes d
join public.ingredients i on i.name = 'Pan rallado'
where d.slug = 'croquetas-de-atun-con-arroz'
union all
select d.id, i.id, 0.35, 'kg', 5
from public.dishes d
join public.ingredients i on i.name = 'Arroz'
where d.slug = 'croquetas-de-atun-con-arroz'
union all
select d.id, i.id, 2, 'unid', 6
from public.dishes d
join public.ingredients i on i.name = 'Limón'
where d.slug = 'croquetas-de-atun-con-arroz'
union all
select d.id, i.id, 1, 'paquete', 1
from public.dishes d
join public.ingredients i on i.name = 'Tallarín'
where d.slug = 'tallarines-rojos-con-atun'
union all
select d.id, i.id, 2, 'lata', 2
from public.dishes d
join public.ingredients i on i.name = 'Atún'
where d.slug = 'tallarines-rojos-con-atun'
union all
select d.id, i.id, 3, 'unid', 3
from public.dishes d
join public.ingredients i on i.name = 'Tomate'
where d.slug = 'tallarines-rojos-con-atun'
union all
select d.id, i.id, 1, 'unid', 4
from public.dishes d
join public.ingredients i on i.name = 'Cebolla roja'
where d.slug = 'tallarines-rojos-con-atun';

insert into public.recipe_steps (
  dish_id,
  step_number,
  body
)
select d.id, 1, 'Sancocha y deshilacha la pechuga. Reserva parte del caldo.'
from public.dishes d
where d.slug = 'aji-de-gallina'
union all
select d.id, 2, 'Licúa pan remojado con leche, ají amarillo y un poco de caldo.'
from public.dishes d
where d.slug = 'aji-de-gallina'
union all
select d.id, 3, 'Haz un aderezo con cebolla, ajo y ají; agrega la crema y el pollo.'
from public.dishes d
where d.slug = 'aji-de-gallina'
union all
select d.id, 4, 'Sirve con arroz, papa sancochada, huevo y aceituna.'
from public.dishes d
where d.slug = 'aji-de-gallina'
union all
select d.id, 1, 'Corta la carne, cebolla y tomate en tiras gruesas.'
from public.dishes d
where d.slug = 'lomo-saltado'
union all
select d.id, 2, 'Sella la carne a fuego alto y retírala.'
from public.dishes d
where d.slug = 'lomo-saltado'
union all
select d.id, 3, 'Saltea cebolla y tomate, agrega sillao y vuelve a unir la carne.'
from public.dishes d
where d.slug = 'lomo-saltado'
union all
select d.id, 4, 'Sirve con papas fritas y arroz.'
from public.dishes d
where d.slug = 'lomo-saltado'
union all
select d.id, 1, 'Sancocha los tallarines al dente y reserva.'
from public.dishes d
where d.slug = 'tallarin-saltado'
union all
select d.id, 2, 'Saltea la carne a fuego alto hasta dorarla.'
from public.dishes d
where d.slug = 'tallarin-saltado'
union all
select d.id, 3, 'Agrega cebolla, tomate y sillao; mezcla con los tallarines.'
from public.dishes d
where d.slug = 'tallarin-saltado'
union all
select d.id, 4, 'Rectifica sal y sirve caliente.'
from public.dishes d
where d.slug = 'tallarin-saltado'
union all
select d.id, 1, 'Sazona el pollo con ajo, sal, pimienta y especias.'
from public.dishes d
where d.slug = 'pollo-al-horno'
union all
select d.id, 2, 'Acomoda pollo, papa y camote en una fuente.'
from public.dishes d
where d.slug = 'pollo-al-horno'
union all
select d.id, 3, 'Hornea hasta que el pollo dore y quede jugoso.'
from public.dishes d
where d.slug = 'pollo-al-horno'
union all
select d.id, 4, 'Sirve con arroz o ensalada fresca.'
from public.dishes d
where d.slug = 'pollo-al-horno'
union all
select d.id, 1, 'Sancocha el pollo y deshiláchalo.'
from public.dishes d
where d.slug = 'salpicon-de-pollo'
union all
select d.id, 2, 'Cocina papa, zanahoria y arvejas hasta que estén tiernas.'
from public.dishes d
where d.slug = 'salpicon-de-pollo'
union all
select d.id, 3, 'Mezcla todo con mayonesa, limón, sal y pimienta.'
from public.dishes d
where d.slug = 'salpicon-de-pollo'
union all
select d.id, 4, 'Sirve frío y ajusta limón al gusto.'
from public.dishes d
where d.slug = 'salpicon-de-pollo'
union all
select d.id, 1, 'Remoja las lentejas si tienes tiempo y enjuágalas.'
from public.dishes d
where d.slug = 'lentejas'
union all
select d.id, 2, 'Prepara un aderezo de cebolla, ajo y zanahoria.'
from public.dishes d
where d.slug = 'lentejas'
union all
select d.id, 3, 'Agrega las lentejas con agua y cocina hasta que ablanden.'
from public.dishes d
where d.slug = 'lentejas'
union all
select d.id, 4, 'Sirve con arroz y el acompañamiento que prefieras.'
from public.dishes d
where d.slug = 'lentejas'
union all
select d.id, 1, 'Remoja los frejoles desde la noche anterior.'
from public.dishes d
where d.slug = 'porotos'
union all
select d.id, 2, 'Cocínalos hasta que estén suaves.'
from public.dishes d
where d.slug = 'porotos'
union all
select d.id, 3, 'Haz un aderezo con cebolla y ajo, y mézclalo con los porotos.'
from public.dishes d
where d.slug = 'porotos'
union all
select d.id, 4, 'Sirve con arroz y ajusta la sal al final.'
from public.dishes d
where d.slug = 'porotos'
union all
select d.id, 1, 'Fríe las papas o dóralas al horno.'
from public.dishes d
where d.slug = 'saltado-de-atun'
union all
select d.id, 2, 'Saltea cebolla y tomate a fuego alto.'
from public.dishes d
where d.slug = 'saltado-de-atun'
union all
select d.id, 3, 'Agrega el atún escurrido y sillao solo para integrar.'
from public.dishes d
where d.slug = 'saltado-de-atun'
union all
select d.id, 4, 'Sirve con arroz y limón.'
from public.dishes d
where d.slug = 'saltado-de-atun'
union all
select d.id, 1, 'Remoja y enjuaga el chuño.'
from public.dishes d
where d.slug = 'lawa-de-chuno'
union all
select d.id, 2, 'Cocina la carne con papa y zanahoria hasta hacer caldo.'
from public.dishes d
where d.slug = 'lawa-de-chuno'
union all
select d.id, 3, 'Agrega el chuño y remueve hasta que tome cuerpo.'
from public.dishes d
where d.slug = 'lawa-de-chuno'
union all
select d.id, 4, 'Termina con hierbabuena y sirve caliente.'
from public.dishes d
where d.slug = 'lawa-de-chuno'
union all
select d.id, 1, 'Lava el tarwi y escúrrelo bien.'
from public.dishes d
where d.slug = 'tarwi'
union all
select d.id, 2, 'Pica cebolla y tomate en cubos pequeños.'
from public.dishes d
where d.slug = 'tarwi'
union all
select d.id, 3, 'Mezcla con limón, sal y un chorrito de aceite.'
from public.dishes d
where d.slug = 'tarwi'
union all
select d.id, 4, 'Sirve frío con arroz o papa sancochada.'
from public.dishes d
where d.slug = 'tarwi'
union all
select d.id, 1, 'Hierve el pollo con apio, sal y ajo.'
from public.dishes d
where d.slug = 'caldo-de-pollo'
union all
select d.id, 2, 'Agrega papa y zanahoria.'
from public.dishes d
where d.slug = 'caldo-de-pollo'
union all
select d.id, 3, 'Incorpora fideo al final para que no se recocine.'
from public.dishes d
where d.slug = 'caldo-de-pollo'
union all
select d.id, 4, 'Sirve caliente con hierbas frescas.'
from public.dishes d
where d.slug = 'caldo-de-pollo'
union all
select d.id, 1, 'Ralla o pica fino las verduras y retira exceso de líquido.'
from public.dishes d
where d.slug = 'torrejas-de-verduras-arequipenas-con-arroz'
union all
select d.id, 2, 'Mezcla con huevo, harina, sal y pimienta hasta formar una masa ligera.'
from public.dishes d
where d.slug = 'torrejas-de-verduras-arequipenas-con-arroz'
union all
select d.id, 3, 'Fríe porciones en aceite caliente hasta dorar ambos lados.'
from public.dishes d
where d.slug = 'torrejas-de-verduras-arequipenas-con-arroz'
union all
select d.id, 4, 'Sirve con arroz y ensalada.'
from public.dishes d
where d.slug = 'torrejas-de-verduras-arequipenas-con-arroz'
union all
select d.id, 1, 'Cocina las habas y el choclo, luego deja enfriar.'
from public.dishes d
where d.slug = 'soltero-de-queso'
union all
select d.id, 2, 'Corta queso, tomate y cebolla en cubos.'
from public.dishes d
where d.slug = 'soltero-de-queso'
union all
select d.id, 3, 'Mezcla con aceitunas, limón, sal y aceite.'
from public.dishes d
where d.slug = 'soltero-de-queso'
union all
select d.id, 4, 'Sirve fresco, cuidando que el queso quede entero.'
from public.dishes d
where d.slug = 'soltero-de-queso'
union all
select d.id, 1, 'Corta la berenjena en láminas y dóralas ligeramente.'
from public.dishes d
where d.slug = 'pastel-de-berenjena'
union all
select d.id, 2, 'Prepara una salsa con carne molida, tomate y cebolla.'
from public.dishes d
where d.slug = 'pastel-de-berenjena'
union all
select d.id, 3, 'Arma capas de berenjena, salsa y queso.'
from public.dishes d
where d.slug = 'pastel-de-berenjena'
union all
select d.id, 4, 'Hornea hasta gratinar.'
from public.dishes d
where d.slug = 'pastel-de-berenjena'
union all
select d.id, 1, 'Sancocha el fetuccini al dente.'
from public.dishes d
where d.slug = 'fetuccini-en-salsa-roja'
union all
select d.id, 2, 'Prepara una salsa roja con tomate, cebolla y carne.'
from public.dishes d
where d.slug = 'fetuccini-en-salsa-roja'
union all
select d.id, 3, 'Mezcla la pasta con la salsa hasta cubrirla bien.'
from public.dishes d
where d.slug = 'fetuccini-en-salsa-roja'
union all
select d.id, 4, 'Sirve caliente con queso si deseas.'
from public.dishes d
where d.slug = 'fetuccini-en-salsa-roja'
union all
select d.id, 1, 'Usa arroz graneado y frío para que no se pegue.'
from public.dishes d
where d.slug = 'arroz-chaufa-de-pollo'
union all
select d.id, 2, 'Dora el pollo en trozos pequeños.'
from public.dishes d
where d.slug = 'arroz-chaufa-de-pollo'
union all
select d.id, 3, 'Agrega huevo, cebolla china y sillao.'
from public.dishes d
where d.slug = 'arroz-chaufa-de-pollo'
union all
select d.id, 4, 'Saltea todo con el arroz a fuego alto.'
from public.dishes d
where d.slug = 'arroz-chaufa-de-pollo'
union all
select d.id, 1, 'Prepara un aderezo con ají panca, ajo y cebolla.'
from public.dishes d
where d.slug = 'aji-de-fideos-fideitos'
union all
select d.id, 2, 'Agrega papa en cubos y un poco de agua o caldo.'
from public.dishes d
where d.slug = 'aji-de-fideos-fideitos'
union all
select d.id, 3, 'Incorpora los fideos y cocina hasta que absorban sabor.'
from public.dishes d
where d.slug = 'aji-de-fideos-fideitos'
union all
select d.id, 4, 'Termina con queso fresco desmenuzado.'
from public.dishes d
where d.slug = 'aji-de-fideos-fideitos'
union all
select d.id, 1, 'Dora la carne en cubos pequeños.'
from public.dishes d
where d.slug = 'matasca'
union all
select d.id, 2, 'Haz un aderezo con cebolla, ajo y tomate.'
from public.dishes d
where d.slug = 'matasca'
union all
select d.id, 3, 'Agrega papa y cocina hasta que todo quede suave.'
from public.dishes d
where d.slug = 'matasca'
union all
select d.id, 4, 'Sirve con arroz.'
from public.dishes d
where d.slug = 'matasca'
union all
select d.id, 1, 'Dora las presas de pollo.'
from public.dishes d
where d.slug = 'estofado-de-pollo'
union all
select d.id, 2, 'Prepara aderezo con cebolla, ajo y tomate.'
from public.dishes d
where d.slug = 'estofado-de-pollo'
union all
select d.id, 3, 'Agrega papa, zanahoria y arvejas con un poco de caldo.'
from public.dishes d
where d.slug = 'estofado-de-pollo'
union all
select d.id, 4, 'Cocina hasta que el pollo esté tierno y sirve con arroz.'
from public.dishes d
where d.slug = 'estofado-de-pollo'
union all
select d.id, 1, 'Sancocha y deshilacha el pollo.'
from public.dishes d
where d.slug = 'palta-rellena'
union all
select d.id, 2, 'Cocina papa y zanahoria en cubos.'
from public.dishes d
where d.slug = 'palta-rellena'
union all
select d.id, 3, 'Mezcla con mayonesa, limón, sal y pimienta.'
from public.dishes d
where d.slug = 'palta-rellena'
union all
select d.id, 4, 'Rellena las paltas y sirve frío.'
from public.dishes d
where d.slug = 'palta-rellena'
union all
select d.id, 1, 'Sancocha los tallarines al dente.'
from public.dishes d
where d.slug = 'tallarin-al-pesto'
union all
select d.id, 2, 'Licúa albahaca, espinaca, queso y leche hasta formar salsa.'
from public.dishes d
where d.slug = 'tallarin-al-pesto'
union all
select d.id, 3, 'Calienta la salsa suavemente sin secarla.'
from public.dishes d
where d.slug = 'tallarin-al-pesto'
union all
select d.id, 4, 'Mezcla con los tallarines y sirve.'
from public.dishes d
where d.slug = 'tallarin-al-pesto'
union all
select d.id, 1, 'Sazona el hígado con ajo, sal y pimienta.'
from public.dishes d
where d.slug = 'higado-frito-con-arroz'
union all
select d.id, 2, 'Fríe o dora las papas.'
from public.dishes d
where d.slug = 'higado-frito-con-arroz'
union all
select d.id, 3, 'Cocina el hígado rápido para que no se endurezca.'
from public.dishes d
where d.slug = 'higado-frito-con-arroz'
union all
select d.id, 4, 'Sirve con arroz y cebolla salteada.'
from public.dishes d
where d.slug = 'higado-frito-con-arroz'
union all
select d.id, 1, 'Sazona y fríe los bistecs.'
from public.dishes d
where d.slug = 'bistec-a-lo-pobre'
union all
select d.id, 2, 'Fríe papas, huevo y plátano por separado.'
from public.dishes d
where d.slug = 'bistec-a-lo-pobre'
union all
select d.id, 3, 'Granea el arroz.'
from public.dishes d
where d.slug = 'bistec-a-lo-pobre'
union all
select d.id, 4, 'Sirve todo junto en el plato.'
from public.dishes d
where d.slug = 'bistec-a-lo-pobre'
union all
select d.id, 1, 'Granea el arroz.'
from public.dishes d
where d.slug = 'arroz-a-la-cubana'
union all
select d.id, 2, 'Fríe los huevos dejando la yema al gusto.'
from public.dishes d
where d.slug = 'arroz-a-la-cubana'
union all
select d.id, 3, 'Dora los plátanos en tajadas.'
from public.dishes d
where d.slug = 'arroz-a-la-cubana'
union all
select d.id, 4, 'Sirve con tomate o ensalada simple.'
from public.dishes d
where d.slug = 'arroz-a-la-cubana'
union all
select d.id, 1, 'Haz un aderezo con cebolla y ajo.'
from public.dishes d
where d.slug = 'locro-de-zapallo'
union all
select d.id, 2, 'Agrega zapallo, papa y choclo con un poco de agua.'
from public.dishes d
where d.slug = 'locro-de-zapallo'
union all
select d.id, 3, 'Cocina hasta que el zapallo se deshaga y tome cuerpo.'
from public.dishes d
where d.slug = 'locro-de-zapallo'
union all
select d.id, 4, 'Termina con queso fresco y sirve con arroz.'
from public.dishes d
where d.slug = 'locro-de-zapallo'
union all
select d.id, 1, 'Sancocha las papas y huevos.'
from public.dishes d
where d.slug = 'ocopa-arequipena'
union all
select d.id, 2, 'Licúa ají amarillo, queso, maní y leche hasta lograr una crema.'
from public.dishes d
where d.slug = 'ocopa-arequipena'
union all
select d.id, 3, 'Ajusta sal y espesor con leche o galleta si hace falta.'
from public.dishes d
where d.slug = 'ocopa-arequipena'
union all
select d.id, 4, 'Sirve la crema sobre papas con huevo.'
from public.dishes d
where d.slug = 'ocopa-arequipena'
union all
select d.id, 1, 'Granea el arroz.'
from public.dishes d
where d.slug = 'arroz-tapado'
union all
select d.id, 2, 'Prepara relleno con carne molida, cebolla, huevo y aceituna.'
from public.dishes d
where d.slug = 'arroz-tapado'
union all
select d.id, 3, 'Arma capas de arroz, relleno y arroz en un molde.'
from public.dishes d
where d.slug = 'arroz-tapado'
union all
select d.id, 4, 'Desmolda y sirve caliente.'
from public.dishes d
where d.slug = 'arroz-tapado'
union all
select d.id, 1, 'Licúa culantro con un poco de caldo.'
from public.dishes d
where d.slug = 'seco-de-res'
union all
select d.id, 2, 'Dora la carne y prepara aderezo con cebolla y ajo.'
from public.dishes d
where d.slug = 'seco-de-res'
union all
select d.id, 3, 'Agrega culantro licuado, papa y zanahoria.'
from public.dishes d
where d.slug = 'seco-de-res'
union all
select d.id, 4, 'Cocina lento hasta que la carne ablande y sirve con arroz.'
from public.dishes d
where d.slug = 'seco-de-res'
union all
select d.id, 1, 'Corta la carne y el olluco en tiras.'
from public.dishes d
where d.slug = 'olluquito-con-carne'
union all
select d.id, 2, 'Haz un aderezo con cebolla, ajo y ají panca.'
from public.dishes d
where d.slug = 'olluquito-con-carne'
union all
select d.id, 3, 'Agrega la carne y luego el olluco.'
from public.dishes d
where d.slug = 'olluquito-con-carne'
union all
select d.id, 4, 'Cocina hasta que quede jugoso y sirve con arroz.'
from public.dishes d
where d.slug = 'olluquito-con-carne'
union all
select d.id, 1, 'Licúa culantro con un poco de agua.'
from public.dishes d
where d.slug = 'arroz-con-pollo'
union all
select d.id, 2, 'Dora el pollo y reserva.'
from public.dishes d
where d.slug = 'arroz-con-pollo'
union all
select d.id, 3, 'Adereza, agrega arroz, verduras y culantro licuado.'
from public.dishes d
where d.slug = 'arroz-con-pollo'
union all
select d.id, 4, 'Cocina hasta que el arroz granee y el pollo termine de hacerse.'
from public.dishes d
where d.slug = 'arroz-con-pollo'
union all
select d.id, 1, 'Limpia las caiguas y retira semillas.'
from public.dishes d
where d.slug = 'caigua-rellena'
union all
select d.id, 2, 'Prepara relleno con carne, cebolla y huevo.'
from public.dishes d
where d.slug = 'caigua-rellena'
union all
select d.id, 3, 'Rellena las caiguas y cocínalas en salsa ligera.'
from public.dishes d
where d.slug = 'caigua-rellena'
union all
select d.id, 4, 'Sirve con arroz.'
from public.dishes d
where d.slug = 'caigua-rellena'
union all
select d.id, 1, 'Lava la quinua hasta que el agua salga clara.'
from public.dishes d
where d.slug = 'guiso-de-quinua'
union all
select d.id, 2, 'Haz un aderezo con cebolla y ajo.'
from public.dishes d
where d.slug = 'guiso-de-quinua'
union all
select d.id, 3, 'Agrega quinua, papa y agua; cocina hasta espesar.'
from public.dishes d
where d.slug = 'guiso-de-quinua'
union all
select d.id, 4, 'Termina con queso fresco y sirve con arroz si deseas.'
from public.dishes d
where d.slug = 'guiso-de-quinua'
union all
select d.id, 1, 'Licúa o ralla el choclo.'
from public.dishes d
where d.slug = 'pepian-de-choclo'
union all
select d.id, 2, 'Haz un aderezo con cebolla y ajo.'
from public.dishes d
where d.slug = 'pepian-de-choclo'
union all
select d.id, 3, 'Agrega el choclo y cocina moviendo hasta que espese.'
from public.dishes d
where d.slug = 'pepian-de-choclo'
union all
select d.id, 4, 'Termina con queso y sirve con arroz.'
from public.dishes d
where d.slug = 'pepian-de-choclo'
union all
select d.id, 1, 'Dora el pollo y reserva.'
from public.dishes d
where d.slug = 'tallarin-rojo-con-pollo'
union all
select d.id, 2, 'Prepara salsa roja con tomate, cebolla y ajo.'
from public.dishes d
where d.slug = 'tallarin-rojo-con-pollo'
union all
select d.id, 3, 'Cocina el pollo dentro de la salsa.'
from public.dishes d
where d.slug = 'tallarin-rojo-con-pollo'
union all
select d.id, 4, 'Mezcla o sirve sobre tallarines sancochados.'
from public.dishes d
where d.slug = 'tallarin-rojo-con-pollo'
union all
select d.id, 1, 'Dora el pollo y reserva.'
from public.dishes d
where d.slug = 'arroz-a-la-jardinera'
union all
select d.id, 2, 'Adereza con ajo y cebolla, agrega verduras.'
from public.dishes d
where d.slug = 'arroz-a-la-jardinera'
union all
select d.id, 3, 'Incorpora arroz y líquido, luego acomoda el pollo.'
from public.dishes d
where d.slug = 'arroz-a-la-jardinera'
union all
select d.id, 4, 'Cocina tapado hasta que el arroz granee.'
from public.dishes d
where d.slug = 'arroz-a-la-jardinera'
union all
select d.id, 1, 'Dora el chancho en trozos.'
from public.dishes d
where d.slug = 'arroz-con-chancho'
union all
select d.id, 2, 'Licúa culantro y prepara un aderezo.'
from public.dishes d
where d.slug = 'arroz-con-chancho'
union all
select d.id, 3, 'Agrega arroz, arvejas y el chancho dorado.'
from public.dishes d
where d.slug = 'arroz-con-chancho'
union all
select d.id, 4, 'Cocina hasta que el arroz quede graneado.'
from public.dishes d
where d.slug = 'arroz-con-chancho'
union all
select d.id, 1, 'Sella la carne por todos sus lados.'
from public.dishes d
where d.slug = 'asado-al-vino'
union all
select d.id, 2, 'Haz un aderezo con cebolla y ajo.'
from public.dishes d
where d.slug = 'asado-al-vino'
union all
select d.id, 3, 'Agrega vino y cocina lento hasta que la carne ablande.'
from public.dishes d
where d.slug = 'asado-al-vino'
union all
select d.id, 4, 'Corta en tajadas y sirve con papa.'
from public.dishes d
where d.slug = 'asado-al-vino'
union all
select d.id, 1, 'Sella la carne y cocínala lentamente con aderezo.'
from public.dishes d
where d.slug = 'asado-de-res-con-pure'
union all
select d.id, 2, 'Sancocha papas y prénsalas.'
from public.dishes d
where d.slug = 'asado-de-res-con-pure'
union all
select d.id, 3, 'Mezcla papa con leche y mantequilla para el puré.'
from public.dishes d
where d.slug = 'asado-de-res-con-pure'
union all
select d.id, 4, 'Sirve la carne en tajadas con su jugo y puré.'
from public.dishes d
where d.slug = 'asado-de-res-con-pure'
union all
select d.id, 1, 'Dora el pollo en trozos.'
from public.dishes d
where d.slug = 'cau-cau-de-pollo'
union all
select d.id, 2, 'Prepara aderezo con ajo, cebolla y palillo.'
from public.dishes d
where d.slug = 'cau-cau-de-pollo'
union all
select d.id, 3, 'Agrega papa en cubos y hierbabuena.'
from public.dishes d
where d.slug = 'cau-cau-de-pollo'
union all
select d.id, 4, 'Cocina hasta que quede jugoso y sirve con arroz.'
from public.dishes d
where d.slug = 'cau-cau-de-pollo'
union all
select d.id, 1, 'Sancocha las papas en rodajas.'
from public.dishes d
where d.slug = 'cauche-de-queso'
union all
select d.id, 2, 'Prepara un aderezo suave con ají amarillo.'
from public.dishes d
where d.slug = 'cauche-de-queso'
union all
select d.id, 3, 'Agrega leche y queso fresco sin deshacerlo demasiado.'
from public.dishes d
where d.slug = 'cauche-de-queso'
union all
select d.id, 4, 'Sirve caliente con papa y arroz.'
from public.dishes d
where d.slug = 'cauche-de-queso'
union all
select d.id, 1, 'Cocina la carne hasta formar un caldo sabroso.'
from public.dishes d
where d.slug = 'chaque'
union all
select d.id, 2, 'Agrega papa, chuño, trigo y verduras.'
from public.dishes d
where d.slug = 'chaque'
union all
select d.id, 3, 'Deja hervir hasta que todo esté tierno y espeso.'
from public.dishes d
where d.slug = 'chaque'
union all
select d.id, 4, 'Sirve caliente.'
from public.dishes d
where d.slug = 'chaque'
union all
select d.id, 1, 'Dora el pollo y reserva.'
from public.dishes d
where d.slug = 'escabeche-de-pollo'
union all
select d.id, 2, 'Saltea cebolla y ají amarillo en tiras.'
from public.dishes d
where d.slug = 'escabeche-de-pollo'
union all
select d.id, 3, 'Agrega vinagre y vuelve a poner el pollo para integrar.'
from public.dishes d
where d.slug = 'escabeche-de-pollo'
union all
select d.id, 4, 'Sirve con camote y arroz.'
from public.dishes d
where d.slug = 'escabeche-de-pollo'
union all
select d.id, 1, 'Sancocha y prensa la papa amarilla.'
from public.dishes d
where d.slug = 'causa-rellena-de-pollo'
union all
select d.id, 2, 'Sazona con ají amarillo, limón y sal.'
from public.dishes d
where d.slug = 'causa-rellena-de-pollo'
union all
select d.id, 3, 'Mezcla pollo deshilachado con mayonesa.'
from public.dishes d
where d.slug = 'causa-rellena-de-pollo'
union all
select d.id, 4, 'Arma capas de causa, pollo y palta.'
from public.dishes d
where d.slug = 'causa-rellena-de-pollo'
union all
select d.id, 1, 'Sazona y fríe el pescado.'
from public.dishes d
where d.slug = 'escabeche-de-pescado'
union all
select d.id, 2, 'Saltea cebolla y ají amarillo en tiras.'
from public.dishes d
where d.slug = 'escabeche-de-pescado'
union all
select d.id, 3, 'Agrega vinagre y acomoda el pescado en la salsa.'
from public.dishes d
where d.slug = 'escabeche-de-pescado'
union all
select d.id, 4, 'Sirve con camote y arroz.'
from public.dishes d
where d.slug = 'escabeche-de-pescado'
union all
select d.id, 1, 'Cocina la malaya hasta que esté tierna.'
from public.dishes d
where d.slug = 'malaya-dorada'
union all
select d.id, 2, 'Sazona y dora la carne por ambos lados.'
from public.dishes d
where d.slug = 'malaya-dorada'
union all
select d.id, 3, 'Prepara papas y arroz como acompañamiento.'
from public.dishes d
where d.slug = 'malaya-dorada'
union all
select d.id, 4, 'Sirve con ensalada fresca.'
from public.dishes d
where d.slug = 'malaya-dorada'
union all
select d.id, 1, 'Dora la carne en trozos.'
from public.dishes d
where d.slug = 'estofado-de-carne'
union all
select d.id, 2, 'Prepara un aderezo con cebolla, ajo y tomate.'
from public.dishes d
where d.slug = 'estofado-de-carne'
union all
select d.id, 3, 'Agrega papa, zanahoria y arvejas con caldo.'
from public.dishes d
where d.slug = 'estofado-de-carne'
union all
select d.id, 4, 'Cocina hasta que la carne esté suave y sirve con arroz.'
from public.dishes d
where d.slug = 'estofado-de-carne'
union all
select d.id, 1, 'Cocina los frejoles hasta que estén suaves.'
from public.dishes d
where d.slug = 'frejoles-con-seco-de-res'
union all
select d.id, 2, 'Prepara seco de res con culantro y aderezo.'
from public.dishes d
where d.slug = 'frejoles-con-seco-de-res'
union all
select d.id, 3, 'Une sabores ajustando sal al final.'
from public.dishes d
where d.slug = 'frejoles-con-seco-de-res'
union all
select d.id, 4, 'Sirve con arroz.'
from public.dishes d
where d.slug = 'frejoles-con-seco-de-res'
union all
select d.id, 1, 'Remoja y cocina los garbanzos.'
from public.dishes d
where d.slug = 'garbanzos-con-acelga'
union all
select d.id, 2, 'Haz un aderezo con cebolla y ajo.'
from public.dishes d
where d.slug = 'garbanzos-con-acelga'
union all
select d.id, 3, 'Agrega acelga picada y los garbanzos cocidos.'
from public.dishes d
where d.slug = 'garbanzos-con-acelga'
union all
select d.id, 4, 'Cocina unos minutos y sirve con arroz.'
from public.dishes d
where d.slug = 'garbanzos-con-acelga'
union all
select d.id, 1, 'Separa la coliflor en ramitos.'
from public.dishes d
where d.slug = 'guiso-de-coliflor'
union all
select d.id, 2, 'Prepara aderezo con cebolla y ajo.'
from public.dishes d
where d.slug = 'guiso-de-coliflor'
union all
select d.id, 3, 'Agrega papa, arvejas y coliflor con poco líquido.'
from public.dishes d
where d.slug = 'guiso-de-coliflor'
union all
select d.id, 4, 'Cocina hasta que quede tierno y sirve con arroz.'
from public.dishes d
where d.slug = 'guiso-de-coliflor'
union all
select d.id, 1, 'Cocina el pecho de res hasta que ablande.'
from public.dishes d
where d.slug = 'locro-de-pecho'
union all
select d.id, 2, 'Agrega zapallo, papa y choclo al caldo.'
from public.dishes d
where d.slug = 'locro-de-pecho'
union all
select d.id, 3, 'Deja que el zapallo se deshaga y espese.'
from public.dishes d
where d.slug = 'locro-de-pecho'
union all
select d.id, 4, 'Sirve con arroz.'
from public.dishes d
where d.slug = 'locro-de-pecho'
union all
select d.id, 1, 'Corta el pollo y la papa en cubos.'
from public.dishes d
where d.slug = 'matasquita-de-pollo'
union all
select d.id, 2, 'Haz un aderezo con cebolla, ajo y tomate.'
from public.dishes d
where d.slug = 'matasquita-de-pollo'
union all
select d.id, 3, 'Agrega pollo y papa, cocina hasta que quede jugoso.'
from public.dishes d
where d.slug = 'matasquita-de-pollo'
union all
select d.id, 4, 'Sirve con arroz.'
from public.dishes d
where d.slug = 'matasquita-de-pollo'
union all
select d.id, 1, 'Aplana y sazona las pechugas.'
from public.dishes d
where d.slug = 'milanesa-de-pollo'
union all
select d.id, 2, 'Pásalas por huevo y pan rallado.'
from public.dishes d
where d.slug = 'milanesa-de-pollo'
union all
select d.id, 3, 'Fríe hasta dorar por ambos lados.'
from public.dishes d
where d.slug = 'milanesa-de-pollo'
union all
select d.id, 4, 'Sirve con arroz, papa o ensalada.'
from public.dishes d
where d.slug = 'milanesa-de-pollo'
union all
select d.id, 1, 'Sancocha y prensa la papa.'
from public.dishes d
where d.slug = 'papa-rellena-con-arroz'
union all
select d.id, 2, 'Prepara relleno con carne, huevo y aceituna.'
from public.dishes d
where d.slug = 'papa-rellena-con-arroz'
union all
select d.id, 3, 'Forma papas rellenas y fríelas hasta dorar.'
from public.dishes d
where d.slug = 'papa-rellena-con-arroz'
union all
select d.id, 4, 'Sirve con arroz y salsa criolla.'
from public.dishes d
where d.slug = 'papa-rellena-con-arroz'
union all
select d.id, 1, 'Limpia y blanquea los rocotos.'
from public.dishes d
where d.slug = 'rocoto-relleno-con-pastel-de-papa'
union all
select d.id, 2, 'Prepara relleno con carne, cebolla y especias.'
from public.dishes d
where d.slug = 'rocoto-relleno-con-pastel-de-papa'
union all
select d.id, 3, 'Rellena los rocotos y cúbrelos con queso.'
from public.dishes d
where d.slug = 'rocoto-relleno-con-pastel-de-papa'
union all
select d.id, 4, 'Hornea con pastel de papa hasta gratinar.'
from public.dishes d
where d.slug = 'rocoto-relleno-con-pastel-de-papa'
union all
select d.id, 1, 'Dora las presas de pollo.'
from public.dishes d
where d.slug = 'seco-de-pollo'
union all
select d.id, 2, 'Licúa culantro y prepara aderezo.'
from public.dishes d
where d.slug = 'seco-de-pollo'
union all
select d.id, 3, 'Agrega papa, zanahoria y el pollo.'
from public.dishes d
where d.slug = 'seco-de-pollo'
union all
select d.id, 4, 'Cocina hasta que quede jugoso y sirve con arroz.'
from public.dishes d
where d.slug = 'seco-de-pollo'
union all
select d.id, 1, 'Sancocha los tallarines al dente.'
from public.dishes d
where d.slug = 'tallarines-a-la-bolonesa'
union all
select d.id, 2, 'Prepara salsa con carne molida, tomate y cebolla.'
from public.dishes d
where d.slug = 'tallarines-a-la-bolonesa'
union all
select d.id, 3, 'Cocina hasta que la salsa tome cuerpo.'
from public.dishes d
where d.slug = 'tallarines-a-la-bolonesa'
union all
select d.id, 4, 'Sirve la salsa sobre la pasta.'
from public.dishes d
where d.slug = 'tallarines-a-la-bolonesa'
union all
select d.id, 1, 'Sazona las chuletas con ajo, sal y especias.'
from public.dishes d
where d.slug = 'chuleta-de-chancho-al-horno'
union all
select d.id, 2, 'Acomódalas con papas en una fuente.'
from public.dishes d
where d.slug = 'chuleta-de-chancho-al-horno'
union all
select d.id, 3, 'Hornea hasta dorar y cocinar por completo.'
from public.dishes d
where d.slug = 'chuleta-de-chancho-al-horno'
union all
select d.id, 4, 'Sirve con arroz y ensalada.'
from public.dishes d
where d.slug = 'chuleta-de-chancho-al-horno'
union all
select d.id, 1, 'Sazona las chuletas.'
from public.dishes d
where d.slug = 'chuleta-de-chancho-frita-con-arroz-y-ensalada'
union all
select d.id, 2, 'Fríelas hasta que queden doradas y cocidas.'
from public.dishes d
where d.slug = 'chuleta-de-chancho-frita-con-arroz-y-ensalada'
union all
select d.id, 3, 'Prepara arroz y ensalada fresca.'
from public.dishes d
where d.slug = 'chuleta-de-chancho-frita-con-arroz-y-ensalada'
union all
select d.id, 4, 'Sirve todo junto.'
from public.dishes d
where d.slug = 'chuleta-de-chancho-frita-con-arroz-y-ensalada'
union all
select d.id, 1, 'Sella el cerdo en trozos.'
from public.dishes d
where d.slug = 'chancho-a-la-olla'
union all
select d.id, 2, 'Agrega aderezo, papa y camote.'
from public.dishes d
where d.slug = 'chancho-a-la-olla'
union all
select d.id, 3, 'Cocina tapado a fuego bajo hasta que esté tierno.'
from public.dishes d
where d.slug = 'chancho-a-la-olla'
union all
select d.id, 4, 'Sirve con arroz y su jugo.'
from public.dishes d
where d.slug = 'chancho-a-la-olla'
union all
select d.id, 1, 'Dora el cerdo.'
from public.dishes d
where d.slug = 'seco-de-cerdo'
union all
select d.id, 2, 'Licúa culantro y prepara un aderezo.'
from public.dishes d
where d.slug = 'seco-de-cerdo'
union all
select d.id, 3, 'Agrega papa y cocina hasta que el cerdo quede suave.'
from public.dishes d
where d.slug = 'seco-de-cerdo'
union all
select d.id, 4, 'Sirve con arroz.'
from public.dishes d
where d.slug = 'seco-de-cerdo'
union all
select d.id, 1, 'Escurre el atún y desmenúzalo en un bol.'
from public.dishes d
where d.slug = 'croquetas-de-atun-con-arroz'
union all
select d.id, 2, 'Cocina las papas, machácalas y mézclalas con el atún.'
from public.dishes d
where d.slug = 'croquetas-de-atun-con-arroz'
union all
select d.id, 3, 'Agrega huevo, sal y pimienta; forma croquetas.'
from public.dishes d
where d.slug = 'croquetas-de-atun-con-arroz'
union all
select d.id, 4, 'Pasa por pan rallado, fríe y sirve con arroz.'
from public.dishes d
where d.slug = 'croquetas-de-atun-con-arroz'
union all
select d.id, 1, 'Sancocha los tallarines al dente.'
from public.dishes d
where d.slug = 'tallarines-rojos-con-atun'
union all
select d.id, 2, 'Prepara salsa roja con tomate, cebolla y ajo.'
from public.dishes d
where d.slug = 'tallarines-rojos-con-atun'
union all
select d.id, 3, 'Agrega el atún escurrido al final para que no se seque.'
from public.dishes d
where d.slug = 'tallarines-rojos-con-atun'
union all
select d.id, 4, 'Sirve la salsa sobre los tallarines.'
from public.dishes d
where d.slug = 'tallarines-rojos-con-atun';

commit;
