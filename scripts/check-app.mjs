import fs from "node:fs";

const html = fs.readFileSync("app.html", "utf8");
const scripts = [...html.matchAll(/<script[^>]*>([\s\S]*?)<\/script>/gi)]
  .map((match) => match[1])
  .join("\n");

new Function(scripts);

const forbidden = [/service_role/i, /SUPABASE_SERVICE/i, /password\s*=/i];
const hits = forbidden.filter((pattern) => pattern.test(html));
if (hits.length) {
  throw new Error(`Possible sensitive token pattern found: ${hits.map(String).join(", ")}`);
}

console.log("app.html syntax and sensitive-pattern check OK");
