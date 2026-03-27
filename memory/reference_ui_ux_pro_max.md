---
name: UI/UX Pro Max Skill
description: Comprehensive UI/UX design intelligence — 67 styles, 161 industry patterns, 57 typography pairings, 99 UX guidelines, accessible component rules. Apply for all UI work EXCEPT IM8 (which overrides with its own brand).
type: reference
---

Repo: https://github.com/nextlevelbuilder/ui-ux-pro-max-skill
Sub-skills: `ui-ux-pro-max`, `design`, `ui-styling`, `brand`, `design-system`, `banner-design`, `slides`

---

## When to Apply

- Designing new pages, refactoring UI components, selecting colors/typography/layout
- Reviewing code for UX, accessibility, visual consistency
- Implementing navigation, animations, responsive behavior
- **IM8 exception**: always override with IM8 brand tokens (crimson/gold palette, ABC Arizona Flare + Aeonik fonts) — do NOT use generic recommendations from this skill for IM8 work

---

## Priority Rule Categories (1–10)

1. **Accessibility** (CRITICAL) — contrast 4.5:1 minimum, keyboard nav, ARIA labels, semantic HTML
2. **Touch & Interaction** (CRITICAL) — 44×44px min tap targets, 8px spacing between targets, feedback within 80–150ms
3. **Performance** (HIGH) — lazy load images, code splitting, font-display swap, no layout shift
4. **Style Selection** (HIGH) — match product type to style, maintain consistency
5. **Layout & Responsive** (HIGH) — mobile-first, test at 320/375/414/768/1024/1440px, no horizontal scroll
6. **Typography & Color** (MEDIUM) — 16px base, 1.5–1.75 line-height, 65–75 char line limit, semantic tokens
7. **Animation** (MEDIUM) — 150–300ms duration, meaningful motion, respect `prefers-reduced-motion`
8. **Forms & Feedback** (MEDIUM) — visible labels, error near field, blur validation, autofill support
9. **Navigation** (HIGH) — predictable back behavior, deep linking, bottom nav ≤5 items, breadcrumbs
10. **Charts & Data** (LOW) — match chart type to data, accessible colors, tooltips

---

## 67 UI Styles (Key Categories)

**Premium/Luxury:** Glassmorphism, Neomorphism, Dark OLED, Cinema Mobile
**Professional/Trust:** Swiss Modernism 2.0, Minimalism, Corporate Flat, High-contrast
**Creative/Energy:** Brutalism, Vibrant & Block-based, Motion-driven, Glitch/Cyberpunk
**Modern/Tech:** AI-Native UI, Voice-First Multimodal, Spatial UI (VisionOS)
**Data/Analytics:** Dark OLED with real-time animations, high-contrast alert systems
**Accessible:** Accessible & Ethical (WCAG AAA, 7:1+ contrast), Inclusive Design
**Mobile-specific:** Bauhaus Mobile, Minimalist Monochrome, Cinema Mobile

**Anti-pattern across all:** AI purple/pink gradients in professional contexts, excessive animation, color-only indicators

---

## Industry Pattern Rules (161 categories)

**High-trust (Finance, Healthcare, Legal):** Minimalism + trust blues/gold + smooth state transitions
**Creative (Agency, Portfolio, Gaming):** Motion-driven + brutalism + bold primaries + parallax
**Social/Engagement:** Vibrant block-based + scroll animations + card reveals
**Data/Dashboard:** Dark OLED + real-time animations + high-contrast alerts
**Health/Wellness (IM8 context):** Premium dark, science-forward, trust + luxury balance

---

## UX Checklist (99 rules, key ones)

- No emoji icons — use SVG icon libraries instead
- Touch targets 44×44px minimum, 8px gap between
- 4.5:1 contrast ratio for all text
- Mobile-first, test across 6 breakpoints
- Respect safe areas and system gestures on mobile
- Support `prefers-reduced-motion` and dynamic text sizing
- Maintain 8dp/8px spacing rhythm
- Test light AND dark modes
- Lazy load below-fold images
- No hardcoded hex — always use CSS custom properties/tokens
- Form errors placed near the field, shown on blur
- Skip links for keyboard users
- `font-display: swap` for web fonts

---

## Typography System

57 Google Font pairings available. General rules:
- 16px base body size minimum
- 1.5–1.75 line-height for body
- Modular type scale (1.25× or 1.333×)
- Max 65–75 characters per line
- For IM8: ABC Arizona Flare (headings) + Aeonik (body) — ignore Google Fonts

---

## Component Stack (ui-styling skill)

Primary: **shadcn/ui + Tailwind CSS + Radix UI primitives**
- Setup: `npx shadcn@latest init` then add components
- Zero runtime overhead (build-time Tailwind)
- Accessible by default via Radix primitives
- CSS variables for theming/dark mode

---

## Design Token Architecture (design-system skill)

Three layers:
1. **Primitive** — raw values (`--color-red-600: #A40011`)
2. **Semantic** — purpose aliases (`--color-brand-primary: var(--color-red-600)`)
3. **Component** — component-specific (`--button-bg: var(--color-brand-primary)`)

Rule: import `design-tokens.css` as single source of truth. Never hardcode hex in components.

---

## Sub-skill Cheatsheet

| Skill | Use For |
|-------|---------|
| `ui-ux-pro-max` | Full design system generation, style/color/font selection |
| `design` | Brand identity, logos (55 styles), CIP, icon design (SVG) |
| `ui-styling` | shadcn/ui components, Tailwind setup, accessible UI |
| `brand` | Voice/tone, brand governance, asset compliance |
| `design-system` | Token architecture, component specs, slide decks |
| `banner-design` | Social/ad/web banners (22 art direction styles) |
| `slides` | HTML presentation decks with Chart.js |
