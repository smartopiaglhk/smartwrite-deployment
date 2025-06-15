import fetch from 'node-fetch';
import fs from 'fs';

const store   = process.env.SHOPIFY_STORE;
const token   = process.env.SHOPIFY_PASSWORD;
const themeId = process.env.SHOPIFY_THEME_ID;

// Read your index section
let indexLiquid = fs.readFileSync('sections/index.liquid', 'utf8');

// Inject hero block just after </header>
indexLiquid = indexLiquid.replace(
  /<\/header>/,
  `</header>
<div class="hero-text">
  <h1>Welcome to GLGRPHK City Hub</h1>
  <p>Explore our AI-powered SmartCity tools.</p>
  <a href="/products/smartwrite" class="btn">Start Free Trial</a>
</div>`
);

// Push it back via Admin API
await fetch(`https://${store}/admin/api/2025-01/themes/${themeId}/assets.json`, {
  method: 'PUT',
  headers: {
    'Content-Type': 'application/json',
    'X-Shopify-Access-Token': token,
  },
  body: JSON.stringify({
    asset: {
      key: 'sections/index.liquid',
      value: indexLiquid,
    },
  }),
});
console.log('🔧 index.liquid patched');
