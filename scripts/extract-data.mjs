import fs from "node:fs";
import path from "node:path";

const html = fs.readFileSync("app.html", "utf8");

function readConst(name, nextMarker) {
  const pattern = new RegExp(`const ${name}=([\\s\\S]*?)\\n${nextMarker}`);
  const match = html.match(pattern);
  if (!match) throw new Error(`Could not find const ${name}`);
  const opener = match[1].trimStart()[0];
  const closer = opener === "[" ? "]" : "}";
  return new Function(`return (${match[1]}\n${closer});`)();
}

const dishes = readConst("dishes", "\\];").concat([]);
const recipes = readConst("dishRecipes", "\\};");
const steps = readConst("dishSteps", "\\};\\nfunction recipeSteps");

const records = dishes.map((dish) => ({
  slug: slugify(dish.n),
  name: dish.n,
  base: dish.base,
  preparation: dish.prep,
  category: dish.cat,
  preparation_key: dish.p,
  image_path: resolveImagePath(dish.img),
  ingredients: (recipes[dish.n] || []).map(([name, unit, quantity], index) => ({
    name,
    unit,
    quantity,
    sort_order: index + 1
  })),
  recipe_steps: (steps[dish.n] || []).map((body, index) => ({
    step_number: index + 1,
    body
  }))
}));

const missing = records.filter((dish) => !dish.ingredients.length || !dish.recipe_steps.length);
if (missing.length) {
  throw new Error(`Missing recipe data for: ${missing.map((dish) => dish.name).join(", ")}`);
}

fs.mkdirSync("data", { recursive: true });
fs.writeFileSync(
  path.join("data", "dishes.seed.json"),
  `${JSON.stringify({ generated_at: new Date().toISOString(), dishes: records }, null, 2)}\n`
);

console.log(`Extracted ${records.length} dishes to data/dishes.seed.json`);

function resolveImagePath(image) {
  if (/^(imagenes-platos|assets|https?:)/.test(image)) return image.replaceAll("\\", "/");
  return `imagenes-platos/generadas/${image}`.replaceAll("\\", "/");
}

function slugify(value) {
  return value
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-|-$/g, "");
}
