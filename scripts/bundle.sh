#!/bin/bash
# =============================================================================
# Professional Operating System — Bundle Generator
# =============================================================================
#
# PURPOSE:
#   Compiles all Professional OS source files into a single compiled markdown
#   file for upload to AI platforms (ChatGPT, Gemini, Claude, etc.)
#
# USAGE:
#   scripts/bundle.sh
#   scripts/bundle.sh --name "Coach" --abbrev "COS"   # explicit override
#
# CONFIGURATION (recommended):
#   Create a bundle.conf at the repo root:
#     PROFESSION=coach
#     ABBREVIATION=COS
#     DISPLAY_NAME=Coach
#
#   If bundle.conf is absent, auto-detects from 01_KERNEL/*_operating_system.md
#
# OUTPUT:
#   bundle/{abbrev_lower}_compiled.md  (e.g., cos_compiled.md, mos_compiled.md)
#
# DEPLOYMENT:
#   1. Upload bundle/{abbrev}_compiled.md to your AI platform knowledge base
#   2. Paste 00_BOOT/bootstrap_prompt.md into Custom Instructions (once only)
#   3. Test: type init_week in your AI conversation
# =============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# ── Parse optional CLI overrides ─────────────────────────────────────────────
CLI_DISPLAY_NAME=""
CLI_ABBREVIATION=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --name)   CLI_DISPLAY_NAME="$2"; shift 2 ;;
    --abbrev) CLI_ABBREVIATION="$2"; shift 2 ;;
    *) echo -e "${RED}Unknown option: $1${NC}"; exit 1 ;;
  esac
done

# ── Load configuration ────────────────────────────────────────────────────────
CONF_FILE="$REPO_ROOT/bundle.conf"
if [ -f "$CONF_FILE" ]; then
  # shellcheck source=/dev/null
  source "$CONF_FILE"
else
  # Auto-detect from 01_KERNEL/*_operating_system.md filename
  kernel_file=$(ls "$REPO_ROOT/01_KERNEL/"*_operating_system.md 2>/dev/null | grep -v personal_dna | head -1)
  if [ -z "$kernel_file" ]; then
    echo -e "${RED}Error: No *_operating_system.md found in 01_KERNEL/ and no bundle.conf present.${NC}"
    echo "  Create a bundle.conf or ensure 01_KERNEL/ contains your profession file."
    exit 1
  fi
  PROFESSION=$(basename "$kernel_file" "_operating_system.md")
  # Abbreviation: first letter of each word + OS  (product_manager → PMOS)
  ABBREVIATION=$(echo "$PROFESSION" | sed 's/_/ /g' | awk '{s=""; for(i=1;i<=NF;i++) s=s toupper(substr($i,1,1)); print s "OS"}')
  # Display name: title-case  (product_manager → Product Manager)
  DISPLAY_NAME=$(echo "$PROFESSION" | sed 's/_/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2); print}')
fi

# Apply CLI overrides if provided
[[ -n "$CLI_DISPLAY_NAME" ]] && DISPLAY_NAME="$CLI_DISPLAY_NAME"
[[ -n "$CLI_ABBREVIATION" ]] && ABBREVIATION="$CLI_ABBREVIATION"

ABBREV_LOWER=$(echo "$ABBREVIATION" | tr '[:upper:]' '[:lower:]')
BUNDLE_DIR="$REPO_ROOT/bundle"
OUTPUT_FILE="$BUNDLE_DIR/${ABBREV_LOWER}_compiled.md"

mkdir -p "$BUNDLE_DIR"
rm -f "$OUTPUT_FILE"

echo -e "${BLUE}${DISPLAY_NAME} Operating System (${ABBREVIATION}) — Bundle Generator${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "  Profession   : ${YELLOW}${DISPLAY_NAME}${NC}"
echo -e "  Abbreviation : ${YELLOW}${ABBREVIATION}${NC}"
echo -e "  Output       : ${YELLOW}${OUTPUT_FILE}${NC}"
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
  echo "# ${DISPLAY_NAME} Operating System (${ABBREVIATION}) — Compiled Bundle"
  echo ""
  echo "> **Generated:** $(date '+%Y-%m-%d %H:%M')"
  echo ">"
  echo "> Upload this file to your AI platform knowledge base, then paste"
  echo "> \`00_BOOT/bootstrap_prompt.md\` into Custom Instructions."
  echo ""
  echo "---"
  echo ""
} > "$OUTPUT_FILE"

# ── Layer 00: Boot ────────────────────────────────────────────────────────────
echo -e "${BLUE}▸ 00_BOOT${NC}"
add_file_to_bundle "$REPO_ROOT/00_BOOT/README.md"
# Note: bootstrap_prompt.md is NOT bundled — paste into Custom Instructions

# ── Layer 01: Kernel ─────────────────────────────────────────────────────────
echo -e "${BLUE}▸ 01_KERNEL${NC}"
add_file_to_bundle "$REPO_ROOT/01_KERNEL/${PROFESSION}_operating_system.md"
add_file_to_bundle "$REPO_ROOT/01_KERNEL/${PROFESSION}_decision_protocol.md"
add_file_to_bundle "$REPO_ROOT/01_KERNEL/personal_dna.md"

# ── Layer 02: Config ─────────────────────────────────────────────────────────
echo -e "${BLUE}▸ 02_CONFIG${NC}"
for f in "$REPO_ROOT"/02_CONFIG/*_operating_system.md "$REPO_ROOT"/02_CONFIG/*_strategy.md; do
  [ -f "$f" ] && add_file_to_bundle "$f"
done

# ── Layer 03: Drivers ────────────────────────────────────────────────────────
echo -e "${BLUE}▸ 03_DRIVERS${NC}"
# Roster file: *_operating_system.md or *_portfolio.md in 03_DRIVERS
for f in "$REPO_ROOT"/03_DRIVERS/*_operating_system.md "$REPO_ROOT"/03_DRIVERS/*_portfolio.md; do
  [ -f "$f" ] && add_file_to_bundle "$f"
done
# Entity cards: player_card*, client_card*, stakeholder_card*, etc.
entity_cards=("$REPO_ROOT"/03_DRIVERS/*_card*.md)
if [ -e "${entity_cards[0]}" ]; then
  for card in "${entity_cards[@]}"; do
    add_file_to_bundle "$card"
  done
else
  echo -e "  ${YELLOW}⚠  No entity card files found — create via onboard command${NC}"
fi

# ── Layer 04: Processes ──────────────────────────────────────────────────────
echo -e "${BLUE}▸ 04_PROCESSES${NC}"
for f in "$REPO_ROOT"/04_PROCESSES/*_plan.md; do
  [ -f "$f" ] && add_file_to_bundle "$f"
done

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
LINE_COUNT=$(wc -l < "$OUTPUT_FILE")
BYTE_SIZE_KB=$(( $(wc -c < "$OUTPUT_FILE") / 1024 ))
echo -e "  Files: ${YELLOW}${FILE_COUNT}${NC}  |  Lines: ${YELLOW}${LINE_COUNT}${NC}  |  Size: ${YELLOW}${BYTE_SIZE_KB} KB${NC}"
echo -e "  Output: ${YELLOW}${OUTPUT_FILE}${NC}"
echo ""

# ── Verification ──────────────────────────────────────────────────────────────
if grep -q "SOURCE FILE: 05_COMMANDS/system_prompt.md" "$OUTPUT_FILE"; then
  echo -e "  ${GREEN}✓ system_prompt.md marker verified${NC}"
else
  echo -e "  ${RED}✗ WARNING: system_prompt.md not found in bundle${NC}"
fi
echo ""

# ── Next steps ────────────────────────────────────────────────────────────────
echo -e "${BLUE}Next steps:${NC}"
echo "  1. Upload bundle/${ABBREV_LOWER}_compiled.md  →  AI platform knowledge base"
echo "  2. Paste  00_BOOT/bootstrap_prompt.md  →  Custom Instructions (once)"
echo "  3. Test:  type init_week in your AI conversation"
echo ""
