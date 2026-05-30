---
name: awesome-claude-skills
description: travisvn/awesome-claude-skills — curated directory of Claude Skills. Different from awesome-claude-code (broader CC ecosystem). This one is specifically Skills.
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# Awesome Claude Skills (travisvn)

Repo: https://github.com/travisvn/awesome-claude-skills
Last updated by maintainer: Feb 2026

A curated list specifically of Claude Skills — narrower than [[reference_awesome_claude_code]] which covers the whole Claude Code ecosystem (commands, hooks, agents, etc).

## When to consult
- Looking for a skill that does X before building one from scratch.
- Want to see what's official (anthropics/skills) vs community vs niche.
- Need install instructions or links to skill docs.

## Sections in the README
- **Official Skills** (anthropics/skills): Document Skills, Design & Creative, Development, Communication, Skill Creation
- **Community Skills**: Collections & Libraries, Individual Skills, Tools
- **Creating Your First Skill**: skill-creator (recommended) vs manual
- **Recent Updates**: monthly changelog of new skills
- **Skills vs MCP / Skills vs System Prompts** comparison
- **Vetting Skills / Security**: how to evaluate community skills before installing

## Key insight
Skills are progressive-disclosure: ~100 tokens (metadata) → <5k tokens (full instructions) → bundled resources on demand. Multiple skills can stay available without overwhelming context.

## How to use this reference
When the user asks "is there a skill for X?", check this directory first (or fetch latest with [[firecrawl-scrape]] against the README) before recommending building a custom skill.
