const assert = require('node:assert/strict');
const fs = require('node:fs');
const core = require('../lib/recipe-core.js');
const planner = require('../lib/meal-planner.js');
const cat = JSON.parse(fs.readFileSync('data/catalog.final.json','utf8'));
const review = JSON.parse(fs.readFileSync('research/final-integration-2026-10-07/user-review-final.json','utf8'));
assert.equal(cat.dishes.length,141);
assert.equal(review.reviews.filter(r=>r.verified).length,141);
assert.equal(new Set(cat.dishes.map(d=>d.slug)).size,141);
assert.equal(cat.dishes.filter(d=>d.active).length,137);
const allowed = new Set(['acomer:1193','acomer:761','acomer:1709','acomer:1419','acomer:1778','acomer:628','acomer:845']);
for (const r of review.reviews) {
  const d=cat.dishes.find(d=>d.winnerId===r.winnerId);
  assert.equal(d.portions,2);
  if(d.active)assert.ok(d.steps.length);
  if (r.winnerId.startsWith('acomer:')&&!allowed.has(r.winnerId)) assert.deepEqual(d.steps,r.preliminarySteps,r.title);
}
assert.deepEqual(core.parse('2 1/2 (cucharadas)').q,2.5);
assert.equal(core.parse('½ taza').q,.5);
assert.equal(core.parse('al gusto').q,null);
assert.equal(core.parse('1 a 2 tazas').q,null);
const a={slug:'a',n:'A',active:true,base:'Pollo',p:'guiso',portions:2,ingredients:[{name:'Lechuga',quantity:'1/2 unid'},{name:'Arroz',quantity:'1 taza'},{name:'Aceite',quantity:'1 cda',pantry:true}]};
const b={...a,slug:'b',n:'B',base:'Res'};
const c={...a,slug:'c',n:'C',base:'Cerdo',ingredients:[]};
const shopping=core.aggregate([a,b]);
assert.equal(shopping.find(i=>i.n==='Lechuga').q,1);
assert.equal(shopping.find(i=>i.n==='Arroz').q,.36);
assert.ok(!shopping.some(i=>i.n==='Aceite'));
assert.equal(core.scale(a,1)[0].q,.25); // no rounding per recipe
assert.equal(core.aggregate([{...a,ingredients:[{name:'Ajo',quantity:'1 diente'},{name:'Ajo',quantity:'3 g'}]}]).length,1);
const plan=planner.plan([a,b,c],{days:2,startDate:'2026-10-05T12:00:00',seed:'test'});
assert.deepEqual(new Set(plan.days.map(d=>d.n)),new Set(['A','B']));
assert.ok(plan.reasons[1].some(r=>r.includes('Aprovecha')));
assert.deepEqual(planner.plan([a,b,c],{days:2,startDate:'2026-10-05T12:00:00',seed:'test'}).days,plan.days);
const seasonal=cat.dishes.find(d=>d.winnerId==='acomer:970');
assert.equal(planner.available(seasonal,new Date(2026,11,7)),false);
assert.equal(planner.available(seasonal,new Date(2026,11,8)),true);
assert.equal(planner.available(seasonal,new Date(2027,0,1)),false);
assert.equal(planner.plan([a],{days:2,rejected:['A']}).days.filter(Boolean).length,0);
assert.equal(planner.plan([a,b],{days:7,noCook:[5]}).days[5],null);
const fast={...c,quick:true};
assert.equal(planner.plan([a,fast],{days:1,quickDays:[0]}).days[0].n,'C');
for(let people=1;people<=8;people++){
  const p=planner.plan(cat.dishes,{people,days:28,startDate:'2026-10-05T12:00:00',quickDays:[1,3],noCook:[6],seed:'household-'+people});
  assert.equal(p.days.length,28);
  assert.ok(p.days.filter(Boolean).every(d=>d.active&&planner.available(d,new Date(2026,9,5))));
  const items=core.aggregate(p.days.filter(Boolean),people);
  assert.equal(new Set(items.map(i=>core.normalize(i.n))).size,items.length);
  assert.ok(items.every(i=>i.q===null||Number.isFinite(i.q)&&i.q>=0));
}
console.log('PASS: catalog, 141 preserved reviews, protected A Comer steps, units, pantry, half-lettuce reuse, seasons, exclusions, quick/no-cook days, 8 households.');
