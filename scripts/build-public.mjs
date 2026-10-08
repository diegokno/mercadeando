import fs from "node:fs";
import path from "node:path";
import { spawnSync } from "node:child_process";
import { createHash } from "node:crypto";

const root = process.cwd();
const publicDir = path.join(root, "public");
const appHtml = fs.readFileSync(path.join(root, "app.html"), "utf8");
const data = readData();
const finalPath = path.join(root, 'data', 'catalog.final.json');
const finalCatalog = fs.existsSync(finalPath) ? JSON.parse(fs.readFileSync(finalPath, 'utf8')) : null;
if (finalCatalog?.dishes.some(d => d.active && d.imageStatus === 'reference_pending') && !process.argv.includes('--preview')) {
  throw new Error('Final images are pending. Production build blocked; use --preview only for local verification.');
}

// Keep the existing checkout and files; overwrite owned build outputs only.
fs.mkdirSync(publicDir, {recursive: true});
copyDir(path.join(root, "assets"), path.join(publicDir, "assets"));
fs.mkdirSync(path.join(publicDir, "imagenes-platos", "webp"), { recursive: true });

let optimized = 0;
let originalBytes = 0;
let outputBytes = 0;

const buildDishes = finalCatalog ? finalCatalog.dishes.filter(d => d.active).map(d => ({...d, name:d.n, image_path:d.img})) : data.dishes;
const imagePaths = new Map();
for (const dish of buildDishes) {
  if (/^https?:/.test(dish.image_path)) continue;
  const source = path.join(root, dish.image_path);
  if (!fs.existsSync(source)) throw new Error(`Missing image for ${dish.name}: ${dish.image_path}`);
  const hash = createHash('sha256').update(fs.readFileSync(source)).digest('hex').slice(0,10);
  const imagePath = `imagenes-platos/webp/${dish.slug}.${hash}.webp`;
  imagePaths.set(dish.slug,imagePath);
  const target = path.join(publicDir,imagePath);

  originalBytes += fs.statSync(source).size;
  runFfmpeg(source, target);
  outputBytes += fs.statSync(target).size;
  optimized += 1;
}

const replacements = new Map();
for (const dish of buildDishes) {
  if (/^https?:/.test(dish.image_path)) continue;
  replacements.set(dish.image_path, imagePaths.get(dish.slug));
  if (dish.image_path.startsWith("imagenes-platos/generadas/")) {
    replacements.set(dish.image_path.replace("imagenes-platos/generadas/", ""), imagePaths.get(dish.slug));
  }
}

let html = appHtml;
for (const [from, to] of replacements) {
  html = html.split(from).join(to);
}
html = html.replace("const imgBase='imagenes-platos/generadas/';", "const imgBase='imagenes-platos/webp/';");

fs.writeFileSync(path.join(publicDir, "app.html"), html);
fs.writeFileSync(path.join(publicDir, "index.html"), html);
fs.mkdirSync(path.join(publicDir, "data"), { recursive: true });
if (!finalCatalog) fs.copyFileSync(path.join(root, "data", "dishes.seed.json"), path.join(publicDir, "data", "dishes.seed.json"));
if (finalCatalog) {
  for (const name of ['catalog.final.json', 'ingredients.final.json']) fs.copyFileSync(path.join(root,'data',name),path.join(publicDir,'data',name));
  const optimizedCatalog = structuredClone(finalCatalog);
  optimizedCatalog.dishes = optimizedCatalog.dishes.filter(d=>d.active);
  for (const dish of optimizedCatalog.dishes) {
    if (imagePaths.has(dish.slug)) dish.img=imagePaths.get(dish.slug);
    delete dish.sourceUrl;
    delete dish.provenance;
    delete dish.groupId;
    delete dish.imageDecision;
  }
  fs.writeFileSync(path.join(publicDir,'data','catalog.final.json'),JSON.stringify(optimizedCatalog,null,2)+'\n');
  fs.writeFileSync(path.join(publicDir,'data','dishes.seed.json'),JSON.stringify({version:finalCatalog.version,basePortions:2,dishes:optimizedCatalog.dishes.filter(d=>d.active).map(d=>({slug:d.slug,name:d.n,base:d.base,preparation:d.prep,category:d.cat,preparation_key:d.p,image_path:d.img,recipe_payload:d}))},null,2)+'\n');
  fs.writeFileSync(path.join(publicDir,'data','catalog.final.js'),'globalThis.MercadeandoCatalog = '+JSON.stringify(optimizedCatalog)+';\n');
  copyDir(path.join(root,'lib'),path.join(publicDir,'lib'));
}

console.log(`Optimized ${optimized} dish images`);
console.log(`Dish image payload: ${mb(originalBytes)} MB -> ${mb(outputBytes)} MB`);
console.log("Built public/ for Vercel");

function readData() {
  const dataPath = path.join(root, "data", "dishes.seed.json");
  if (!fs.existsSync(dataPath)) {
    spawnSync(process.execPath, [path.join(root, "scripts", "extract-data.mjs")], { stdio: "inherit" });
  }
  return JSON.parse(fs.readFileSync(dataPath, "utf8"));
}

function runFfmpeg(source, target) {
  const result = spawnSync(
    "ffmpeg",
    [
      "-y",
      "-hide_banner",
      "-loglevel",
      "error",
      "-i",
      source,
      "-vf",
      "scale='min(900,iw)':'min(900,ih)':force_original_aspect_ratio=decrease",
      "-c:v",
      "libwebp",
      "-quality",
      "82",
      "-compression_level",
      "6",
      target
    ],
    { stdio: "pipe" }
  );
  if (result.status !== 0) {
    throw new Error(`ffmpeg failed for ${source}\n${result.stderr.toString()}`);
  }
}

function copyDir(source, target) {
  fs.mkdirSync(target, { recursive: true });
  for (const entry of fs.readdirSync(source, { withFileTypes: true })) {
    const from = path.join(source, entry.name);
    const to = path.join(target, entry.name);
    if (entry.isDirectory()) copyDir(from, to);
    else fs.copyFileSync(from, to);
  }
}

function mb(bytes) {
  return (bytes / 1024 / 1024).toFixed(2);
}
