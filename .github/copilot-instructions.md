# Copilot Instructions — Coach Operating System (COS)

## What This Project Is

This repository is a **Coach Operating System (COS)** — a portable, markdown-based decision-support framework for independent career coaches. It is **not** a code project. All content is structured Markdown designed to be loaded into AI copilots (ChatGPT, Gemini, Claude) as knowledge files.

The abbreviation **COS** is the standard short form used after the first mention of "Coach Operating System" in any document.

## Architecture

The repository follows an OS-layer metaphor with numbered folders:

| Folder | Layer | Lifecycle | Purpose |
|--------|-------|-----------|---------|
| `00_BOOT/` | System manual | Permanent | Architecture docs, onboarding, portability contract |
| `01_KERNEL/` | Portable core | Permanent | Philosophy, decision protocols, Personal DNA — travels with the coach |
| `02_CONFIG/` | Environment | Per-practice | Practice mission, niche, values, strategy — practice-level context |
| `03_DRIVERS/` | Swappable | Per-roster | Client portfolio (roster, capacity, rituals, referral network), client cards — refreshed when roster changes |
| `04_PROCESSES/` | Ephemeral | Per-quarter | Quarterly plan, programme milestones, risks — replaced quarterly |
| `05_COMMANDS/` | Interface | Permanent | Named AI commands + system prompt |
| `06_BOARDROOM/` | Advisory council | Permanent | Virtual advisory council — portable coaching-domain persona definitions, travels with the coach |

**Root folder** contains only repository metadata and onboarding entry docs (README, LICENSE, NOTICE, SETUP_WIZARD, ARCHITECTURE, CONTRIBUTING, etc.).

**Visual Documentation:** [ARCHITECTURE.md](../ARCHITECTURE.md) at root contains 8 Mermaid diagrams showing:
- Layer hierarchy and information flow
- Complete system graph (files, commands, data sources)
- Weekly lifecycle timeline
- Command execution details
- Data flow patterns
- Portability model
- Decision protocol gates
- Quick reference guide

This file is **for new coach users**. Maintain it alongside 00_BOOT/README.md when making structural changes.

## File Header Maintenance

All COS files have two metadata fields:

| Field | Updated By | When | Purpose |
|-------|-----------|------|---------|
| **Version** | Framework maintainers | Per release (e.g., monthly) | Tracks COS template version (e.g., `2026.02`) |
| **Last Updated** | You (coach) | When running `prep_refresh` or `quarterly_reset` | Tracks when file content was last refreshed |

**User responsibility:** Update `Last Updated` ONLY when doing a full file refresh cycle (via `prep_refresh` or `quarterly_reset`), not for minor edits.

**Why it matters:** The file freshness validation system compares `Last Updated` dates against expected refresh frequencies (weekly for `quarterly_plan`, quarterly for portfolio files, etc.) to trigger `prep_refresh` warnings.

## How the System Works — Complete Flow

**Setup Phase (One-time):**
1. Coach runs SETUP_WIZARD.md (a system prompt pasted into ChatGPT/Gemini/Claude)
2. Fills in KERNEL (coaching philosophy), CONFIG (practice), DRIVERS (client portfolio), PROCESSES (quarter)
3. Uploads all COS files to AI platform as a Knowledge Project or custom instructions

**Execution Phase (Ongoing):**
1. Coach invokes one of 15 named commands (e.g., `init_week`, `prep_session`, `prep_refresh`, `version_upgrade`)
2. Command reads relevant OS files (logic layer)
3. Command queries external tools (Notion, Airtable, Calendar) for live data
4. AI copilot produces structured output (decision, plan, prep notes)
5. Coach executes, then logs results back to external tools
6. Loop repeats daily/weekly/quarterly

**Key Insight — Logic vs. Data:**
- **COS files** = source of truth for *how* decisions are made (portable, reusable)
- **Notion/Airtable/Calendar** = source of truth for *what* is happening with clients (context-specific, replaceable)
- Commands act as adapters: read logic from COS, read data from external tools, produce recommendations

**Portability:**
When the coach changes niche, business model, or client roster, they keep KERNEL + COMMANDS (the logic), but update CONFIG + DRIVERS + PROCESSES (the context). This is why logic and data are separated — the logic is reusable, the data is not.

## Key Conventions

### Naming
- Full name: "Coach Operating System" — used in titles, first mentions, and file names.
- Abbreviation: "COS" — used in section references (e.g., COS §3, COS §12), tables, and repeated mentions within a document.
- File names use lowercase with underscores: `coach_operating_system.md`, not `Coach Operating System.md` or `COS.md`.
- Apply this consistently: `personal_dna.md`, `client_portfolio.md`, `quarterly_plan.md`, `system_prompt.md`, `command_reference.md`, etc.

### File references
- When referencing OS files in command definitions or cross-references, always use the real file path in lowercase with underscores: `01_KERNEL/coach_operating_system.md`.
- When referencing sections inline, use the COS abbreviation: "COS §3", "COS §12".

### Writing style
- Practical and concise. No filler.
- Preserve existing folder architecture and naming conventions.
- Use `[bracket]` placeholders for user-specific content.
- Use `<!-- HTML comments -->` for inline guidance to users filling in templates.
- Mark incomplete items as `[TODO]`.

### Section numbering
- `coach_operating_system.md` uses §1–§13 section numbers referenced throughout commands and protocols.
- Always preserve these section numbers — they are cross-referenced by the Decision Protocol, Command Reference, and System Prompt.

## Critical Design Principles

1. **Logic vs. Data separation**: Markdown files = logic (how we coach). External tools (Notion, Airtable, Calendar) = data (what is happening with clients). Never embed live session data or client notes in these files. This separation makes the OS portable — the logic works for any client, any niche.

2. **Portability contract**: `01_KERNEL/` and `05_COMMANDS/` travel with the coach across client cohorts and practice pivots. `02_CONFIG/` updates per practice direction. `03_DRIVERS/` and `04_PROCESSES/` are refreshed when roster/quarter changes. This means changes to KERNEL must be backward-compatible and generic (no client-specific assumptions).

3. **Decision support, not decision making**: The OS calculates trade-offs and flags issues; humans make the final call. Rule Zero (Decision Protocol §0) enforces this: when ambiguous, the coach resolves by talking directly to the client or supervisor — not by deferring to the system.

4. **Capacity Contract**: Defined during setup via SETUP_WIZARD; the coach chooses their coaching-to-operations ratio (examples: 60/20/20, 70/15/15, 50/30/20). The system enforces the chosen ratio, not a hardcoded default. See SETUP_WIZARD Phase 3B and Client Portfolio §4 for implementation.

5. **Pressure Mode**: COS §12 (Pressure Mode) defines stress-indicator patterns specific to the coach. AI copilots should proactively detect these patterns in session context and suggest de-escalation (e.g., "You're in Pressure Mode — simplify or take it to supervision"). This is a safety mechanism.

6. **Command independence**: Each of the 14 commands in `05_COMMANDS/command_reference.md` is self-contained and can be run in isolation. However, all commands read from the same KERNEL, CONFIG, DRIVERS, PROCESSES, and BOARDROOM files to ensure consistent decision logic across operations.

## Repository Policy

- `.gitignore` uses a strict allowlist (`*` ignores everything, then `!` whitelists specific paths).
- No private or client-specific data should be committed — templates only.
- All content must remain client-agnostic and reusable.
- Client names used in file names (e.g., `client_card - Alice.md`) should be anonymised or use aliases if the repository is not private.

## When Editing

- Preserve the numbered folder structure (`00_` through `06_`).
- Keep cross-references consistent: if you rename a section, update all files that reference it.
- The commands in `05_COMMANDS/command_reference.md` each specify which files and sections they read — keep these in sync.
- `SETUP_WIZARD.md` is a system prompt pasted into external AI tools — it must be self-contained and reference the current repo structure accurately.
- `05_COMMANDS/system_prompt.md` is the master AI copilot instruction — it is **bundled inside `cos_compiled.md`** (not pasted separately). Changes here affect all command execution behaviour.
- `00_BOOT/bootstrap_prompt.md` is the **static Custom Instructions text** — a tiny pointer telling the AI to load `system_prompt.md` from the bundle. It is version-independent and should almost never change.
- **ARCHITECTURE.md** is visual documentation for new coach users. When changing layer structure or adding/removing commands, update the 8 Mermaid diagrams to reflect the changes (especially diagrams 2, 3, 4, and 8).
- Keep `00_BOOT/README.md` (narrative) and [ARCHITECTURE.md](../ARCHITECTURE.md) (visual) in sync — they should tell the same story from different angles.

### CHANGELOG Maintenance (Critical)

**Every framework change MUST be documented in CHANGELOG.md** before committing.

When you:
- **Add** new files, commands, sections, or features → Document in CHANGELOG.md `[Unreleased]` → `### Added`
- **Change** existing structure, rename sections, modify command definitions → Document in `### Changed`
- **Remove** deprecated features, old sections, obsolete commands → Document in `### Removed`
- **Create migration steps** for breaking changes → Document in `### Migration Steps`

**Process:**
1. Make your changes to framework files
2. **Before committing:** Update CHANGELOG.md `[Unreleased]` section with your changes
3. Include machine-readable migration steps for the `version_upgrade` command to parse
4. When releasing a new version, move `[Unreleased]` content to a new `## [YYYY.MM]` section with release date

**Why this matters:** Coach users upgrade via `version_upgrade` command, which reads CHANGELOG.md to preserve their data while applying framework updates. If your change isn't in the changelog, users will lose data or encounter broken functionality during upgrades.

**Example:**
```markdown
## [Unreleased]

### Added
- New §14 in `coach_operating_system.md` — Supervision & CPD Framework
- New command `supervision_prep` in People category

### Changed
- Renamed Client Portfolio §6 "Strategic Translation" → "Strategic Alignment"
- Updated `init_week` command to include boundary check baseline

### Migration Steps
1. Add §14 to COS: [Provide template text]
2. Update Client Portfolio §6: Rename section header, adapt content structure
3. Re-run `init_week` to verify updated command works
```
