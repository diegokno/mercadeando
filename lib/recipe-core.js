(function (root, factory) {
  const api = factory();
  if (typeof module === 'object' && module.exports) module.exports = api;
  else root.RecipeCore = api;
})(typeof globalThis !== 'undefined' ? globalThis : this, function () {
  'use strict';
  const normalize = value => String(value || '').normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase().replace(/\s+/g, ' ').trim();
  const units = {
    kg: 'kg', kilo: 'kg', kilos: 'kg', kilogramo: 'kg', kilogramos: 'kg',
    g: 'g', gr: 'g', gramos: 'g', gramo: 'g', ml: 'ml', mililitros: 'ml', mililitro: 'ml',
    l: 'l', litro: 'l', litros: 'l', taza: 'taza', tazas: 'taza',
    cucharada: 'cda', cucharadas: 'cda', cda: 'cda', cucharadita: 'cdta', cucharaditas: 'cdta', cdta: 'cdta',
    unid: 'unid', unidades: 'unid', unidad: 'unid', presa: 'presa', presas: 'presa',
    dientes: 'diente', diente: 'diente', hojas: 'hoja', hoja: 'hoja',
    lata: 'lata', latas: 'lata', paquete: 'paquete', paquetes: 'paquete', sobre: 'sobre', sobres: 'sobre',
    rama: 'rama', ramas: 'rama', atado: 'atado', atados: 'atado', tajada: 'tajada', tajadas: 'tajada'
  };
  function parse(raw) {
    let text = normalize(raw).replace(/,/g, '.').replace(/[()]/g, ' ');
    const fractions = {'½': '1/2', '¼': '1/4', '¾': '3/4', '⅓': '1/3', '⅔': '2/3', '⅛': '1/8'};
    text = text.replace(/[½¼¾⅓⅔⅛]/g, x => ' ' + fractions[x]).replace(/\s+/g, ' ').trim();
    const match = text.match(/^(?:aprox\.?\s*)?(?:(\d+)\s+)?(\d+\s*\/\s*\d+|\d+(?:\.\d+)?)\s+([a-z]+)\b(.*)$/);
    if (!match || /\d|\b(o|a|hasta)\b|[-–]/.test(match[4])) return {q: null, u: '', raw};
    const number = match[2].includes('/') ? match[2].split('/').map(Number).reduce((a, b) => a / b) : Number(match[2]);
    const q = Number(match[1] || 0) + number, u = units[match[3]];
    return Number.isFinite(q) && q >= 0 && u ? {q, u, raw} : {q: null, u: '', raw};
  }
  function format(q) {
    if (q === null || !Number.isFinite(q)) return 'cantidad necesaria';
    return new Intl.NumberFormat('es-PE', {maximumFractionDigits: 3}).format(q);
  }
  function shoppingMeasure(name, measurement) {
    const m = {...measurement}, key = normalize(name);
    if (m.q === null) return m;
    if (m.u === 'g') return {...m, q: m.q / 1000, u: 'kg'};
    if (m.u === 'l') return {...m, q: m.q * 1000, u: 'ml'};
    // Dry rice: agreed household reference, not a universal density conversion.
    if (/^arroz(?: integral)?$/.test(key) && m.u === 'taza') return {...m, q: m.q * .18, u: 'kg', estimate: '180 g de arroz crudo por taza'};
    if (m.u === 'cda') return {...m, q: m.q * 15, u: 'ml', estimate: 'cucharada de 15 ml'};
    if (m.u === 'cdta') return {...m, q: m.q * 5, u: 'ml', estimate: 'cucharadita de 5 ml'};
    // Other cup weights, package weights and produce yields require explicit evidence.
    return m;
  }
  function scale(dish, people = 2, portion = 'regular') {
    const factor = people / (dish.portions || 2) * ({poco: .82, regular: 1, taypa: 1.25}[portion] || 1);
    return (dish.ingredients || []).filter(i => !i.pantry && !i.optional).map(i => {
      const measure = parse(i.shopping_quantity || i.quantity);
      const shop = shoppingMeasure(i.name, measure);
      let cooking = parse(i.cooking_quantity || i.quantity);
      let qty = shop.q === null ? null : shop.q * factor;
      // Whole chicken portions cannot become 0.82 of a piece per person.
      if (measure.u === 'presa' && measure.q === (dish.portions || 2)) {
        qty = people * (portion === 'taypa' ? 2 : 1);
        cooking = {...cooking, q: qty / factor};
      }
      return {n: i.name, key: normalize(i.name), label: i.recipe_name || i.name,
        q: qty, u: shop.u, raw: i.quantity, inferred: !!i.inferred, estimate: shop.estimate || '',
        cooking: cooking.q === null ? (i.cooking_quantity || i.quantity) : `${format(cooking.q * factor)} ${cooking.u}`,
        unknown: shop.q === null, cat: i.category || '', pantry: false};
    });
  }
  function aggregate(dishes, people = 2, portion = 'regular', manual = []) {
    const map = new Map();
    for (const dish of dishes) {
      if (dish.skipShopping) continue;
      for (const item of dish.ings || scale(dish, dish.rations || people, portion)) add(item, dish.n || dish.name);
    }
    for (const item of manual) add(item, item.use || 'Agregado manualmente');
    function add(item, title) {
      if (item.pantry || item.optional) return;
      const m = shoppingMeasure(item.n, {q: item.q, u: item.u});
      const key = normalize(item.n) + '|' + (m.q === null ? 'unknown' : m.u);
      const current = map.get(key) || {...item, q: m.q === null ? null : 0, u: m.u, uses: []};
      if (m.q !== null) current.q += m.q;
      if (!current.uses.includes(title)) current.uses.push(title);
      map.set(key, current);
    }
    const byIngredient = new Map();
    for (const item of map.values()) {
      const key = normalize(item.n), combined = byIngredient.get(key) || {...item, key, components: [], uses: []};
      combined.components.push({q: item.q, u: item.u});
      for (const title of item.uses) if (!combined.uses.includes(title)) combined.uses.push(title);
      byIngredient.set(key, combined);
    }
    return [...byIngredient.values()].map(i => ({...i,
      q: i.components.length > 1 ? null : i.q === null ? null : Math.round(i.q * 1e6) / 1e6,
      measureText: i.components.map(m => m.q === null ? 'cantidad necesaria' : `${format(m.q)} ${m.u}`).join(' + '),
      use: i.uses.join(' · '), unknown: i.components.some(m => m.q === null)}));
  }
  return {normalize, parse, format, shoppingMeasure, scale, aggregate};
});
