#!/bin/bash
# =============================================================================
# COS Bundle Generator
# =============================================================================
#
# PURPOSE:
#   Compiles all Coach Operating System (COS) source files into a single
#   cos_compiled.md file for upload to AI platforms.
#
# USAGE:
#   ./scripts/bundle.sh
#   (Run from the repository root or from anywhere — script locates repo root)
#
# OUTPUT:
#   bundle/cos_compiled.md — single file containing all COS content, ready
#   to upload to ChatGPT Projects, Gemini Gems, or Claude Projects.
#
# HOW IT WORKS:
#   Each file is wrapped with a SOURCE FILE marker so the AI copilot can
#   locate individual files by name within the bundle:
#     <!-- SOURCE FILE: 05_COMMANDS/system_prompt.md -->
#
# DEPLOYMENT STEPS AFTER RUNNING:
#   1. Upload bundle/cos_compiled.md to your AI platform's knowledge base
#   2. Paste 00_BOOT/bootstrap_prompt.md into Custom Instructions (once only)
#   3. Test with: init_week
# =============================================================================

set -e

# ── Colours ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# ── Paths ─────────────────────────────────────────────────────────────────────
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUNDLE_DIR="$REPO_ROOT/bundle"
OUTPUT_FILE="$BUNDLE_DIR/cos_compiled.md"

mkdir -p "$BUNDLE_DIR"
rm -f "$OUTPUT_FILE"

echo -e "${BLUE}COS Bundle Generator${NC}"
echo -e "${BLUE}════════════════════${NC}"
echo ""
echo -e "Repository root: ${YELLOW}$REPO_ROOT${NC}"
echo -e "Output:          ${YELLOW}$OUTPUT_FILE${NC}"
echo ""

# ── Helper ────────────────────────────────────────────────────────────────────
FILE_COUNT=0

add_file_to_bundle() {
  local source_file="$1"
  local relative_path="${source_file#$REPO_ROOT/}"

  if [ ! -f "$source_file" ]; then
    echo -e "  ${YELLOW}⚠  MISSING:${NC}  $relative_path"
    return
  fi

  {
    echo ""
    echo "<!-- ═══════════════════════════════════════════════════════════ -->"
    echo "<!-- SOURCE FILE: $relative_path -->"
    echo "<!-- ═══════════════════════════════════════════════════════════ -->"
    echo ""
    cat "$source_file"
  } >> "$OUTPUT_FILE"

  echo -e "  ${GREEN}✓${NC}  $relative_path"
  FILE_COUNT=$((FILE_COUNT + 1))
}

# ── Bundle header ─────────────────────────────────────────────────────────────
{
  echo "# Coach Operating System (COS) — Compiled Bundle"
  echo ""
  echo "> **Generated:** $(date '+%Y-%m-%d %H:%M')"
  echo ">"
  echo "> This is a complete COS compilation in a single document for AI platform"
  echo "> knowledge uploads. Upload this file to your AI platform's knowledge base,"
  echo "> then paste \`00_BOOT/bootstrap_prompt.md\` into Custom Instructions."
  echo ""
  echo "---"
  echo ""
} > "$OUTPUT_FILE"

# ── Layer 00: Boot ────────────────────────────────────────────────────────────
echo -e "${BLUE}▸ 00_BOOT${NC}"
add_file_to_bundle "$REPO_ROOT/00_BOOT/README.md"
# Note: bootstrap_prompt.md is NOT bundled — it's pasted into Custom Instructions

# ── Layer 01: Kernel ─────────────────────────────────────────────────────────
echo -e "${BLUE}▸ 01_KERNEL${NC}"
add_file_to_bundle "$REPO_ROOT/01_KERNEL/coach_operating_system.md"
add_file_to_bundle "$REPO_ROOT/01_KERNEL/coach_decision_protocol.md"
add_file_to_bundle "$REPO_ROOT/01_KERNEL/personal_dna.md"

# ── Layer 02: Config ─────────────────────────────────────────────────────────
echo -e "${BLUE}▸ 02_CONFIG${NC}"
add_file_to_bundle "$REPO_ROOT/02_CONFIG/practice_operating_system.md"
add_file_to_bundle "$REPO_ROOT/02_CONFIG/practice_strategy.md"

# ── Layer 03: Drivers ────────────────────────────────────────────────────────
echo -e "${BLUE}▸ 03_DRIVERS${NC}"
add_file_to_bundle "$REPO_ROOT/03_DRIVERS/client_portfolio.md"

client_cards=("$REPO_ROOT"/03_DRIVERS/client_card*.md)
if [ -e "${client_cards[0]}" ]; then
  for client_card in "${client_cards[@]}"; do
    add_file_to_bundle "$client_card"
  done
else
  echo -e "  ${YELLOW}⚠  No client_card files found — create them via onboard_client${NC}"
fi

# ── Layer 04: Processes ──────────────────────────────────────────────────────
echo -e "${BLUE}▸ 04_PROCESSES${NC}"
add_file_to_bundle "$REPO_ROOT/04_PROCESSES/quarterly_plan.md"

# ── Layer 05: Commands ───────────────────────────────────────────────────────
echo -e "${BLUE}▸ 05_COMMANDS${NC}"
add_file_to_bundle "$REPO_ROOT/05_COMMANDS/command_reference.md"
add_file_to_bundle "$REPO_ROOT/05_COMMANDS/system_prompt.md"

# ── Layer 06: Boardroom ──────────────────────────────────────────────────────
echo -e "${BLUE}▸ 06_BOARDROOM${NC}"
add_file_to_bundle "$REPO_ROOT/06_BOARDROOM/boardroom.md"

# ── Summary ───────────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}✓ Bundle complete!${NC}"
echo ""

LINE_COUNT=$(wc -l < "$OUTPUT_FILE")
BYTE_SIZE=$(wc -c < "$OUTPUT_FILE")
BYTE_SIZE_KB=$((BYTE_SIZE / 1024))

echo -e "  Files bundled : ${YELLOW}$FILE_COUNT${NC}"
echo -e "  Lines         : ${YELLOW}$LINE_COUNT${NC}"
echo -e "  Size          : ${YELLOW}${BYTE_SIZE_KB} KB${NC}"
echo ""
echo -e "  Output: ${YELLOW}$OUTPUT_FILE${NC}"
echo ""

# ── Verification ──────────────────────────────────────────────────────────────
if grep -q "SOURCE FILE: 05_COMMANDS/system_prompt.md" "$OUTPUT_FILE"; then
  echo -e "  ${GREEN}✓ system_prompt.md marker verified${NC}"
else
  echo -e "  ${RED}✗ WARNING: system_prompt.md marker not found in bundle${NC}"
fi
echo ""

# ── Next steps ────────────────────────────────────────────────────────────────
echo -e "${BLUE}Next steps:${NC}"
echo "  1. Upload   bundle/cos_compiled.md  →  AI platform knowledge base"
echo "  2. Paste    00_BOOT/bootstrap_prompt.md  →  Custom Instructions (once)"
echo "  3. Test:    type 'init_week' in your AI conversation"
echo ""

