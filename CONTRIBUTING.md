# Contributing to Coach Operating System

Thanks for your interest in improving Coach Operating System.

## How to contribute

1. Fork the repository
2. Create a branch for your change
3. Keep changes focused and small
4. Open a pull request with:
   - What problem you are solving
   - What changed
   - Any trade-offs or alternatives considered

## Contribution scope

- Improve clarity and usability of the framework
- Fix inconsistencies in templates or commands
- Add examples that remain company-agnostic
- Avoid adding private/company-specific data

## Style guidelines

- Keep language practical and concise
- Preserve existing folder architecture and naming conventions
- Prefer minimal, reversible changes

## CHANGELOG Requirements (Critical)

**Every framework change MUST be documented in CHANGELOG.md.**

Before committing any change to COS template files, commands, or structure:

1. **Open CHANGELOG.md**
2. **Add your change to `[Unreleased]` section** under the appropriate category:
   - `### Added` — New files, commands, sections, features
   - `### Changed` — Renamed sections, modified structure, updated commands
   - `### Removed` — Deprecated features, deleted sections
   - `### Migration Steps` — Instructions for upgrading (if breaking change)

3. **Be specific and machine-readable** — The `version_upgrade` command parses this file to help users upgrade while preserving their data

**Example:**

```markdown
## [Unreleased]

### Added
- New §14 in `coach_operating_system.md` — Decision Delegation Framework
- New command `client_health_check` in Execution category

### Changed
- Renamed Client Portfolio §6 "Strategic Translation" → "Strategic Alignment"

### Migration Steps
1. Add §14 to `01_KERNEL/coach_operating_system.md` after §13
2. Update `03_DRIVERS/client_portfolio.md` §6 header from "Strategic Translation" to "Strategic Alignment"
```

**Why this matters:** Users upgrade via `version_upgrade` command, which reads CHANGELOG.md to apply updates incrementally while preserving user data. Missing changelog entries = broken upgrades.

**When releasing:** Move `[Unreleased]` content to new versioned section (e.g., `## [2026.03] - 2026-03-01`) and create empty `[Unreleased]` placeholder for next changes.

## Questions and collaboration

- Email: daviddgl@gmail.com
- LinkedIn: https://www.linkedin.com/in/daviddgl/
- GitHub: https://github.com/daviddgl
