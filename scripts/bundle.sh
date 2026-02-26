#!/bin/bash

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUNDLE_DIR="$REPO_ROOT/bundle"
OUTPUT_FILE="$BUNDLE_DIR/cos_compiled.md"

mkdir -p "$BUNDLE_DIR"
rm -f "$OUTPUT_FILE"

add_file_to_bundle() {
  local source_file=$1
  if [ ! -f "$source_file" ]; then
    return
  fi
  {
    echo ""
    echo "<!-- ═══════════════════════════════════════════════════════════ -->"
    echo "<!-- SOURCE FILE: ${source_file#$REPO_ROOT/} -->"
    echo "<!-- ═══════════════════════════════════════════════════════════ -->"
    echo ""
    cat "$source_file"
  } >> "$OUTPUT_FILE"
}

{
  echo "# Coach Operating System (COS) — Compiled Bundle"
  echo ""
  echo "> Complete COS compilation in a single document for AI platform knowledge upload."
  echo ""
  echo "---"
  echo ""
} > "$OUTPUT_FILE"

add_file_to_bundle "$REPO_ROOT/00_BOOT/README.md"
add_file_to_bundle "$REPO_ROOT/00_BOOT/bootstrap_prompt.md"
add_file_to_bundle "$REPO_ROOT/01_KERNEL/coach_operating_system.md"
add_file_to_bundle "$REPO_ROOT/01_KERNEL/coach_decision_protocol.md"
add_file_to_bundle "$REPO_ROOT/01_KERNEL/personal_dna.md"
add_file_to_bundle "$REPO_ROOT/02_CONFIG/practice_operating_system.md"
add_file_to_bundle "$REPO_ROOT/02_CONFIG/practice_strategy.md"
add_file_to_bundle "$REPO_ROOT/03_DRIVERS/client_portfolio.md"

client_cards=("$REPO_ROOT"/03_DRIVERS/client_card*.md)
if [ -e "${client_cards[0]}" ]; then
  for client_card in "${client_cards[@]}"; do
    add_file_to_bundle "$client_card"
  done
fi

add_file_to_bundle "$REPO_ROOT/04_PROCESSES/quarterly_plan.md"
add_file_to_bundle "$REPO_ROOT/05_COMMANDS/command_reference.md"
add_file_to_bundle "$REPO_ROOT/05_COMMANDS/system_prompt.md"
add_file_to_bundle "$REPO_ROOT/06_BOARDROOM/boardroom.md"

printf "Generated: %s\n" "$OUTPUT_FILE"
