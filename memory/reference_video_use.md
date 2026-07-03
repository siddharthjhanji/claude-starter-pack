---
name: video-use
description: "browser-use/video-use v0.1 — conversation-driven video editor for Claude Code. Reads raw footage via ElevenLabs Scribe transcripts + on-demand visual frames, cuts filler words + dead space, auto color-grades, burns subtitles, generates animation overlays (Manim / Remotion / HyperFrames / PIL) in parallel sub-agents, self-evaluates cuts. MIT. Vendored 2026-06-30. Complements Remotion + huashu-design + youtube-clipper in the video toolchain."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# video-use (browser-use)

Repo: https://github.com/browser-use/video-use
License: MIT · Copyright 2026 Browser Use
Vendored: 2026-06-30 — `~/.claude/skills/video-use/` + `~/.claude/skills/manim-video/` (as separate discoverable skill)

## What it does

Drop raw footage in a folder, chat with Claude Code, get `edit/final.mp4` back. Works for any raw-footage editing task:
- Talking heads, podcasts, interviews, tutorials
- Montages, travel edits, launch films
- Any content where the workflow is "raw takes → cut → subtitles → colour → animation overlays → export"

The LLM never watches the video — it **reads** it. Two layers:
1. **ElevenLabs Scribe transcript** (word-level timestamps, speaker diarization, audio events like `(laughter)` `(applause)` `(sigh)`) — packed into ~12KB `takes_packed.md` as the primary reading view
2. **On-demand visual frames** — pulled only at decision points (cut boundaries, colour reference frames)

## Where it fits in the video toolchain (relative to existing skills)

| Skill | Best for |
|---|---|
| **`video-use`** (this) | **Editing RAW footage** — cuts, colour grade, subtitles, animation overlays, filler removal. Live-action + real cameras. |
| [[remotion-best-practices]] | **Programmatic React video** — generating ads / motion graphics / bar charts from scratch (no raw footage) |
| [[reference_huashu_design]] (`huashu-design`) | **HTML-as-design-medium** → animation/PPTX/video export via Playwright screencap. Best for slide-deck-to-video conversions. |
| [[reference_youtube_clipper]] (`youtube-clipper-skill`) | **Downloading + clipping + burning bilingual subs** on YouTube videos (single existing video → short) |
| [[manim-video]] (bundled with video-use) | **Math/technical animations** (3Blue1Brown style, algorithm walkthroughs, equation derivations) |

**Decision matrix:**
- Have raw footage? → **video-use**
- Building a data viz or motion-graphics video from scratch? → **remotion-best-practices**
- Have HTML/slide decks you want to make into a video? → **huashu-design**
- Have a YouTube URL + want to clip a section with subs? → **youtube-clipper-skill**
- Want a technical/math explainer animation? → **manim-video**

## Direct relevance to project_im8_reels_engine

The reels engine already uses Remotion for programmatic generation. `video-use` covers the **complementary** case: when Sid records raw talking-head or B-roll footage himself, video-use handles the editing pipeline. Together:
- Recorded footage (iPhone, Rode mic, etc.) → **video-use** → clean, subtitled, colour-graded MP4
- Templated motion graphics + text-based reels → **remotion-best-practices** (via the reels engine)
- Product/screen recordings → could go either way; try both

## Runtime dependencies (NOT auto-installed)

| Dep | Status on this machine (2026-06-30) | How to install |
|---|---|---|
| **ffmpeg** | ❌ MISSING | `brew install ffmpeg` (or `brew install ffmpeg-full` if you want the extras from youtube-clipper — check the youtube-clipper memory note) |
| **yt-dlp** | ❌ missing (optional — only needed if downloading online sources) | `brew install yt-dlp` |
| **uv** | ✅ present | — |
| **python3** | ✅ present | — |
| **manim** (for the manim-video sub-skill) | ❌ probably missing | `uv add manim` inside the video-use folder, or `pip install manim` — plus system LaTeX |
| **ElevenLabs API key** | ❌ not set | Grab from https://elevenlabs.io/app/settings/api-keys — free tier includes some Scribe minutes; heavier use is paid |

**When you first invoke `video-use`**, it will ask you to install ffmpeg + paste an ElevenLabs API key. The skill's `install.md` walks through the whole setup.

## What "read the video" actually looks like

The skill produces a rich text representation the LLM can reason over:
- Word-level timestamps (Scribe)
- Speaker labels
- Filler-word tagging (`umm`, `uh`, false starts)
- Silence-gap cut candidates
- Audio events

Cut candidates come from **speech boundaries and silence gaps**, not from watching the video. Only at decision points (should this cut be here? does this segment need colour grading?) does it fetch a visual frame.

## Skills bundled

The upstream repo has 2 SKILL.md files:
- **`video-use/SKILL.md`** — the main editing skill (322 lines)
- **`video-use/skills/manim-video/SKILL.md`** — Manim animation sub-skill (264 lines)

Both vendored as separate top-level skills so Claude Code discovers each independently:
- `~/.claude/skills/video-use/` — full repo including helpers/, install.md, pyproject.toml
- `~/.claude/skills/manim-video/` — extracted so it's a peer skill (triggerable directly)

## Helper scripts in `video-use/helpers/`

| Script | What it does |
|---|---|
| `transcribe.py` | Single-file ElevenLabs Scribe transcription |
| `transcribe_batch.py` | Batch transcription of multiple takes |
| `pack_transcripts.py` | Combine multi-take transcripts into single `takes_packed.md` |
| `grade.py` | Colour grade a segment (warm cinematic / neutral punch / custom ffmpeg chain) |
| `render.py` | Final render orchestrator |
| `timeline_view.py` | Debug — renders a composite timeline (filmstrip + waveform + word labels + cut candidates) |

## Hard rules baked into the skill (from SKILL.md)

- LLM reasons from raw transcript + on-demand visuals; only the packed transcript is a durable derived artifact
- Audio is primary; visuals follow
- **Ask → confirm → execute → iterate → persist** — never touch the cut before user confirms in plain English
- Don't assume video type — look at material, ask user, then edit
- Artistic freedom for everything not in Hard Rules
- Persists session memory in `project.md` in the video's parent folder

## When to use vs alternatives

Use video-use when:
- You've recorded talking-head or B-roll footage yourself
- You want conversational editing ("cut the umms, add subtitles, warm colour grade") vs learning a DAW
- You'll iterate — the skill persists project.md so next week's session picks up where you left off

Don't use video-use when:
- You want a fully programmatic React video → use [[remotion-best-practices]]
- You just want to clip an existing YouTube video → [[reference_youtube_clipper]]
- The deliverable is HTML/PPTX/deck-style, not talking-head → [[reference_huashu_design]]
- You don't want to pay for ElevenLabs Scribe transcription (free tier is generous but not unlimited)

## IM8 relevance

For IM8 marketing team creating product testimonial videos, launch videos, David Beckham segments, etc., video-use handles the editing side while Remotion handles the templated motion graphics. Same pattern applies to your personal reels engine.
