"""Inspect image margins and installation icons without modifying image files."""
import json
from pathlib import Path
from xml.etree import ElementTree
from PIL import Image

root = Path(__file__).resolve().parents[1]
catalog = json.loads((root / 'public/data/catalog.final.json').read_text(encoding='utf-8'))
transparent = []
for dish in catalog['dishes']:
    with Image.open(root / 'public' / dish['img']) as im:
        im.verify()
    with Image.open(root / 'public' / dish['img']) as im:
        if im.mode == 'RGBA' and im.getchannel('A').getextrema()[0] < 255:
            transparent.append(dish['slug'])
assert transparent == ['causa-rellena-de-pollo'], transparent
html = (root / 'app.html').read_text(encoding='utf-8')
assert '.dish-card[data-dish="causa-rellena-de-pollo"] .dish-photo img{transform:scale(1.25)}' in html
assert next(d for d in catalog['dishes'] if d['slug'] == 'matasquita-de-pollo')['n'] == 'Picante de pollo (matasquita)'
manifest = json.loads((root / 'public/manifest.webmanifest').read_text(encoding='utf-8'))
for icon in manifest['icons']:
    assert (root / 'public' / icon['src']).is_file()
for filename, size in [('apple-touch-icon-color.png', 180), ('desktop-icon-512.png', 512)]:
    with Image.open(root / 'assets' / filename) as im:
        assert im.size == (size, size)
svg = ElementTree.parse(root / 'assets/desktop-mark.svg')
assert [s.attrib['stop-color'] for s in svg.findall('.//{http://www.w3.org/2000/svg}stop')] == ['#2E7D32', '#F5A623']
print(f'PASS: {len(catalog["dishes"])} valid images, only causa margin correction, supplied icon gradient, install assets, final name.')
