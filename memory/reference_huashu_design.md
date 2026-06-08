---
name: huashu-design
description: "花叔Design (alchaincyf/huashu-design) — comprehensive HTML-as-design-medium skill for hi-fi clickable prototypes, presentation decks (with PPTX export), animations (MP4/GIF), infographics, and voiceover videos. 40 native HTML style library + 3-perspective design consultant + 5-dimension review. MIT licensed. Bilingual (Chinese primary, English supported). IM8 brand still overrides."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# Huashu Design (花叔Design)

Repo: https://github.com/alchaincyf/huashu-design
Skill name: `huashu-design`
Author: 花叔 (Hua Shu)
Installed: 2026-06-08, MIT licensed (changed from "personal free, commercial license required" → fully MIT on 2026-05-14)
Vendored size: 5.2MB (5 large BGM .mp3 files excluded to save 25MB; SFX library and essential refs/scripts/demos kept)

## What it does (genuinely different from other design skills)

A comprehensive "HTML as the design medium" skill — not just CSS styling. Produces deliverables that:
- **Hi-fi clickable prototypes** (iOS/web app mockups users can actually click through, 4+ core screens)
- **Presentation decks** (1920×1080 HTML, exportable to PPTX via pptxgenjs, PDF via pdf-lib)
- **Animations** (60fps motion design, exportable to MP4/GIF via Playwright video recording)
- **Voiceover-narrated long videos** (TTS via Doubao + BGM mix pipeline)
- **Infographics / data viz** (print-quality typography)
- **Tweaks system** (live parameter sliders in HTML for design variant exploration)

## Three differentiated mechanisms

1. **40 native HTML style library** (20 web + 20 PPT) as fallback to defeat AI slop when user hasn't given brand assets
2. **3-perspective design consultant**: When requirements are ambiguous, produces 3 real visual variants in parallel from different logical angles, lets user pick
3. **5-dimension review system**: Critique any design across 5 axes

## Embodied expert per task type

The skill instructs Claude to "embody" the right expert based on task:
- Animation → animator
- UX prototype → UX designer
- Slide deck → slide designer
- Hi-fi mockup → product prototyper

NOT a generic "make it pretty" skill.

## Tech stack the skill depends on

| Package | Purpose |
|---|---|
| `playwright` | Video recording, headless screenshot, PDF export |
| `pptxgenjs` | HTML → editable PPTX export |
| `pdf-lib` | PDF generation |
| `sharp` | Image processing |
| TTS via Doubao | Voiceover generation |

These get installed on-demand via npx when the skill runs the relevant scripts. Not pre-installed globally.

## Triggers (bilingual)

**Chinese:** 做原型 · 交互原型 · HTML演示 · 动画Demo · 设计变体 · hi-fi设计 · UI mockup · 做个HTML页面 · 做个可视化 · app原型 · iOS原型 · 导出MP4/GIF · 60fps视频 · 设计风格 · 设计方向 · 配色方案 · 推荐风格 · 选个风格 · 做个好看的 · 评审 · 好不好看 · 带解说的动画 · 解说视频 · 长视频科普 · voiceover · narration · 5分钟讲清楚什么是XX

**English:** prototype · review this design · UI mockup · iOS prototype · export MP4/GIF · voiceover

## Reference files (368K of design knowledge)

Loaded selectively per task type — none are loaded by default. Key ones:

- `references/design-styles.md` (40-style library)
- `references/critique-guide.md` (5-dimension review)
- `references/workflow.md` (overall flow)
- `references/animations.md` + `animation-best-practices.md` + `animation-pitfalls.md`
- `references/slide-decks.md` (PPT design)
- `references/voiceover-pipeline.md` + `audio-design-rules.md`
- `references/video-export.md` (MP4/GIF export)
- `references/tweaks-system.md` (variant exploration)
- `references/brand-asset-protocol.md` (how to absorb user's brand)
- `references/scene-templates.md`
- `references/hero-animation-case-study.md`
- `references/launch-film-director-notes.md` (longer cinematic projects)
- `references/multi-perspective-parallel-case-study.md`

## ⚠️ IM8 brand override

Same rule as for [[frontend-design]], [[impeccable]], and [[reference_ui_ux_pro_max]]:

**For any IM8 work, IM8 brand wins regardless of huashu-design's defaults.** Use:
- Fonts: ABC Arizona Flare (headings), Aeonik (body)
- Colors: deep crimson (#2D0A10, #A40011), gold (#D4A84B)
- Never Inter, never purple, never bright white

The skill's 40-style library is the fallback for non-IM8 work (personal projects, vendor pitches, etc.).

## Relationship to existing design skills

| Skill | Best for |
|---|---|
| [[frontend-design]] (Anthropic) | Generic bold aesthetic direction |
| [[impeccable]] (pbakaus) | Frontend with deterministic anti-pattern rules + 23 subcommands |
| [[refactoring-ui]] (Wondel) | Tailwind / visual hierarchy fixes on existing UI |
| [[web-design-guidelines]] (Vercel) | Accessibility audit only |
| [[reference_ui_ux_pro_max]] | 67 styles + 161 industry patterns library |
| **`huashu-design`** | **Clickable prototypes, PPT export, animation→MP4, voiceover videos** |
| [[remotion-best-practices]] | React-based programmatic video (alternative to huashu's playwright pipeline) |
| **IM8 brand** | Always wins for IM8 work |

## What got excluded from the install

5 large `bgm-*.mp3` files (25MB total) — background music samples for voiceover videos. Easy to re-pull from the repo if needed:
- `bgm-tutorial.mp3`, `bgm-tutorial-alt.mp3`
- `bgm-educational.mp3`, `bgm-educational-alt.mp3`
- `bgm-tech.mp3`, `bgm-ad.mp3`

The SFX library (`assets/sfx/`, 564K) was kept — needed for animation sound effects.

## When to use this vs Remotion

| | huashu-design | remotion-best-practices |
|---|---|---|
| Medium | HTML + Playwright recording | React + Remotion compositions |
| Best for | Quick one-shot videos, prototype videos, deck-to-video | Long-running programmatic video pipelines |
| PPTX export | Yes, built-in (pptxgenjs) | No |
| Clickable prototype | Yes | No |
| Learning curve | Lower (HTML/CSS) | Higher (Remotion-specific API) |
