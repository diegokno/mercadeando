const assert = require('node:assert/strict');
const core = require('../lib/recipe-core');
const catalog = require('../data/catalog.final.json');
assert.equal(catalog.dishes.filter(d=>d.active).length,135);
assert.equal(catalog.dishes.find(d=>d.slug==='matasquita-de-pollo').n,'Picante de pollo (matasquita)');
for(const slug of ['higado-frito-con-arroz','caldo-de-pollo'])assert.equal(catalog.dishes.find(d=>d.slug===slug).active,false);
assert.equal(catalog.dishes.find(d=>d.slug==='pollo-a-la-gaseosa-negra').n,'Pollo a la Coca-Cola');
assert.equal(core.category('Espaguetis'),'Abarrotes');
assert.equal(core.category('Queso fresco'),'Abarrotes');
assert.equal(core.category('Pasta de ají amarillo'),'Abarrotes');
const rice=core.purchase({n:'Arroz',components:[{q:3.813,u:'kg'}]});
assert.equal(rice.q,4);assert.equal(rice.measureText,'4 kg');
const milk=core.purchase({n:'Leche Evaporada',components:[{q:1.25,u:'taza'},{q:469,u:'ml'}]});
assert.equal(milk.measureText,'800 ml');
const garlic=core.purchase({n:'Ajo',components:[{q:2,u:'diente'},{q:15,u:'ml'}]});
assert.equal(garlic.q,null);assert.equal(garlic.measureText,'Por definir');
assert.equal(core.purchase({n:'Perejil',components:[{q:null,u:''}]}).measureText,'Al gusto');
for(const row of core.aggregate(catalog.dishes.filter(d=>d.active)).map(core.purchase)){
  assert.ok(!row.measureText.includes('+'));
  assert.ok(row.q===null || Math.abs(row.q*2-Math.round(row.q*2))<1e-6);
  assert.ok(row.q===null || row.u);
}
console.log('PASS: 135 dishes, canonical merges, purchase rounding, liquid conversion, no invented incompatible-unit totals, categories.');
