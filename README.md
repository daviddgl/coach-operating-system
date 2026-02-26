# Coach Operating System

A portable decision-support system for independent career coaches.

Created by **David Garcia Lopez**.

> **Root folder purpose:** repository metadata + onboarding entry docs. The operating system content lives in `00_BOOT` to `06_BOARDROOM`.

- Contact: [CONTACT.md](CONTACT.md)
- Author details: [AUTHORS.md](AUTHORS.md)
- Contributing: [CONTRIBUTING.md](CONTRIBUTING.md)

> **Great coaching outcomes come from intentional preparation, not improvised intuition under client pressure.**

---

## Start Here

1. Read [00_BOOT/README.md](00_BOOT/README.md) for architecture and portability rules
2. **(Optional — Visual learner?)** See [ARCHITECTURE.md](ARCHITECTURE.md) for diagrams of how the OS layers connect, when each layer is consulted, and how data flows
3. Run guided setup with [SETUP_WIZARD.md](SETUP_WIZARD.md)
4. Load [00_BOOT/bootstrap_prompt.md](00_BOOT/bootstrap_prompt.md) into your AI custom instructions

---

## The Problem

Independent career coaches make high-stakes decisions in isolation — whether to take on a new client, how to handle a scope breach, how to structure a programme across a full portfolio. When you change your niche or business model, you rebuild everything from scratch.

## The Solution

**Coach Operating System** is a structured collection of markdown files organized as an operating system:

- **KERNEL** — Your portable coaching philosophy, decision protocols, and professional standards. Travels with you.
- **CONFIG** — Practice identity, mission, and strategy. Defines the environment you operate in.
- **DRIVERS** — Client portfolio and client cards. Swapped when your roster changes.
- **PROCESSES** — Current quarter's programme plan. Replaced quarterly.
- **COMMANDS** — Named operations that run via AI copilots (ChatGPT / Gemini / Claude).

The key idea: **separate the logic (how you coach) from the data (who you're coaching)**. The logic is portable. The data is replaceable.

---

## Quick Start

### Option A: AI-Guided Setup (Recommended — ~45 min)

1. Open ChatGPT (or Gemini / Claude)
2. Paste [SETUP_WIZARD.md](SETUP_WIZARD.md) as the first message
3. Upload all COS files from this repository
4. Type **`start setup`** — the AI interviews you and generates your completed files
5. Copy the generated files into your OS folder
6. Paste [00_BOOT/bootstrap_prompt.md](00_BOOT/bootstrap_prompt.md) into Custom Instructions (static — never changes)
7. Type `init_week` and you're live

### Option B: Manual Setup

1. Read [00_BOOT/README.md](00_BOOT/README.md) — architecture, portability contract, all protocols
2. Fill in the `[bracket]` placeholders in each file (guided by `<!-- comments -->`)
3. Upload all `.md` files to a **ChatGPT Project**, **Gemini Gem**, or **Claude Project**
4. Paste [00_BOOT/bootstrap_prompt.md](00_BOOT/bootstrap_prompt.md) into Custom Instructions (static — never changes)
5. Type `init_week` and you're live

---

## File Structure

```
Coach Operating System/
├── 00_BOOT/           # System manual & architecture
├── 01_KERNEL/         # Portable: coaching philosophy, decision protocol, Personal DNA
├── 02_CONFIG/         # Practice: mission, niche, service offerings, strategy
├── 03_DRIVERS/        # Portfolio: client roster, capacity contract, client cards
├── 04_PROCESSES/      # Quarter: programme plan, milestones, risks
├── 05_COMMANDS/       # Interface: commands + AI system prompt
└── 06_BOARDROOM/      # Advisory council: portable coaching-domain persona definitions
```

---

## Commands

| Category | Commands |
|----------|----------|
| **Lifecycle** | `init_week` · `init_day` · `shutdown_day` · `shutdown_week` |
| **People** | `prep_session [name]` · `onboard_client [name]` |
| **Execution** | `prep_program` · `capacity_check` · `retro` |
| **Decisions** | `client_request` · `boundary_check` · `quarterly_reset` |
| **Boardroom** | `boardroom [topic]` |
| **Maintenance** | `prep_refresh` · `version_upgrade [target_version]` |

Each command tells the AI which files to read, what to ask you, and what structured output to produce. See [05_COMMANDS/command_reference.md](05_COMMANDS/command_reference.md) for full definitions.

**File Freshness:** Commands check if files need refreshing based on their `Last Updated` date. When you see staleness warnings, run `prep_refresh` to refresh stale files and update their `Last Updated` headers automatically.

---

## Portability

Change niche? Change business model?

1. **Keep** `01_KERNEL/` + `05_COMMANDS/` + `06_BOARDROOM/` (your decision logic + advisory council)
2. **Update** `02_CONFIG/` (new practice identity and strategy)
3. **Replace** `03_DRIVERS/` + `04_PROCESSES/` (new client roster + programme plan)

Your coaching playbook travels with you.

---

## Upgrading

New COS version released? Upgrade while preserving your data:

1. **Download** new version template files
2. **Check** [CHANGELOG.md](CHANGELOG.md) to see what changed
3. **Run** `version_upgrade [target_version]` in your AI copilot
4. **Follow** the migration steps — AI preserves all your content
5. **Verify** with `init_week` command

Example: `version_upgrade 2026.08`

The upgrade command reads your current version from file headers, applies changes incrementally, and only asks about new/modified sections. Your existing data stays intact.

**Current Version:** Check any file header for `Version:` field.

---

## How to Customize

1. Start with `01_KERNEL/` — write your coaching philosophy, values, and professional standards
2. Fill in `01_KERNEL/personal_dna.md` — your identity, niche, goals, fears, patterns
3. Define your practice in `02_CONFIG/` — mission, niche, ideal client, service offerings
4. Build your client portfolio in `03_DRIVERS/` — roster, capacity contract, rituals
5. Create Client Cards for each active client
6. Write your quarterly programme plan in `04_PROCESSES/`
7. Upload everything to an AI copilot and test with `init_week`

Each file has instructions and placeholders marked with `[brackets]`.

---

## Documentation

All details live in [00_BOOT/README.md](00_BOOT/README.md):
- Architecture diagram
- Portability contract
- Logic vs. Data separation
- Key protocols (Rule Zero, Decision Protocol, Capacity Contract, Pressure Mode)
- AI platform setup and comparison
- Full command list with chaining

---

## License

MIT — see [LICENSE](LICENSE).
