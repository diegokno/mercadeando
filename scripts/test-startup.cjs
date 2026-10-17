const assert=require('node:assert/strict');
const fs=require('node:fs');
const vm=require('node:vm');
const html=fs.readFileSync('app.html','utf8');
assert.ok(html.includes('src="assets/vendor/supabase.js"'));
assert.ok(!html.includes('src="https://cdn.jsdelivr.net'));
assert.ok(html.includes('const startupHasPlan=!hasDebug&&restoreLocalPlan();\nrender();'));
assert.ok(html.includes('height:48px;aspect-ratio:1'));
assert.ok(html.includes("matchMedia('(prefers-reduced-motion: reduce)')"));
const definitions=['async function currentUser','async function restoreSession','function withDeadline'].map(prefix=>html.split('\n').find(l=>l.startsWith(prefix))).join('\n');
async function exercise(interrupted){
  let apply=true,builds=0,queries=0;
  const state={people:2,userId:'original'};
  const sandbox={state,setTimeout,clearTimeout,AbortSignal,console,
    canApply:()=>apply,buildWeek:()=>builds++,
    sbClient:{auth:{getSession:async()=>({data:{session:{user:{id:'verified-owner'}}}})},
      from:table=>{const chain={select:()=>chain,eq:()=>chain,maybeSingle:()=>chain,abortSignal:async()=>{queries++;if(interrupted)apply=false;return {data:table==='user_preferences'?{onboarding_completed:true,people:8}:[],error:null}}};return chain;}}
  };
  vm.createContext(sandbox);vm.runInContext(definitions,sandbox);
  const result=await vm.runInContext('restoreSession(canApply)',sandbox);
  if(interrupted){assert.equal(result,false);assert.equal(state.people,2);assert.equal(state.userId,'original');assert.equal(builds,0);}
  else{assert.equal(result,true);assert.equal(state.people,8);assert.equal(state.userId,'verified-owner');assert.equal(builds,1);}
  assert.equal(queries,2);
  await assert.rejects(vm.runInContext('withDeadline(new Promise(()=>{}),5)',sandbox),/timeout/);
}
(async()=>{await exercise(true);await exercise(false);console.log('PASS: local SDK, non-blocking render, square undo, reduced motion, bounded session and no late overwrite after interaction.');})().catch(e=>{console.error(e);process.exitCode=1});
