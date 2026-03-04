# Changelog

All notable changes to the Coach Operating System (COS) framework will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), adapted for AI-executable version upgrades.

## How to Upgrade

When a new version is released:

1. Download the new COS template files
2. Run the `version_upgrade` command in your AI copilot
3. The AI will read your current version, compare to the CHANGELOG, and walk you through the changes

The upgrade preserves all your existing data and only asks about new/changed sections.

---

## [Unreleased]

> Changes documented here will be included in the next version.

### Added

- **COS §11 — Professional Development & Supervision Standards** in `01_KERNEL/coach_operating_system.md`: New section covering certifications & training status, supervision & peer consultation standards, CPD commitments, and ethical practice boundaries. Inserted between §10 (Coaching Standards) and §12 (Pressure Mode).
- **Decision Protocol §3 — New Request Loop** in `01_KERNEL/coach_decision_protocol.md`: Full iterative evaluation protocol for new client requests, including gate pass/fail flows, re-entry rules, and Rule Zero override trigger.
- **Decision Protocol §4 — Decision Speed (Reversibility Framework)** in `01_KERNEL/coach_decision_protocol.md`: Defines fast vs. slow decision pacing based on reversibility, with a concrete examples table and Pressure Mode interaction rules.
- **Post-Session Note Template** added as §10 subsection in `01_KERNEL/coach_operating_system.md`: Structured 8-field template (Date, Client, Energy/Mood, Key Insight, Patterns, Actions, Next Focus, Ethics Flag) to feed `prep_session` context.
- **Archetype ↔ Persona Reference mapping table** added to `06_BOARDROOM/boardroom.md §1`: Maps the 6 command-layer archetype labels (Challenger, Execution Force, Narrative Strategist, Vulnerability Anchor, Standards Anchor, People Coach) to the 6 named personas.
- **Price column** added to `02_CONFIG/practice_operating_system.md §4` Service Offerings table: 1:1 coaching €995, course TBD (target €197–€297).
- **Coaching modes expanded to 5** in `01_KERNEL/coach_operating_system.md §5`: Added Directive, Supportive, and Facilitative modes alongside existing Exploratory and Accountability. Replaced "Story, Teach, Tool" row with "Directive" (Story–Teach–Tool remains as the technique within that mode). Added mode-switching rule.
- **`bundle.conf`** added to repository root: Declares `PROFESSION=coach`, `ABBREVIATION=COS`, `DISPLAY_NAME="Coach Operating System"` for the parameterized `scripts/bundle.sh` (part of Professional OS Framework compliance).
- **`scripts/bundle.sh` replaced** with parameterized version from Professional OS Framework: Reads `bundle.conf` for profession identity; auto-detects from `01_KERNEL/*_operating_system.md` filename if no conf file; globs layers 02/03/04 dynamically instead of hardcoding paths; outputs `{abbrev_lower}_compiled.md`. Backward-compatible — same output for COS as previous version.

### Changed

- **`ARCHITECTURE.md` boardroom references updated**: Diagram 4 command table changed `BOARDROOM §1,2,3` → `BOARDROOM §1–§5`; Diagram 8 node label changed `Working principles · Coach Chair` → `§1 Roster · §2 Principles · §5 Chair` to reflect the new boardroom §1–§5 section structure.
- **`Portable: Yes` reason clause** added in 7 portable files (see full list above in compliance fixes section).
  - `05_COMMANDS/system_prompt.md`: Updated Critical Rules table, Walkthrough 2 steps, failure criteria, and edge case example.
  - `05_COMMANDS/command_reference.md`: Swapped Gate 1/Gate 3 content in `client_request` output template (Gate 1 now Client Fit; Gate 3 now Capacity).
  - `ARCHITECTURE.md`: Updated Diagram 7 Mermaid nodes and edge labels.
  - `SETUP_WIZARD.md`: Updated Phase 6A gate summary.
- **COS §10 experience years** corrected from "20+" to "25+" to match §1, personal_dna.md, and boardroom.md.
- **Last Updated** headers filled (`2026-03-01`) and `[Your Name]` placeholders replaced with `David Garcia` in `00_BOOT/README.md`, `05_COMMANDS/command_reference.md`, `05_COMMANDS/system_prompt.md`.
- **"Fears I tend to avoid" section** renamed to **"Avoidance Patterns"** in `01_KERNEL/personal_dna.md` — aligns with `boundary_check` command reference.
- **Decision Protocol Level 3 (Capacity)** updated to reference `Client Portfolio §4` for the capacity figure instead of hardcoding "6-hour weekly baseline".
- **Boardroom §1 and §2** updated to reference `Client Portfolio §4` for capacity instead of hardcoding "6 hours", reducing future drift risk.
- **Content Block ritual** filled with concrete time (`Tuesday & Thursday 7:00–8:15 AM`) in `03_DRIVERS/client_portfolio.md §5`.
- **3rd 90-Day Goal TODO** resolved in `01_KERNEL/personal_dna.md`: Added "Establish Peer Support" as Goal 3.
- **Isolation Breakers TODO** resolved in `01_KERNEL/coach_operating_system.md §12`: Now references Client Portfolio §7 (where active search is documented).
- **Peer coach / mentor TODO** in `03_DRIVERS/client_portfolio.md §7`: Updated from TODO to "Actively seeking" status.
- **Rule Zero block** in `01_KERNEL/coach_decision_protocol.md §0` replaced with PROFESSION_SPEC.md §6 verbatim text: "The OS is a decision-SUPPORT tool. It does not make decisions…" + 4-item trigger list + "Rule Zero supersedes all other rules" closing. The previous 3-bullet version diverged from the canonical spec text.
- **Section headings in `coach_decision_protocol.md`** renamed from `## 0.`, `## 1.`, `## 2.`, `## 3.`, `## 4.` to `### §0 —`, `### §1 —`, `### §2 —`, `### §3 —`, `### §4 —` to match the spec reference format used throughout system_prompt.md and command_reference.md.
- **`boardroom.md` restructured from §1–§3 to §1–§5** per PROFESSION_SPEC.md §9.2: §1 Persona Roster (archetype table + all 6 persona definitions), §2 Working Principles (4 governing principles), §3 Activation Logic (topic-type → persona mapping table, moved from `command_reference.md`), §4 Session Format (standard output template), §5 The Coach's Chair. Previous §1/§2/§3 structure did not match spec.
- **`boardroom [topic]` command reclassified** into `## 🎯 DECISION SUPPORT COMMANDS` in `05_COMMANDS/command_reference.md`: Removed standalone `## 🎙️ BOARDROOM COMMAND` section header; added classification note at end of Decision Support section. `boardroom [topic]` command's "OS Files to Read" updated to reference new §1/§2/§3/§5 section numbers.
- **Freshness emoji mismatches corrected** in `05_COMMANDS/command_reference.md`: `client_request` and `boundary_check` commands changed `🔴 coach_decision_protocol.md — 30-day grace` to `🟢` (🔴 = 0-day grace per spec §10; 30-day grace files must use 🟢). `quarterly_reset` freshness block replaced `⚠️ All files will be updated` prose with properly emoji-tagged per-file entries (🔴/🟡/🟢).
- **`Portable: Yes` headers** in 7 files updated to include reason clause per PROFESSION_SPEC.md §5: `coach_operating_system.md`, `personal_dna.md`, `coach_decision_protocol.md` → `Yes — travels with the coach across all contexts`; `command_reference.md` → `Yes — command logic is context-independent`; `system_prompt.md` → `Yes — AI instructions are context-independent`; `boardroom.md` → `Yes — advisory council travels with the coach`; `00_BOOT/README.md` → `Yes — system manual, travels with the coach`.

### Migration Steps

**For existing users upgrading to this version:**

1. **Add COS §11:** Insert the new Professional Development & Supervision Standards section between §10 and §12 in your `coach_operating_system.md`. Template content is in this release's source file.
2. **Add Decision Protocol §3 and §4:** Append the New Request Loop and Decision Speed sections after §2 in your `coach_decision_protocol.md`. Template content in source file.
3. **Verify gate order:** Check `system_prompt.md`, `command_reference.md`, `ARCHITECTURE.md`, and `SETUP_WIZARD.md` — all gate references should read Client Fit → Strategy → Capacity. Update any that still say Capacity → Strategy → Fit.
4. **Rename section in personal_dna.md:** Rename "Fears I tend to avoid" to "Avoidance Patterns" (boundary_check command references this name).
5. **Add archetype mapping** to `boardroom.md §1`. Use this release's table as the template; adjust persona assignments if you changed the default personas.
6. **Add pricing column** to `practice_operating_system.md §4` Service Offerings table.
7. **Expand COS §5** coaching modes to include Directive, Supportive, and Facilitative. Use this release's table as the template. Add mode-switching rule.
8. **Create `bundle.conf`** at your repo root with: `PROFESSION=coach`, `ABBREVIATION=COS`, `DISPLAY_NAME=Coach Operating System`.
9. **Replace Rule Zero block** in `coach_decision_protocol.md`: Replace the 3-bullet `## 0. Rule Zero` section with the new §0 verbatim text from this release. Rename all section headings from `## N.` to `### §N —` format.
10. **Restructure `boardroom.md`** from §1–§3 to §1–§5 using this release as the template. Your persona content and Coach's Chair data carry forward unchanged — only section structure and headings change.
11. **Fix freshness emoji** in `command_reference.md`: Change `🔴 coach_decision_protocol.md — 30-day grace` to `🟢` in both `client_request` and `boundary_check` commands. Replace `quarterly_reset` freshness block with the per-file 🔴/🟡/🟢 entries from this release.
12. **Add reason clause** to all `Portable: Yes` file headers using the formulas from this release's `### Changed` entry.
13. **Replace `scripts/bundle.sh`** with the parameterized version from this release. Create `bundle.conf` at repo root with `PROFESSION=coach`, `ABBREVIATION=COS`, `DISPLAY_NAME="Coach Operating System"` (quote the value — it contains spaces). Verify with `bash scripts/bundle.sh`.
8. **Fill Last Updated headers** in `00_BOOT/README.md`, `command_reference.md`, `system_prompt.md`.

---

## [2026.02] - 2026-02-26

**Initial Release** — First versioned release of the Coach Operating System framework.
