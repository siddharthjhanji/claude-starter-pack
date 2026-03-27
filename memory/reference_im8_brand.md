---
name: IM8 Brand Assets Reference
description: Colors, fonts, logos, and CSS tokens for IM8 brand — must be used for all dashboards and website implementations
type: reference
---

Brand repo: https://github.com/withally/im8-learn/tree/main/brand

## Drop-in CSS & Tokens
- CSS: https://raw.githubusercontent.com/withally/im8-learn/main/brand/brand-tokens.css
- JSON: https://raw.githubusercontent.com/withally/im8-learn/main/brand/brand-tokens.json
- Preview: https://raw.githubusercontent.com/withally/im8-learn/main/brand/preview.html

## Color Palette (CSS vars: --im8-{token})
| Token | Hex | Purpose |
|-------|-----|---------|
| deep | #2D0A10 | Primary background |
| dark | #1A0508 | Darkest surface |
| crimson | #A40011 | Primary brand / CTA |
| bright | #D4001A | Hover & active states |
| rose | #FF9693 | Accent & highlight |
| card | #3D1018 | Card / elevated surfaces |
| glow | #4A1520 | Gradient anchor |
| white | #FFFFFF | Foreground text |
| gold | #D4A84B | Primary gold accent |
| gold-bright | #F5C842 | Bright gold highlights |
| gold-warm | #EEB87A | Gold gradient start |
| gold-soft | #F5D4A8 | Gold gradient middle |
| gold-cream | #FFF5E6 | Gold gradient end |

## Gradients
- Background: `radial-gradient(ellipse at 50% 0%, #4A1520 0%, #2D0A10 70%)`
- Gold shimmer: `linear-gradient(90deg, #EEB87A, #F5D4A8, #FFF5E6, #F5D4A8, #EEB87A)`

## Typography
- **Headings:** ABC Arizona Flare (serif) — weights 300/400/500/700
- **Body/UI:** Aeonik (sans-serif) — weights 400/500/700
- Fallback: `-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial`

## Font Files (WOFF2)
Base URL: https://raw.githubusercontent.com/withally/im8-learn/main/brand/fonts/
- ABCArizonaFlare-Light.woff2 (300)
- ABCArizonaFlare-Regular.woff2 (400)
- ABCArizonaFlare-Medium.woff2 (500)
- ABCArizonaFlare-Bold.woff2 (700)
- Aeonik-Regular.woff2 (400)
- Aeonik-Medium.woff2 (500)
- Aeonik-Bold.woff2 (700)

## Logos (SVG)
Base URL: https://raw.githubusercontent.com/withally/im8-learn/main/brand/logos/
- im8-logo-crimson.svg — dark backgrounds (default)
- im8-logo-white.svg — photos / color backgrounds
- im8-logo-dark.svg — light backgrounds
