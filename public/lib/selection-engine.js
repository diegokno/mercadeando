(function(root,factory){const api=factory();if(typeof module==='object'&&module.exports)module.exports=api;else root.SelectionEngine=api;})(typeof globalThis!=='undefined'?globalThis:this,function(){
  'use strict';
  const id=d=>d.slug||d.n;
  function random(){if(globalThis.crypto?.getRandomValues){const a=new Uint32Array(1);globalThis.crypto.getRandomValues(a);return a[0]/4294967296;}return Math.random();}
  function shuffle(items,rng=random){const result=[...items];for(let i=result.length-1;i>0;i--){const j=Math.floor(rng()*(i+1));[result[i],result[j]]=[result[j],result[i]];}return result;}
  function createReplacements(rng=random){
    const sessions=new Map();
    function next(key,ranked,current){
      const pool=ranked.filter(d=>id(d)!==id(current));
      if(!pool.length)return null;
      let session=sessions.get(key);
      if(!session||session.last!==id(current)){session={seen:new Set([id(current)]),count:0,last:id(current)};sessions.set(key,session);}
      let fresh=pool.filter(d=>!session.seen.has(id(d)));
      if(!fresh.length){session.seen=new Set([id(current)]);fresh=pool;}
      const chosen=session.count<2?fresh[0]:shuffle(fresh,rng)[0];
      session.seen.add(id(chosen));session.count++;session.last=id(chosen);
      return chosen;
    }
    return {next,clear:()=>sessions.clear()};
  }
  return {shuffle,createReplacements};
});
