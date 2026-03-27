#!/usr/bin/env bash
# =============================================================================
# Claude Starter Pack — Bootstrap Script
# Installs memory, commands, and skills into a fresh Claude Code environment.
# =============================================================================

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC} $1"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $1"; }

echo ""
echo "=============================================="
echo "   Claude Starter Pack — Bootstrap Installer"
echo "=============================================="
echo ""

# ── 1. Detect current project memory dir ──────────────────────────────────────
# Claude Code stores project memory at:
#   ~/.claude/projects/<path-encoded-cwd>/memory/
# We need to figure out the right path for the current working directory.

CWD_ENCODED=$(pwd | sed 's|/|-|g' | sed 's|^-||')
MEMORY_DIR="$CLAUDE_DIR/projects/$CWD_ENCODED/memory"

info "Current directory: $(pwd)"
info "Memory will be installed to: $MEMORY_DIR"
echo ""

# ── 2. Install memory files ────────────────────────────────────────────────────
install_memory() {
  info "Installing memory files..."
  mkdir -p "$MEMORY_DIR"

  for f in "$REPO_DIR/memory/"*.md; do
    fname="$(basename "$f")"
    if [ -f "$MEMORY_DIR/$fname" ]; then
      warn "  $fname already exists — skipping (delete first to overwrite)"
    else
      cp "$f" "$MEMORY_DIR/$fname"
      success "  Installed memory: $fname"
    fi
  done
}

# ── 3. Install commands ────────────────────────────────────────────────────────
install_commands() {
  info "Installing custom commands..."
  mkdir -p "$CLAUDE_DIR/commands"

  for f in "$REPO_DIR/commands/"*.md; do
    fname="$(basename "$f")"
    if [ -f "$CLAUDE_DIR/commands/$fname" ]; then
      warn "  $fname already exists — skipping"
    else
      cp "$f" "$CLAUDE_DIR/commands/$fname"
      success "  Installed command: /$fname"
    fi
  done
}

# ── 4. Install skills & tools (via npx / brew / curl) ─────────────────────────
install_skills() {
  info "Installing external skills and tools..."
  echo ""

  # GET SHIT DONE — spec-driven dev system
  if ! ls "$CLAUDE_DIR/get-shit-done" &>/dev/null 2>&1; then
    echo "  Installing GET SHIT DONE (GSD)..."
    npx get-shit-done-cc@latest --claude --global 2>/dev/null && success "  GSD installed" || warn "  GSD install failed — run: npx get-shit-done-cc@latest"
  else
    success "  GSD already installed"
  fi

  echo ""
  info "The following skills are referenced in memory but require manual installation:"
  echo ""
  echo "  UI/UX Pro Max:"
  echo "    npx skills add https://github.com/nextlevelbuilder/ui-ux-pro-max-skill"
  echo ""
  echo "  GEO-SEO Claude (13 GEO skills):"
  echo "    curl -fsSL https://raw.githubusercontent.com/zubair-trabzada/geo-seo-claude/main/install.sh | bash"
  echo ""
  echo "  SEO Machine (26 marketing skills):"
  echo "    git clone https://github.com/TheCraigHewitt/seomachine && cd seomachine && pip install -r data_sources/requirements.txt"
  echo ""
  echo "  Claude Skills by alirezarezvani (205 skills):"
  echo "    git clone https://github.com/alirezarezvani/claude-skills"
  echo ""
  echo "  YouTube Clipper Skill:"
  echo "    npx skills add https://github.com/op7418/Youtube-clipper-skill"
  echo "    brew install ffmpeg-full yt-dlp  # macOS — must use ffmpeg-full, not ffmpeg"
  echo ""
  echo "  n8n Skills (requires n8n-mcp MCP server):"
  echo "    git clone https://github.com/czlonkowski/n8n-skills"
  echo ""
  echo "  Claude Code Security Review:"
  echo "    Already included as /security-review command (commands/security-review.md)"
  echo ""
  echo "  Awesome Claude Code (reference directory):"
  echo "    https://github.com/hesreallyhim/awesome-claude-code"
  echo ""
  echo "  claude-code-action (GitHub Action — add to .github/workflows/):"
  echo "    See memory/reference_claude_code_action.md for workflow YAML"
  echo ""
  echo "  claude-mem (persistent semantic memory via SQLite + Chroma):"
  echo "    npx @claude-mem/install  OR install from Claude marketplace"
  echo ""
}

# ── 5. IM8 brand assets note ───────────────────────────────────────────────────
note_im8() {
  echo ""
  info "IM8 Brand Assets:"
  warn "  IM8 fonts, logos, and color tokens are private — copy them manually."
  echo "  Reference: memory/reference_im8_brand.md + memory/feedback_im8_frontend_design.md"
  echo "  IM8 brand ALWAYS overrides generic UI/UX recommendations."
  echo ""
}

# ── Main ───────────────────────────────────────────────────────────────────────
install_memory
echo ""
install_commands
echo ""
install_skills
note_im8

echo "=============================================="
success "Bootstrap complete!"
echo ""
echo "Next steps:"
echo "  1. Open Claude Code in any project"
echo "  2. Claude will automatically load memory from: $MEMORY_DIR"
echo "  3. Use /security-review for security audits"
echo "  4. Use /gsd:help for GSD workflow commands"
echo "  5. Install any remaining skills listed above"
echo "=============================================="
echo ""
