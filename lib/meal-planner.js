(function (root, factory) {
  const core = typeof module === 'object' && module.exports ? require('./recipe-core.js') : root.RecipeCore;
  const api = factory(core);
  if (typeof module === 'object' && module.exports) module.exports = api;
  else root.MealPlanner = api;
})(typeof globalThis !== 'undefined' ? globalThis : this, function (core) {
  'use strict';
  const defaults = {
    lechuga: {unit: 'unid', size: 1, freshnessDays: 3},
    col: {unit: 'unid', size: 1, freshnessDays: 5},
    'col o repollo': {unit: 'unid', size: 1, freshnessDays: 5},
    apio: {unit: 'atado', size: 1, freshnessDays: 5},
    culantro: {unit: 'atado', size: 1, freshnessDays: 3},
    perejil: {unit: 'atado', size: 1, freshnessDays: 3},
    tomate: {unit: 'unid', size: 1, freshnessDays: 5},
    cebolla: {unit: 'unid', size: 1, freshnessDays: 14},
    zanahoria: {unit: 'unid', size: 1, freshnessDays: 7},
    pimiento: {unit: 'unid', size: 1, freshnessDays: 5},
    brocoli: {unit: 'unid', size: 1, freshnessDays: 3},
    coliflor: {unit: 'unid', size: 1, freshnessDays: 5},
    pepino: {unit: 'unid', size: 1, freshnessDays: 5},
    palta: {unit: 'unid', size: 1, freshnessDays: 2},
    choclo: {unit: 'unid', size: 1, freshnessDays: 3}
  };
  function available(dish, date) {
    if (dish.active === false) return false;
    if (!dish.season) return true;
    const md = (date.getMonth() + 1) * 100 + date.getDate();
    return md >= dish.season.start && md <= dish.season.end;
  }
  function hash(text) {let h = 2166136261; for (const c of String(text)) h = Math.imul(h ^ c.charCodeAt(0), 16777619); return h >>> 0;}
  function plan(catalog, options = {}) {
    const people = options.people || 2, portion = options.portion || 'regular';
    const count = options.days || 28, start = new Date(options.startDate || new Date());
    const packages = {...defaults, ...options.packages};
    for (const rule of Object.values(packages)) if (!(rule.size > 0) || !(rule.freshnessDays >= 0)) throw new Error('Invalid package or freshness rule');
    const rejected = new Set(options.rejected || []), liked = new Set(options.liked || []);
    const pool = catalog.filter(d => !rejected.has(d.n) && (!liked.size || liked.has(d.n)) && d.active !== false);
    const needs = new Map(pool.map(d => [d.slug || d.n, core.aggregate([d], people, portion)]));
    let beam = [{score: 0, days: [], stock: {}, reasons: []}];
    const warnings = [], width = Math.min(options.beamWidth || 12, 32);
    for (let day = 0; day < count; day++) {
      const date = new Date(start); date.setDate(start.getDate() + day);
      if ((options.noCook || []).includes(day % 7)) {
        beam = beam.map(s => ({...s, days: [...s.days, null], reasons: [...s.reasons, []]})); continue;
      }
      const valid = pool.filter(d => available(d, date));
      if (!valid.length) {
        warnings.push({day, reason: 'No hay platos elegibles para este día.'});
        beam = beam.map(s => ({...s, days: [...s.days, null], reasons: [...s.reasons, []]})); continue;
      }
      const fast = (options.quickDays || []).includes(day % 7);
      const quick = valid.filter(d => d.quick === true || (d.minutes && d.minutes <= 30));
      const candidates = fast && quick.length ? quick : valid;
      if (fast && !quick.length) warnings.push({day, reason: 'No hay platos rápidos entre los elegidos.'});
      const next = [];
      for (const state of beam) {
        const ranked = candidates.map(dish => evaluate(state, dish, day));
        ranked.sort((a, b) => a.score - b.score || a.tie - b.tie);
        next.push(...ranked.slice(0, width));
      }
      next.sort((a, b) => a.score - b.score || a.tie - b.tie);
      beam = next.slice(0, width);
    }
    function evaluate(state, dish, day) {
      const key = dish.slug || dish.n, recent = state.days.filter(Boolean);
      let score = state.score, reasons = [];
      const last = recent.at(-1), previous = state.days.slice(-7).filter(Boolean);
      const repetitions = recent.filter(d => (d.slug || d.n) === key).length;
      score += repetitions * 12;
      if (previous.some(d => (d.slug || d.n) === key)) score += 35;
      if (last?.base === dish.base) score += options.variety === 'variada' ? 9 : 5;
      if (last?.p === dish.p) score += 2;
      if (!previous.some(d => d.base === dish.base)) {score -= 2; reasons.push('Varía la proteína o base');}
      const stock = Object.fromEntries(Object.entries(state.stock).map(([k, v]) => [k, {...v}]));
      const frequency = options.marketFrequency || '1 vez por semana';
      const purchaseWindow = frequency === 'Todos los días' ? 1 : frequency === 'Cada 2 semanas' ? 14 : frequency === '1 vez al mes' ? 28 : 7;
      for (const [k, s] of Object.entries(stock)) {
        if (s.expires < day || (s.window !== Math.floor(day / purchaseWindow))) {score += s.remaining * 2; delete stock[k];}
      }
      for (const item of needs.get(key)) {
        const rule = packages[core.normalize(item.n)];
        if (!rule || item.q === null || item.u !== rule.unit) continue;
        const k = core.normalize(item.n), existing = stock[k];
        let needed = item.q;
        if (existing?.remaining > 0) {
          const reused = Math.min(needed, existing.remaining);
          needed -= reused; existing.remaining -= reused;
          score -= Math.min(4, reused / rule.size * 6);
          if (reused > 0) reasons.push(`Aprovecha ${item.n.toLowerCase()} de otra receta`);
        }
        if (needed > 1e-8) {
          const remainder = Math.ceil((needed - 1e-9) / rule.size) * rule.size - needed;
          stock[k] = {remaining: remainder, expires: day + rule.freshnessDays,
            window: Math.floor(day / purchaseWindow)};
          score += remainder / rule.size * 1.5;
        }
      }
      const tie = hash((options.seed || start.toDateString()) + ':' + day + ':' + key);
      return {score, tie, stock, days: [...state.days, dish], reasons: [...state.reasons, reasons]};
    }
    const result = beam[0] || {days: [], reasons: [], score: 0};
    return {...result, warnings, assumptions: 'Heurística de búsqueda acotada; tamaños y conservación son configurables, no un óptimo global ni una garantía de conservación.'};
  }
  function recommend(catalog, context = [], options = {}) {
    const date = options.date || new Date(), rejected = new Set(options.rejected || []);
    let pool = catalog.filter(d => available(d,date) && !rejected.has(d.n) && d.n !== options.exclude);
    if(options.quick && pool.some(d=>d.quick))pool=pool.filter(d=>d.quick);
    const baseline = core.aggregate(context,options.people||2,options.portion||'regular');
    const existing = new Map(baseline.map(i=>[core.normalize(i.n),i]));
    const packages={...defaults,...options.packages};
    return pool.map(d=>{
      let score=context.some(x=>x.n===d.n)?30:0;
      score+=context.filter(x=>x.base===d.base).length*3;
      for(const i of core.aggregate([d],options.people||2,options.portion||'regular')){
        const rule=packages[core.normalize(i.n)],old=existing.get(core.normalize(i.n));
        if(!rule||i.q===null||i.u!==rule.unit||!old||old.q===null||old.u!==rule.unit)continue;
        const remaining=Math.ceil((old.q-1e-9)/rule.size)*rule.size-old.q;
        score-=Math.min(i.q,remaining)/rule.size*8;
      }
      return {d,score,tie:hash(date.toDateString()+d.slug)};
    }).sort((a,b)=>a.score-b.score||a.tie-b.tie)[0]?.d||null;
  }
  return {plan, recommend, available, defaultPackages: defaults};
});
