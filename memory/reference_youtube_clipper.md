---
name: YouTube Clipper Skill
description: AI-powered YouTube video processing skill for Claude Code — downloads videos, generates semantic chapters via AI, clips segments, batch-translates subtitles to bilingual EN/ZH, burns subtitles into video, generates social media summaries.
type: reference
---

Repo: https://github.com/op7418/Youtube-clipper-skill
Install: `npx skills add https://github.com/op7418/Youtube-clipper-skill` → installs to `~/.claude/skills/youtube-clipper/`
License: MIT | Author: op7418

---

## What It Does

Takes a YouTube URL and produces clipped video segments with bilingual subtitles and social media summaries. Core differentiator: **AI semantic chapter analysis** (2–5 min granularity) vs mechanical time splitting.

---

## Requirements

| Tool | Purpose | Install |
|------|---------|---------|
| Python 3.8+ | Script execution | — |
| yt-dlp | YouTube download | `brew install yt-dlp` |
| **ffmpeg-full** (not standard ffmpeg) | Video + subtitle burning (libass required) | `brew install ffmpeg-full` |
| pysrt, python-dotenv | Python packages | auto-installed |

**Critical macOS gotcha:** Standard `brew install ffmpeg` does NOT include libass. Must use `ffmpeg-full`.
- ffmpeg-full path (Apple Silicon): `/opt/homebrew/opt/ffmpeg-full/bin/ffmpeg`
- Verify libass: `ffmpeg -filters 2>&1 | grep subtitles`

---

## 6-Phase Workflow

### Phase 1 — Environment Detection
Checks: yt-dlp, ffmpeg (libass), Python packages (pysrt). Fails fast with install instructions if missing.

### Phase 2 — Video Download
```bash
python3 scripts/download_video.py <youtube_url>
```
- Downloads up to 1080p mp4
- Downloads English VTT subtitles (falls back to auto-generated)
- Output files named by video ID (avoids special character issues): `<id>.mp4`, `<id>.en.vtt`

### Phase 3 — AI Chapter Analysis (core differentiator)
```bash
python3 scripts/analyze_subtitles.py <subtitle_path>
```
- Parses VTT → structured subtitle data with timestamps
- Claude reads full transcript and identifies **semantic topic transitions** (not mechanical time splits)
- Generates chapters at **2–5 minute granularity** with:
  - Title (10–20 chars)
  - Time range (MM:SS or HH:MM:SS)
  - Core summary (50–100 chars)
  - Keywords (3–5)
- Displays chapter list with coverage confirmation

### Phase 4 — User Selection
Uses `AskUserQuestion` tool. User selects:
- Which chapters to clip (multi-select by number)
- Generate bilingual subtitles? (EN + ZH)
- Burn subtitles into video? (hardcoded)
- Generate social media summary?

### Phase 5 — Processing (per selected chapter)
All steps executed for each chapter:

| Step | Script | Output |
|------|--------|--------|
| Clip video | `clip_video.py <video> <start> <end> <out>` | `<title>_clip.mp4` |
| Extract subtitle segment | (inline) — adjusts timestamps to 00:00:00 base | `<title>_original.srt` |
| Translate subtitles | `translate_subtitles.py <subtitle>` | `<title>_translated.srt` |
| Merge bilingual | (inline) — EN on top, ZH below | `<title>_bilingual.srt` |
| Burn subtitles | `burn_subtitles.py <video> <srt> <out>` | `<title>_with_subtitles.mp4` |
| Generate summary | `generate_summary.py <chapter_info>` | `<title>_summary.md` |

**Batch translation:** 20 subtitles per API call → 95% fewer API calls, 10× faster, consistent terminology.

**Path space workaround:** burn_subtitles.py copies files to a temp dir with no spaces before FFmpeg runs (libass can't parse spaced paths).

**Subtitle format:**
```srt
1
00:00:00,000 --> 00:00:03,500
English subtitle text
中文字幕文字
```

**Subtitle style:** font size 24, bottom margin 30, white text + black outline.

**Translation retry:** automatic, up to 3 attempts on failure.

### Phase 6 — Output
```
./youtube-clips/<YYYYMMDD_HHMMSS>/
└── <ChapterTitle>/
    ├── <ChapterTitle>_clip.mp4              # raw clip, no subtitles
    ├── <ChapterTitle>_with_subtitles.mp4    # burned-in bilingual subtitles
    ├── <ChapterTitle>_bilingual.srt         # bilingual subtitle file
    └── <ChapterTitle>_summary.md            # social media content
```
Output directory is relative to current working directory. Asks if user wants to clip more chapters.

---

## Configuration (`~/.claude/skills/youtube-clipper/.env`)

```bash
FFMPEG_PATH=                    # auto-detected if empty
OUTPUT_DIR=./youtube-clips      # output root
MAX_VIDEO_HEIGHT=1080           # 720 / 1080 / 1440 / 2160
TRANSLATION_BATCH_SIZE=20       # 20-25 recommended
TARGET_LANGUAGE=中文             # translation target
TARGET_CHAPTER_DURATION=180     # seconds (180-300 = 3-5 min)
YT_DLP_PROXY=                   # http:// or socks5:// proxy
```

---

## Filename Sanitisation
Special chars removed: `/ \ : * ? " < > |` | Spaces → underscores | Max 100 chars

---

## Key Scripts
- `scripts/download_video.py` — yt-dlp wrapper
- `scripts/analyze_subtitles.py` — VTT parser → structured data
- `scripts/clip_video.py` — FFmpeg precise clip
- `scripts/translate_subtitles.py` — batch translator
- `scripts/burn_subtitles.py` — FFmpeg subtitle burn (uses temp dir for space workaround)
- `scripts/generate_summary.py` — social media content generator

---

## Trigger Phrases
"clip this YouTube video", "剪辑这个YouTube视频", or any YouTube URL with clipping intent.

## Invoke in Claude Code
```
Clip this YouTube video: https://youtube.com/watch?v=VIDEO_ID
```
