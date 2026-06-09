---
name: agent-reach
description: Panniantong/Agent-Reach v1.4.0 — routing skill that gives agents access to 17 platforms (especially Chinese ones Firecrawl struggles with — Xiaohongshu/Weibo/Bilibili/Douyin/V2EX/WeChat) plus Twitter/Reddit/LinkedIn/YouTube/podcasts via free CLI tools. Skill vendored as routing brain; upstream CLI tools require separate one-line install. MIT.
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# Agent Reach (Panniantong/Agent-Reach)

Repo: https://github.com/Panniantong/Agent-Reach
Version: 1.4.0 · MIT · Author: Neo Reid
Skill vendored: 2026-06-09 — just the routing brain (`SKILL.md` + 6 references files, ~44KB)
Upstream CLI tools: NOT auto-installed — user runs the official install when ready

## What it adds beyond existing read-the-web skills

| Platform | Existing skill | Agent-Reach |
|---|---|---|
| Generic web pages | [[firecrawl-scrape]], [[defuddle]] | `curl -s "https://r.jina.ai/URL"` (Jina Reader, free) |
| Web search | [[firecrawl-search]] | `mcporter call 'exa.web_search_exa(...)'` (Exa, free tier) |
| GitHub | already use `gh` | `gh search`, `gh issue view`, etc. |
| YouTube | [[reference_youtube_clipper]] | `yt-dlp --write-sub` (raw subtitles, no clipping) |
| Twitter/X | ❌ none | `twitter-cli` scraper — **no API key needed** |
| Reddit | ❌ none (403 blocks) | `rdt-cli` — bypasses 403, search + read posts |
| Xiaohongshu (小红书) | ❌ none | `xhs-cli` — Chinese review platform |
| Weibo (微博) | ❌ none | Chinese platform support |
| Bilibili (B站) | ❌ none | Chinese video platform with subtitles |
| Douyin (抖音) | ❌ none | TikTok China |
| WeChat 公众号 | ❌ none | Otherwise impossible to scrape |
| LinkedIn | ❌ none | Login-walled platform |
| V2EX | ❌ none | Chinese dev forum |
| RSS | ❌ none | RSS aggregation |
| Podcasts (小宇宙) | ❌ none | Chinese podcast platform with transcripts |
| Xueqiu (雪球) | ❌ none | Chinese stock/finance platform |

**Especially valuable for IM8 work**: Chinese health/wellness market intelligence (Xiaohongshu reviews, Weibo trends, Bilibili creator analysis, Douyin influencer content) — Firecrawl + defuddle don't handle these well because they require auth, geo-IP, or login walls.

**Also relevant to [[project_trading_bot]]**: Xueqiu (雪球) for Chinese stock sentiment, plus B站 for retail trader videos.

## CLI tool availability (as of 2026-06-09)

| Tool | Status | Used for |
|---|---|---|
| `gh` | ✓ installed (homebrew) | GitHub |
| `curl` | ✓ installed (built-in) | Jina Reader (web), V2EX API |
| `yt-dlp` | ✗ missing — install: `brew install yt-dlp` | YouTube/Bilibili subtitles |
| `twitter` | ✗ missing — install via Agent-Reach | Twitter/X |
| `rdt` | ✗ missing — install via Agent-Reach | Reddit |
| `xhs-cli` | ✗ missing — install via Agent-Reach | Xiaohongshu |
| `mcporter` | ✗ missing — install via Agent-Reach | Exa search MCP + others |

## Install path (one-line, when needed)

Tell your agent:
```
帮我安装 Agent Reach：https://raw.githubusercontent.com/Panniantong/Agent-Reach/main/docs/install.md
```

Or in English: paste the install.md URL to your agent. The agent reads the install guide, installs upstream tools into `~/.agent-reach/`, and verifies with `agent-reach doctor`.

**Boundaries baked into the install guide:**
- No `sudo` without explicit approval
- No system files modified outside `~/.agent-reach/`
- All cookies stored locally only, never uploaded

**Cost:** Everything free. Optional: $1/mo server proxy for some geo-restricted platforms. Local laptop doesn't need it.

## Skill router pattern

The vendored `SKILL.md` is a 106-line routing table. When a user asks about a platform, Claude reads `SKILL.md` first, then loads the matching `references/<category>.md` (career, dev, search, social, video, web) for command details. Total skill content ~25KB — minimal token footprint.

## Trigger words (bilingual)

The skill triggers in both Chinese and English. Key triggers:
- 搜/查/找/search/搜索 → search
- 小红书/xiaohongshu/xhs → social/小红书
- 推特/twitter/x.com → social/Twitter
- 微博/weibo → social/微博
- B站/bilibili/哔哩哔哩 → video/B站
- 抖音/douyin → social/抖音
- 招聘/职位/linkedin/领英 → career
- github/代码/仓库 → dev
- 网页/链接/文章/公众号 → web
- youtube/视频/播客/字幕 → video
- 雪球/股票/xueqiu → finance

## Workspace rules

Per the skill: don't create files in agent workspace. Use `/tmp/` for temp output, `~/.agent-reach/` for persistent data (cookies, downloads).

## When to install the upstream CLIs (decision criteria)

Don't install upstream tools speculatively. Trigger install when:
1. **First Chinese platform task** (Xiaohongshu, Weibo, Bilibili, Douyin, WeChat, Xueqiu) — Firecrawl can't help
2. **First Twitter/X scrape need** — no API key alternative beats this
3. **First Reddit read** — 403 blocks Firecrawl/defuddle from many threads
4. **Need YouTube subtitles regularly** — `brew install yt-dlp` standalone is enough; full Agent-Reach not required

For one-off non-Chinese reads, prefer [[firecrawl-scrape]] (already configured) over installing Agent-Reach's full stack.

## Relationship to existing skills

| Use case | Best tool |
|---|---|
| English web search | [[firecrawl-search]] (already wired) |
| Generic web scrape | [[firecrawl-scrape]] or [[defuddle]] |
| Chinese platform anything | **Agent-Reach** |
| Twitter, Reddit, LinkedIn | **Agent-Reach** |
| Live browser interaction | [[firecrawl-interact]] or [[agent-browser]] (Mafia) |
| Site mapping | [[firecrawl-map]] |
| Content change monitoring | [[firecrawl-monitor]] |
| YouTube clip + bilingual subs | [[reference_youtube_clipper]] |
| Raw YouTube subs only | Agent-Reach (`yt-dlp`) |
