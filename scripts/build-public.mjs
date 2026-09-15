import fs from "node:fs";
import path from "node:path";
import { spawnSync } from "node:child_process";

const root = process.cwd();
const publicDir = path.join(root, "public");
const appHtml = fs.readFileSync(path.join(root, "app.html"), "utf8");
const data = readData();

emptyDir(publicDir);
copyDir(path.join(root, "assets"), path.join(publicDir, "assets"));
fs.mkdirSync(path.join(publicDir, "imagenes-platos", "webp"), { recursive: true });

let optimized = 0;
let originalBytes = 0;
let outputBytes = 0;

for (const dish of data.dishes) {
  const source = path.join(root, dish.image_path);
  const target = path.join(publicDir, "imagenes-platos", "webp", `${dish.slug}.webp`);
  if (!fs.existsSync(source)) throw new Error(`Missing image for ${dish.name}: ${dish.image_path}`);

  originalBytes += fs.statSync(source).size;
  runFfmpeg(source, target);
  outputBytes += fs.statSync(target).size;
  optimized += 1;
}

const replacements = new Map();
for (const dish of data.dishes) {
  replacements.set(dish.image_path, `imagenes-platos/webp/${dish.slug}.webp`);
  if (dish.image_path.startsWith("imagenes-platos/generadas/")) {
    replacements.set(dish.image_path.replace("imagenes-platos/generadas/", ""), `imagenes-platos/webp/${dish.slug}.webp`);
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
fs.copyFileSync(path.join(root, "data", "dishes.seed.json"), path.join(publicDir, "data", "dishes.seed.json"));

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

function emptyDir(dir) {
  fs.rmSync(dir, { recursive: true, force: true });
  fs.mkdirSync(dir, { recursive: true });
}

function mb(bytes) {
  return (bytes / 1024 / 1024).toFixed(2);
}
