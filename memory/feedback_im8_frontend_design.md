---
name: IM8 Frontend Design Rules
description: How to apply the frontend-design skill using IM8 brand — mandatory for all IM8 dashboards and websites
type: feedback
---

When building any IM8 UI (dashboard, website, landing page, component), apply the frontend-design skill with IM8 brand assets. These rules override generic defaults.

**Why:** User explicitly instructed all future dashboard/website implementations to use IM8 brand (logos, fonts, colors). The frontend-design skill provides the aesthetic framework; IM8 brand provides the specific tokens.

**How to apply:** Every time a frontend task is requested for IM8/Prenetics, invoke the frontend-design skill AND enforce the brand rules below.

---

## IM8 Design Direction

**Aesthetic tone:** Luxury/refined — dark, moody, premium. Deep crimson backgrounds with gold accents. NOT purple gradients, NOT generic white-bg SaaS.

**Differentiation:** The one unforgettable thing — the deep red atmosphere with gold shimmer text. It should feel like a premium health intelligence product.

---

## Mandatory Brand Tokens

### Colors (CSS vars from brand-tokens.css)
```css
/* Load from: https://raw.githubusercontent.com/withally/im8-learn/main/brand/brand-tokens.css */
--im8-deep: #2D0A10;       /* primary background */
--im8-dark: #1A0508;       /* darkest surface */
--im8-crimson: #A40011;    /* primary brand / CTA */
--im8-bright: #D4001A;     /* hover & active */
--im8-rose: #FF9693;       /* accent & highlight */
--im8-card: #3D1018;       /* card / elevated surfaces */
--im8-glow: #4A1520;       /* gradient anchor */
--im8-white: #FFFFFF;      /* foreground text */
--im8-gold: #D4A84B;       /* primary gold accent */
--im8-gold-bright: #F5C842;
--im8-gold-warm: #EEB87A;
--im8-gold-soft: #F5D4A8;
--im8-gold-cream: #FFF5E6;
```

### Gradients
```css
/* Background */
background: radial-gradient(ellipse at 50% 0%, #4A1520 0%, #2D0A10 70%);

/* Gold shimmer text */
background: linear-gradient(90deg, #EEB87A, #F5D4A8, #FFF5E6, #F5D4A8, #EEB87A);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;
```

### Typography
```css
/* Load fonts from GitHub raw URLs */
@font-face {
  font-family: 'ABC Arizona Flare';
  src: url('https://raw.githubusercontent.com/withally/im8-learn/main/brand/fonts/ABCArizonaFlare-Regular.woff2') format('woff2');
  font-weight: 400;
}
@font-face {
  font-family: 'ABC Arizona Flare';
  src: url('https://raw.githubusercontent.com/withally/im8-learn/main/brand/fonts/ABCArizonaFlare-Bold.woff2') format('woff2');
  font-weight: 700;
}
@font-face {
  font-family: 'Aeonik';
  src: url('https://raw.githubusercontent.com/withally/im8-learn/main/brand/fonts/Aeonik-Regular.woff2') format('woff2');
  font-weight: 400;
}
@font-face {
  font-family: 'Aeonik';
  src: url('https://raw.githubusercontent.com/withally/im8-learn/main/brand/fonts/Aeonik-Medium.woff2') format('woff2');
  font-weight: 500;
}

/* Usage */
font-family: 'ABC Arizona Flare', Georgia, serif;   /* headings */
font-family: 'Aeonik', -apple-system, Helvetica, sans-serif;  /* body/UI */
```

### Logos (SVG, use correct variant)
```
Dark bg (default): https://raw.githubusercontent.com/withally/im8-learn/main/brand/logos/im8-logo-crimson.svg
Light bg:          https://raw.githubusercontent.com/withally/im8-learn/main/brand/logos/im8-logo-dark.svg
Color/photo bg:    https://raw.githubusercontent.com/withally/im8-learn/main/brand/logos/im8-logo-white.svg
```

---

## Frontend-Design Skill Rules (applied to IM8)

- **Typography**: Always ABC Arizona Flare (headings) + Aeonik (body). Never Inter, Roboto, Arial.
- **Color**: Deep crimson palette. Gold shimmer for hero text. Never purple gradients.
- **Motion**: Page load with staggered gold shimmer reveals. Hover states on cards with subtle glow. CSS-only preferred; Motion library for React.
- **Composition**: Asymmetric layouts, generous negative space, diagonal accents. Cards on `--im8-card` (#3D1018) with subtle border.
- **Backgrounds**: Always `radial-gradient(ellipse at 50% 0%, #4A1520 0%, #2D0A10 70%)` — never solid black or plain dark.
- **Details**: Grain overlays for texture, gold borders on key elements, glow effects using `--im8-glow`.

---

## Never Do
- Generic white/grey backgrounds
- Purple gradients
- Inter or system fonts
- Plain solid black backgrounds
- Generic card styles without IM8 crimson palette
- Logos in wrong variant (e.g. dark logo on dark bg)
