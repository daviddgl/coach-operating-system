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

### Changed

- **Gate order aligned** across all downstream files to match Decision Protocol §1 canonical order (Client Fit → Practice Strategy → Capacity):
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

### Migration Steps

**For existing users upgrading to this version:**

1. **Add COS §11:** Insert the new Professional Development & Supervision Standards section between §10 and §12 in your `coach_operating_system.md`. Template content is in this release's source file.
2. **Add Decision Protocol §3 and §4:** Append the New Request Loop and Decision Speed sections after §2 in your `coach_decision_protocol.md`. Template content in source file.
3. **Verify gate order:** Check `system_prompt.md`, `command_reference.md`, `ARCHITECTURE.md`, and `SETUP_WIZARD.md` — all gate references should read Client Fit → Strategy → Capacity. Update any that still say Capacity → Strategy → Fit.
4. **Rename section in personal_dna.md:** Rename "Fears I tend to avoid" to "Avoidance Patterns" (boundary_check command references this name).
5. **Add archetype mapping** to `boardroom.md §1`. Use this release's table as the template; adjust persona assignments if you changed the default personas.
6. **Add pricing column** to `practice_operating_system.md §4` Service Offerings table.
7. **Expand COS §5** coaching modes to include Directive, Supportive, and Facilitative. Use this release's table as the template. Add mode-switching rule.
8. **Fill Last Updated headers** in `00_BOOT/README.md`, `command_reference.md`, `system_prompt.md`.

---

## [2026.02] - 2026-02-26

**Initial Release** — First versioned release of the Coach Operating System framework.
