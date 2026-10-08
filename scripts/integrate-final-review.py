"""Build an authoritative catalog from the preserved human review, never from templates."""
import copy
import hashlib
import json
import re
import unicodedata
from pathlib import Path
from urllib.parse import unquote, urlparse

ROOT = Path(__file__).resolve().parents[1]
PRIVATE = ROOT / 'research/final-integration-2026-10-07'


def read(path):
    return json.loads(path.read_text(encoding='utf-8'))


def norm(s):
    return ' '.join(''.join(c for c in unicodedata.normalize('NFD', s.lower()) if not unicodedata.combining(c)).split())


def slug(s):
    return re.sub(r'[^a-z0-9]+', '-', norm(s)).strip('-')


def write(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')


def main():
    review = read(PRIVATE / 'user-review-final.json')
    decisions = read(ROOT / 'data/final-review-decisions.json')
    groups = {g['group_id']: g for g in read(ROOT / 'dish-stack-curation-export.json')['groups']}
    old = {d['slug']: d for d in read(PRIVATE / 'dishes-before-integration.json')['dishes']}
    mapping = read(ROOT / 'research/acomer/curated/acomer_curation_mapping.json')
    canonical = {norm(m['source']): m['target'] for m in mapping if m['target']}
    canonical.update({norm(m['target']): m['target'] for m in mapping if m['target']})
    canonical.update({'arveja': 'Arvejas', 'cebolla roja': 'Cebolla', 'carne molida': 'Carne Molida', 'fideo': 'Fideo', 'harina de chuno': 'Harina de Chuño', 'platano bellaco': 'Plátano Bellaco', 'pechuga de pollo': 'Pechuga de Pollo'})
    sources = {f"acomer:{r['post_id']}": r for r in read(ROOT / 'research/acomer/curated/acomer_curated_recipes.json')}
    changes, warnings, output, image_jobs = [], [], [], []
    basics = {'aceite', 'sal', 'pimienta', 'comino', 'oregano', 'agua', 'pabilo'}

    def ingredient(name, qty, pantry=False, label=None, inferred=False):
        return {'name': canonical.get(norm(name), name), 'recipe_name': label or name,
                'quantity': qty, 'shopping_quantity': qty, 'cooking_quantity': '',
                'pantry': pantry or norm(name) in basics, 'optional': False,
                'inferred': inferred, 'source': 'revisión final',
                'inferred_reason': 'Cantidad editorial, no especificada por la fuente' if inferred else ''}

    def add(items, name, qty, inferred=False):
        if not any(norm(canonical.get(norm(i['name']), i['name'])) == norm(canonical.get(norm(name), name)) for i in items):
            items.append(ingredient(name, qty, inferred=inferred))

    for r in review['reviews']:
        rid, group = r['winnerId'], groups[r['groupId']]
        legacy = next((x['id'][4:] for x in group['dishes'] if x['id'].startswith('old:') and x['id'][4:] in old), None)
        previous = old.get(legacy, {})
        items = copy.deepcopy(r['selectedIngredients'] + r['pantryIngredients'] + r['optionalIngredients'])
        steps = list(r['preliminarySteps'])
        original = {'ingredients': copy.deepcopy(items), 'steps': list(steps)}
        title = r['title']
        source, url = r['source'], r['sourceUrl']
        provenance = {'winnerId': rid, 'groupId': r['groupId'], 'reviewed': r['verified'], 'source': source, 'url': url, 'basePortions': 2}
        override = decisions['overrides'].get(rid)
        if rid == 'acomer:628':
            steps = [
                'Lava y licua culantro y espinaca con poca agua. Reserva en frío.',
                'Corta el pollo; reserva huesos para hervir con apio 20–30 minutos. Cuela el caldo.',
                'Salpimienta el pollo y séllalo en aceite 2 minutos por lado. Retira.',
                'Sofríe cebolla 10 minutos, ajo 3 y pasta de ají amarillo 10, a fuego bajo.',
                'Añade chicha, la mitad del licuado verde, caldo y pollo. Tapa y cocina 25 minutos, hasta cocerlo.',
                'Retira el pollo y mide el caldo: por cada taza de arroz, usa una taza y una cucharada de caldo.',
                'Añade arroz, zanahoria, arvejas y choclo al caldo. Sazona, tapa y cocina a fuego mínimo.',
                'A los 5 minutos, incorpora el licuado restante y el pollo con sus jugos. Tapa 10 minutos más, hasta granear.',
                'Licua el ají amarillo sin venas ni semillas con queso, leche y aceite para la huancaína. Sancocha las papas.',
                'Asa el pimiento, retira piel y semillas y córtalo. Sirve arroz y pollo con pimiento y papas cubiertas de huancaína.'
            ]
            provenance['adaptation'] = 'Pasos corregidos contra la fuente con autorización del usuario; ingredientes y cantidades de la revisión conservados.'
        if rid == 'acomer:845':
            steps = [
                'Lava la quinua 4–5 veces y cuela. Cocina con dos tazas de agua por taza de quinua: al hervir, tapa y baja al mínimo 20 minutos. Reserva.',
                'Sofríe cebolla en aceite 5 minutos; añade ajo y cocina 5 minutos. Agrega pasta de ají amarillo y sofríe otros 5 minutos.',
                'Añade una ramita de huacatay y dórala para aromatizar. Incorpora agua —dos tazas por taza de quinua seca— y lleva a hervor.',
                'Agrega la quinua cocida e integra. Ajusta la textura con agua caliente si hace falta.',
                'Añade leche evaporada y queso en cubos. Al volver a hervir, retira del fuego y sazona con orégano y sal.',
                'Sirve con el arroz cocinado por separado.'
            ]
            provenance['adaptation'] = 'Pasos corregidos contra la fuente con autorización. No se añade pollo opcional ni papa no incluida en la selección aprobada.'
        if override:
            items = [ingredient(n, q, inferred=override.get('estimatedQuantities', False)) for n, q in override['ingredients']]
            items += [ingredient(i[0], i[1], True, i[2] if len(i) > 2 else None) for i in override.get('pantry', [])]
            steps = override['steps']; source = override['source']; url = override.get('sourceUrl', url)
            provenance.update(source=source, url=url, sourcePortions=override.get('sourcePortions'), adaptation=override['note'])
        if rid.startswith('old:'):
            # Ingredient omissions explicitly identified in the procedure. Do not re-author approved A Comer dishes.
            if re.search(r'\bajo\b', norm(' '.join(steps))): add(items, 'Ajo', 'cantidad necesaria', True)
            if re.search(r'\bcebolla\b', norm(' '.join(steps))): add(items, 'Cebolla', 'cantidad necesaria', True)
            if 'sillao' in norm(' '.join(steps)): add(items, 'Salsa de Soya', 'cantidad necesaria', True)
            if 'limon' in norm(' '.join(steps)): add(items, 'Limón', 'al gusto')
            for i in items:
                if norm(i['name']) == 'pechuga de pollo' and 'presa' in i['quantity']:
                    i.update(quantity='400 g', shopping_quantity='400 g', cooking_quantity='400 g', inferred=True, inferred_reason='Corrección editorial: pechuga por peso para dos porciones')
        if rid == 'old:arroz-a-la-cubana':
            for i in items:
                if 'platano' in norm(i['name']): i['name'] = i['recipe_name'] = 'Plátano Bellaco'
        if rid == 'old:matasquita-de-pollo':
            for i in items:
                if norm(i['name']) == 'pollo': i.update(name='Pechuga de Pollo', recipe_name='Pechuga de pollo', quantity='400 g', shopping_quantity='400 g', cooking_quantity='400 g')
            steps[0] = 'Corta la pechuga en trozos y las papas crudas peladas en cubos.'
        if rid == 'old:palta-rellena':
            for i in items:
                if norm(i['name']) == 'pollo': i.update(name='Pechuga de Pollo', recipe_name='Pechuga de pollo', quantity='300 g', shopping_quantity='300 g', inferred=True)
        if rid == 'old:aji-de-fideos-fideitos':
            add(items, 'Carne de Res', '250 g', True)
            add(items, 'Perejil', 'al gusto')
            steps = ['Corta la carne en trozos pequeños, salpimienta y dórala en aceite; retira y reserva.',
                     'En la misma olla, sofríe cebolla y ajo. Agrega el ají panca y cocina el aderezo.',
                     'Añade la papa en cubos y agua hasta cubrir. Cocina hasta que empiece a ablandarse.',
                     'Incorpora los fideos y la carne reservada. Cocina hasta que ambos estén listos, agregando agua si hace falta.',
                     'Termina con queso fresco desmenuzado y perejil picado.']
            provenance['adaptation'] = 'Carne y perejil incorporados por la nota de voz del usuario. Los 250 g de carne son una cantidad editorial para dos, no una cifra de fuente.'
        if rid == 'old:caldo-de-pollo':
            items = [ingredient(n, q) for n, q in [('Pollo', '2 presas'), ('Ajo', '0.5 cucharadita'), ('Cebolla', '0.25 unid'), ('Apio', '0.25 taza'), ('Zanahoria', '1 unid'), ('Papa', '1 unid'), ('Fideo', '62.5 g'), ('Perejil', 'al gusto')]]
            items += [ingredient(n, q, True) for n, q in [('Agua', '1 litro'), ('Sal', 'al gusto'), ('Pimienta', 'al gusto'), ('Orégano', 'al gusto')]]
            steps = ['Hierve el agua. Agrega el pollo, orégano, sal y pimienta; tapa y cocina 10 minutos. Retira la espuma que aparezca.',
                     'Añade ajo, cebolla, apio, zanahoria y papa cortados. Cocina unos 30 minutos, hasta que el pollo y las verduras estén cocidos.',
                     'Agrega los fideos y cocina hasta que estén tiernos. Sirve con perejil picado.']
            url = 'https://jameaperu.com/recetas/sopas/caldo-de-pollo/'
            source = 'Jamea Perú'
            provenance.update(source=source, url=url, sourcePortions=4, adaptation='Fuente para cuatro dividida entre dos. La fuente no requiere sellar el pollo; se conserva la cocción directa.')
        if rid == 'old:frejoles-con-seco-de-res': steps = [s.replace('desde la víspera', 'la noche anterior') for s in steps]
        if rid == 'old:chuleta-de-chancho-frita-con-arroz-y-ensalada':
            add(items, 'Papa', '2 unid', True)
            steps.insert(-1, 'Sancocha las papas, córtalas y dóralas en aceite. Sirve junto a las chuletas.')
            warnings.append({'id': rid, 'issue': 'El nombre incluye ensalada pero no hay una composición aprobada. No se inventó una ensalada ni se agregó como producto de compra.'})
        if rid == 'old:soltero-de-queso':
            add(items, 'Papa', '2 unid', True); add(items, 'Vinagre', 'al gusto')
            steps.insert(0, 'Sancocha las papas y sirve como base del soltero.')
            steps[3] = 'Mezcla con aceitunas, limón, vinagre, sal y aceite.'
        if rid == 'old:pollo-al-horno':
            items = [i for i in items if norm(i['name']) != 'ensalada']
            steps[-1] = 'Sirve con arroz preparado por separado, papa y camote horneados.'
            warnings.append({'id': rid, 'issue': 'Ensalada genérica excluida; composición no especificada. Se conserva la opción de arroz y tubérculos.'})
        if rid == 'acomer:624': items = [i for i in items if norm(i['name']) != 'queso parmesano']
        if rid == 'acomer:1193':
            steps = ['Corta la carne en cubos y salpimienta. Séllala con aceite en una olla; retira y reserva.', 'En la misma olla, sofríe cebolla cinco minutos y ajo tres minutos. Añade ají panca y mirasol; sofríe cinco minutos.', 'Devuelve la carne, agrega laurel y agua. Tapa y cocina unos 20 minutos, hasta que la carne esté tierna.', 'Añade zanahoria en cubos y arvejas; tapa tres minutos. Incorpora papa cruda en cubos y más agua si hace falta.', 'Cocina tapado 6–8 minutos o hasta ablandar las papas. Termina con perejil y orégano; sirve caliente.']
        if rid == 'acomer:761': steps[0] = 'Cuece las papas hasta que estén tiernas. Pélalas y prénsalas calientes; deja enfriar.'
        if rid == 'acomer:1419':
            items = [i for i in items if norm(i['name']) not in {'pulpa de cangrejo', 'ketchup', 'culantro', 'aji limo'}]
            steps = [s for s in steps if 'Alternativa al pollo' not in s]
            steps = [s.replace('el relleno elegido', 'el relleno de pollo') for s in steps]
            # The source gives separate lemon/garlic allocations for both alternatives. Remove the crab-only allocations.
            lemon = [i for i in items if norm(i['name']) == 'limon']; garlic = [i for i in items if norm(i['name']) == 'ajo']
            if len(lemon) == 3: items.remove(lemon[-1])
            if len(garlic) == 2: items.remove(garlic[-1])
        if rid == 'acomer:764':
            for i in items:
                if 'pabilo' in norm(i['name']): i['pantry'] = True
        if rid == 'acomer:1709':
            title = 'Pollo a la Gaseosa Negra'
            for i in items:
                if 'coca' in norm(i['name']): i['name'] = i['recipe_name'] = 'Gaseosa Negra'
            steps = [re.sub(r'Coca[ -]?Cola', 'gaseosa negra', s, flags=re.I) for s in steps]
        if rid == 'acomer:1778':
            steps = [re.sub(r'\bKikko(?:man)?\b', '', s, flags=re.I) for s in steps]
            for i in items:
                for field in ['name', 'recipe_name']:
                    if i.get(field): i[field] = re.sub(r'\s*\bKikko(?:man)?\b', '', i[field], flags=re.I).strip()
        if rid == 'acomer:970': title = 'Arroz Árabe'
        for i in items:
            i['name'] = canonical.get(norm(i['name']), i['name'])
            if norm(i['name']) in basics or 'pabilo' in norm(i['name']): i['pantry'] = True
            i['category'] = category(i['name'])
        src = sources.get(rid, {})
        if src:
            provenance['sourcePortions'] = src.get('servings')
            provenance['sourceServingLabel'] = src.get('serving_tag')
            provenance['quantityBasis'] = 'Cantidades de la revisión humana para dos; no se vuelve a escalar la fuente.'
        metadata = classify(title, items, previous)
        if rid == 'old:aji-de-fideos-fideitos': metadata.update(base='Res', cat='res')
        photo = unquote(group.get('image_reference_url', ''))
        if photo.startswith('file:'):
            photo = urlparse(photo).path.lstrip('/')
            photo = Path(photo).relative_to(ROOT).as_posix()
        active = r['active'] and rid not in decisions['retire']
        d = {'slug': legacy or slug(title), 'winnerId': rid, 'groupId': r['groupId'], 'n': title,
             'aliases': list(dict.fromkeys([r['title']] + [x['title'] for x in group['dishes']])),
             'active': active, 'portions': 2, 'ingredients': items, 'steps': steps, 'provenance': provenance,
             'sourceUrl': url, 'img': photo, 'imageDecision': r['imageDecision'], 'imageStatus': 'reference_pending' if r['imageDecision'] != 'keep_local' else 'kept',
             'quick': rid == 'acomer:1406' or norm(src.get('time_needed_tag') or '') in {'15 minutos', 'menos de media hora'},
             **metadata}
        if rid == 'acomer:970': d['season'] = {'start': 1208, 'end': 1231}
        generated = ROOT / f"imagenes-platos/final/{d['slug']}.png"
        if generated.exists(): d.update(img=generated.relative_to(ROOT).as_posix(), imageStatus='generated')
        if active and (d['imageStatus'] == 'reference_pending' or (rid == 'old:seco-de-res' and d['imageStatus'] != 'generated')):
            image_jobs.append({'slug': d['slug'], 'name': title, 'reference': photo, 'status': d['imageStatus'], 'ingredients': [i['recipe_name'] if i.get('recipe_name') else i['name'] for i in items if not i.get('pantry')], 'instruction': 'Eliminar frejoles; conservar el resto' if rid == 'old:seco-de-res' else 'Generar imagen original con la guía de estilo y la referencia aprobada'})
        if rid.startswith('acomer:') and original != {'ingredients': r['selectedIngredients'] + r['pantryIngredients'] + r['optionalIngredients'], 'steps': steps}:
            changes.append({'id': rid, 'reason': 'Corrección explícita de la revisión humana', 'stepsChanged': steps != original['steps']})
        if r.get('needsRecipe') and not override and rid not in {'acomer:1726', 'old:caigua-rellena', 'acomer:1137', 'acomer:1846', 'old:cau-cau-de-pollo', 'old:chaque', 'acomer:540', 'acomer:761'}:
            warnings.append({'id': rid, 'issue': 'Solicitud de revisión de fuente pendiente de verificación editorial completa'})
        if not steps and active: raise ValueError(f'Receta vacía: {rid}')
        output.append(d)
    payload = {'version': decisions['version'], 'basePortions': 2, 'dishes': output, 'ingredientRules': {'dryRiceGramsPerCup': 180, 'pantryExcludedFromShopping': True, 'quantityUnknownIsNotZero': True}}
    write(ROOT / 'data/catalog.final.json', payload)
    (ROOT / 'data/catalog.final.js').write_text('globalThis.MercadeandoCatalog = ' + json.dumps(payload, ensure_ascii=False) + ';\n', encoding='utf-8')
    registry = {}
    for d in output:
        for i in d['ingredients']:
            registry.setdefault(norm(i['name']), {'id': slug(i['name']), 'name': i['name'], 'category': i['category'], 'pantry': i.get('pantry', False)})
    write(ROOT / 'data/ingredients.final.json', list(registry.values()))
    write(PRIVATE / 'image-generation-manifest.json', image_jobs)
    write(PRIVATE / 'integration-audit.json', {'reviewSha256': hashlib.sha256((PRIVATE / 'user-review-final.json').read_bytes()).hexdigest(), 'verified': sum(r['verified'] for r in review['reviews']), 'total': len(output), 'active': sum(d['active'] for d in output), 'imagesPending': len(image_jobs), 'warnings': warnings, 'explicitAcomerChanges': changes})
    print(f"Catalog: {len(output)} dishes, {sum(d['active'] for d in output)} active; {len(image_jobs)} image jobs; {len(warnings)} editorial issues")


def category(name):
    n = norm(name)
    if any(s in n for s in ['queso', 'leche', 'huevo', 'mantequilla']): return 'Lácteos y huevos'
    if any(re.search(r'\b' + s + r'\b', n) for s in ['pollo', 'carne', 'cerdo', 'res', 'pescado', 'atun', 'pavo', 'malaya', 'pechuga', 'chuleta', 'higado', 'langostino', 'jamon', 'tocino', 'salchicha']): return 'Proteínas'
    if any(s in n for s in ['arroz', 'harina', 'pan ', 'fideo', 'tallarin', 'mezcla', 'quinua', 'lenteja', 'frejol']): return 'Abarrotes'
    return 'Verduras y otros'


def classify(title, ingredients, old):
    if old: return {'base': old['base'], 'prep': old['preparation'], 'p': old['preparation_key'], 'cat': old['category']}
    names = norm(title + ' ' + ' '.join(i['name'] for i in ingredients))
    base = 'Vegetariano'
    for label, words in [('Pollo', ['pollo', 'pavo', 'gallina']), ('Res', ['res', 'carne', 'bofe', 'mondongo', 'cabrito']), ('Cerdo', ['cerdo', 'chancho', 'chanchito', 'lechon', 'cecina']), ('Pescado', ['pescado', 'bonito', 'mariscos', 'pejerrey', 'langostino', 'atun', 'cebiche']), ('Menestra', ['lenteja', 'frejol', 'garbanzo'])]:
        if any(re.search(r'\b' + w + r'\b', names) for w in words): base = label; break
    t = norm(title)
    p = 'frio' if any(w in t for w in ['ensalada', 'cebiche', 'tiradito', 'causa', 'huancaina']) else 'sopa' if any(w in t for w in ['sopa', 'caldo', 'parihuela', 'chupe', 'menestron', 'aguadito', 'chilcano']) else 'pasta' if any(w in t for w in ['tallarin', 'fettuccine', 'macarron', 'lasana']) else 'arroz' if any(w in t for w in ['arroz', 'chaufa']) else 'frito' if any(w in t for w in ['frito', 'broaster', 'chicharron']) else 'saltado' if 'saltad' in t else 'guiso'
    return {'base': base, 'p': p, 'prep': {'frio': 'Frío', 'sopa': 'Sopa', 'pasta': 'Pasta', 'arroz': 'Arroz', 'frito': 'Frito', 'saltado': 'Saltado', 'guiso': 'Guiso'}[p], 'cat': norm(base)}


if __name__ == '__main__': main()
