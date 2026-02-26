# Coach Operating System (COS) — [Your Name]

> **Layer:** BOOT  
> **Owner:** [Your Name]  
> **Version:** 2026.02  
> **Last Updated:** [YYYY-MM-DD]  
> **Portable:** Yes

---

## What Is This?

This repository is a **Coach Operating System (COS)** — a decision-support framework that separates *how I think* (Kernel) from *where I practice* (Config/Drivers) and *what I'm doing right now* (Processes).

**It is NOT a decision-maker.** It calculates trade-offs and surfaces the right context. Humans make the call. See **Rule Zero** in the Decision Protocol.

Prefer guided onboarding? Start with the root [SETUP_WIZARD.md](../SETUP_WIZARD.md).

---

## Architecture

```
┌─────────────────────────────────────────────────────┐
│  05_COMMANDS (Interface — how to interact)          │
│  ┌───────────────────────────────────────────────┐  │
│  │ command_reference          → Named            │  │
│  │                              operations       │  │
│  │ system_prompt              → AI copilot       │  │
│  │                              instructions     │  │
│  └───────────────────────────────────────────────┘  │
├─────────────────────────────────────────────────────┤
│  06_BOARDROOM (Portable — travels with you)         │
│  ┌───────────────────────────────────────────────┐  │
│  │ boardroom                  → Virtual advisory │  │
│  │                              council personas │  │
│  └───────────────────────────────────────────────┘  │
├─────────────────────────────────────────────────────┤
│  01_KERNEL (Portable — travels with you)            │
│  ┌────────────────────────────────────────────────┐ │
│  │ COS                        → Philosophy,       │ │
│  │                              Standards, Values │ │
│  │ Decision Protocol          → Conflict          │ │
│  │                              Resolution Logic  │ │
│  │ personal_dna               → Identity, Goals,  │ │
│  │                              Constraints       │ │
│  └────────────────────────────────────────────────┘ │
├─────────────────────────────────────────────────────┤
│  02_CONFIG (Self-Authored — your practice)          │
│  ┌───────────────────────────────────────────────┐  │
│  │ practice_operating_system  → Mission & Values │  │
│  │ practice_strategy          → Current Goals    │  │
│  └───────────────────────────────────────────────┘  │
├─────────────────────────────────────────────────────┤
│  03_DRIVERS (Swappable — one per client portfolio)  │
│  ┌───────────────────────────────────────────────┐  │
│  │ client_portfolio           → Roster, Capacity,│  │
│  │                              Rituals, Network │  │
│  │ Client Cards               → Individual specs │  │
│  └───────────────────────────────────────────────┘  │
├─────────────────────────────────────────────────────┤
│  04_PROCESSES (Ephemeral — replaced quarterly)      │
│  ┌───────────────────────────────────────────────┐  │
│  │ quarterly_plan             → Current goals    │  │
│  └───────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────┘
```

## File Reference Guide

Quick lookup for all template files in your COS:

| File | Layer | Update Frequency | Purpose | Read By | Critical Sections |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [personal_dna.md](../01_KERNEL/personal_dna.md) | KERNEL | Once (then review quarterly) | Your coaching identity, values, strengths, pressure triggers | All commands | §1–§7 (Identity, Pressure Mode detection) |
| [coach_operating_system.md](../01_KERNEL/coach_operating_system.md) | KERNEL | Once (evolve over career) | Your personal playbook: decision protocols, coaching modes, capacity model | All commands | §1–§13 (Complete decision framework) |
| [coach_decision_protocol.md](../01_KERNEL/coach_decision_protocol.md) | KERNEL | Once (refresh annually) | Conflict resolution logic, Rule Zero, 3-gate hierarchy | `client_request`, `boundary_check` | §0–§4 (Rule Zero, hierarchy, interaction rules, execution loops, decision speed) |
| [practice_operating_system.md](../02_CONFIG/practice_operating_system.md) | CONFIG | When practice changes | Your practice mission, values, niche, service offerings | `init_week`, `prep_session`, `onboard_client` | §1–§3 (Identity, Values, Services) |
| [practice_strategy.md](../02_CONFIG/practice_strategy.md) | CONFIG | Quarterly refresh | Q[N] strategy, business OKRs, revenue/impact North Star | `prep_program`, `shutdown_week` | §1–§2 (Quarterly North Star, OKRs) |
| [client_portfolio.md](../03_DRIVERS/client_portfolio.md) | DRIVERS | Quarterly refresh | Active clients, capacity model, rituals, referral network | All commands | §1–§7 (Roster, Capacity Contract, Referral Network) |
| [client_card - [Name].md](../03_DRIVERS/client_card%20-%20%5BName%5D.md) | DRIVERS | Monthly refresh | Individual client profile, goals, session history, communication prefs | `prep_session`, `onboard_client` | §1–§3 (Career Profile, Communication, Goals) |
| [quarterly_plan.md](../04_PROCESSES/quarterly_plan.md) | PROCESSES | Quarterly | Current business & client goals, milestones, risks | `init_week`, `init_day`, `shutdown_week` | §1–§2 (Goals, Risks) |
| [boardroom.md](../06_BOARDROOM/boardroom.md) | BOARDROOM | Quarterly review | Virtual advisory council — persona definitions, working principles, coach context | `boardroom` | §1–§3 (Overview, Chair, Personas) |

**Legend:**
- **Layer** = Which OS folder the file lives in (see Architecture above)
- **Update Frequency** = How often to refresh this file's content
- **Read By** = Which commands query this file (see Command Reference for details)
- **Critical Sections** = Which parts of the file are essential for decision-making

**New Coach Workflow:**
1. Start with `personal_dna.md` — define who you are as a coach (one-time)
2. Fill in `practice_operating_system.md` + `practice_strategy.md` — define your practice (once, review quarterly)
3. Create `client_portfolio.md` + Client Cards — map your current roster (once per cohort, update monthly)
4. Build `quarterly_plan.md` — set your goals for the quarter (quarterly)
5. Run commands (e.g., `init_week`) — they read all files autonomously and produce recommendations

**Updating File Headers:**

When you run `prep_refresh` or `quarterly_reset` to refresh your files, update the `Last Updated` field:

```markdown
> **Last Updated:** [YYYY-MM-DD]
```

**Do NOT update** for minor edits (typos, small tweaks). Only update when doing a proper file refresh cycle (quarterly review or when `prep_refresh` flags files as stale).

**Version field:** Maintained by the framework, not by you. It reflects the COS template release version (e.g., `2026.02` for February 2026).

**Upgrading to New Versions:**

When a new COS version is released, you have two upgrade paths:

**Option A — Remote upgrade (recommended for Gem/GPT users):**
1. **Run** `version_upgrade --remote` in your AI copilot
2. The AI will browse the COS GitHub repository to fetch the latest CHANGELOG and changed template files
3. **Follow migration steps** — AI walks through each change, preserving your data
4. **Confirm bundle generation** — AI produces a complete `cos_compiled.md` you paste directly into your Gem/GPT knowledge file

**Option B — Manual upgrade:**
1. **Download new version files** from repository (or `git pull` if tracking)
2. **Check** [`CHANGELOG.md`](../CHANGELOG.md) for what changed between your version and target
3. **Run** `version_upgrade [target_version]` in your AI copilot (e.g., `version_upgrade 2026.08`)
4. **Follow migration steps** — The AI will walk through each change, preserving your existing data

## The Portability Contract

**If you change your client portfolio or practice context:**
1. `/01_KERNEL/` — **Keep.** This is who you are as a coach.
2. `/02_CONFIG/` — **Keep** (unless pivoting your practice entirely).
3. `/03_DRIVERS/` — **Archive and replace.** Install new Client Portfolio + Client Cards.
4. `/04_PROCESSES/` — **Delete and replace.** New quarterly plan for new context.
5. `/05_COMMANDS/` — **Keep.** Commands are portable; they adapt to any portfolio's data.
6. `/06_BOARDROOM/` — **Keep.** Your advisory council travels with you. Review personas quarterly.

## Logic vs. Data

| What | Where | Rule |
| :--- | :--- | :--- |
| **How we work** (Logic) | These Markdown files | Source of Truth for philosophy, protocols, and standards |
| **What we work on** (Data) | [Your CRM / scheduling tool] | Source of Truth for client status and session tracking |
| **What we plan** (Strategy) | [Your planning tool] | Source of Truth for business goal visualization |
| **What we know** (Knowledge) | [Your notes / coaching journal] | Source of Truth for session insights and decisions |
| **What we say** (Comms) | [Your email / messaging tool] | Ephemeral — must be committed to CRM or notes |

## Key Protocols

| Protocol | File | Purpose |
| :--- | :--- | :--- |
| **Commands** | Command Reference | Named operations — `init_week`, `prep_session`, `client_request`, etc. |
| **Rule Zero** | Decision Protocol §0 | Human override — when in doubt, talk face-to-face |
| **Capacity Contract** | COS §3 + Client Portfolio §4 | Protect coaching time from admin overhead |
| **Pressure Mode** | COS §12 | Self-management when stress compromises judgment |
| **Coaching Mode Selector** | COS §5 | Situational coaching style selector (default: Exploratory) |
| **The "No" Logic** | COS §3 | How to negotiate/decline requests that break the plan |

## How to Use This System

### Manual Usage (Read the files)
1. **Daily:** Use the Decision Protocol for client or business trade-offs. Check Pressure Mode indicators.
2. **Weekly:** Review Client Portfolio capacity against actual session load. Update practice status summary.
3. **Quarterly:** Replace Practice Strategy file. Update Client Portfolio Strategic Translation. Create new Quarterly Plan.
4. **On portfolio change:** Archive `/03_DRIVERS/` and `/04_PROCESSES/`. Create new Driver files.

### AI Copilot Integration (Recommended)

**Platform:** ChatGPT Project, Gemini Gem, or Claude Project

**Setup (5 minutes):**
1. **Upload all COS files** to your AI platform (or use the compiled bundle)
2. **Paste the Bootstrap Prompt:** Copy `00_BOOT/bootstrap_prompt.md` text into Custom Instructions
3. **Test:** Type `init_week` and verify the AI asks for your schedule and produces the structured output

**Bundled Upload (Optional consolidation):**

If you prefer a single consolidated file instead of managing individual COS files, use the bundle script:

```bash
scripts/bundle.sh
```

This generates a single `cos_compiled.md` file in `bundle/` containing all COS content. Upload this one file + paste `00_BOOT/bootstrap_prompt.md` into Custom Instructions. Same functionality, simpler knowledge management.

---

### Platform Comparison

| Platform | Knowledge Mechanism | Context Window | Session Persistence | Best For |
|----------|--------------------|--------------|--------------------|----------|
| **ChatGPT Projects** | Upload individual files to a Project | ~128k tokens | Good — Project maintains file memory across conversations | Coaches who want to work with individual files and use ChatGPT's reasoning strengths |
| **Gemini Gems** | Gem instructions + knowledge files | ~1M tokens | Good — Gem retains instructions and files | Coaches with large bundles; Gemini's long context fits the entire `cos_compiled.md` comfortably |
| **Claude Projects** | Upload files to a Project | ~200k tokens | Excellent — Project instructions + files persist cleanly | Coaches who value nuanced, long-form reasoning and structured output quality |

> **Recommendation:** Use Gemini Gem if you prefer the bundled (`cos_compiled.md`) approach. Use ChatGPT or Claude Projects if you prefer managing individual files. All three platforms work well — the OS is designed to be platform-agnostic.

---

### How to Customise

COS has three layers of customisation — from quick personal tweaks to full pratice overhauls:

**Layer 1 — Personalise your identity (30 minutes):**
Edit `01_KERNEL/personal_dna.md` and `01_KERNEL/coach_operating_system.md` to reflect your real coaching philosophy, communication style, and non-negotiable standards. This is the heart of the OS — the more specific and honest you are, the more useful every command becomes.

**Layer 2 — Define your practice context (1 hour):**
Edit `02_CONFIG/practice_operating_system.md` (mission, niche, revenue model) and `02_CONFIG/practice_strategy.md` (current quarter strategy, competitive positioning, growth goals). Update these whenever you pivot your practice direction.

**Layer 3 — Refresh your portfolio (20 minutes per client):**
Edit `03_DRIVERS/client_portfolio.md` (roster, capacity, referral network) and individual `client_card - [Name].md` files. These are the most frequently updated files — keep them current for `prep_session` and `onboard_client` to work well.

**Adding a command:**
Add a new entry to `05_COMMANDS/command_reference.md` using the existing command format (trigger name, category, reads from, asks for, queries, output, chains with). Then list the command in `05_COMMANDS/system_prompt.md` under the Commands section. Re-run `bundle.sh` to regenerate the bundle.

**Removing a command you don't use:**
Delete or comment out the command entry in `command_reference.md`. No other changes needed.

**Swapping boardroom personas:**
Edit `06_BOARDROOM/boardroom.md` — replace any of the 6 default personas with thinkers more relevant to your coaching domain. The `boardroom [topic]` command will automatically use your new personas.

---

*"This OS is a decision-support tool, not a decision-maker."*
