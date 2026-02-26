# Command Reference

> **Layer:** COMMANDS  
> **Owner:** [Your Name]  
> **Version:** 2026.02  
> **Last Updated:** [YYYY-MM-DD]  
> **Portable:** Yes

---

**Purpose:** This file defines the Coach Operating System (COS) command layer — named operations that an AI copilot executes using the OS files as context.

**How to use:** Type the command name (e.g., `init_week`) in your AI conversation. The AI reads this reference, loads the specified OS files, asks for missing inputs, and produces the structured output.

---

## Command Categories

1. **Lifecycle** — Daily and weekly bookends (init/shutdown cycles)
2. **People** — Client interactions (session prep, onboarding)
3. **Execution** — Program planning and capacity management
4. **Decision Support** — New requests, boundary checks, and boardroom sessions
5. **Maintenance** — System refresh and version upgrades

---

## 📋 LIFECYCLE COMMANDS

### `init_week`

**Trigger:** Monday morning  
**Purpose:** Prepare for the week ahead

**OS Files to Read:**
- `04_PROCESSES/quarterly_plan.md` — §1 Plan (filter by this week's dates), §2 Risks
- `03_DRIVERS/client_portfolio.md` — §2 Roster, §4 Capacity Contract, §5 Rituals, §6 Strategic Translation, §7 Referral Network
- `02_CONFIG/practice_strategy.md` — §1 North Star
- `01_KERNEL/coach_operating_system.md` — §8 Managing Stakeholders, §9 Success Metrics, §12 Pressure Mode
- `01_KERNEL/personal_dna.md` — Goals
- **All client cards** — §3 Coaching Goals

**Ask User For:**
- This week's availability (session windows + no-go blocks)
- Carryover from last `shutdown_week`
- Known blockers / priority changes

**Output Format:**
```markdown
# Week of [Date]

## Priorities (Ranked)
1. [...]
2. [...]
3. [...]

## Per-Client Focus
- **[Client Name]:** [Session objective] (Goal: [from Client Card])

## Risk Watchlist
- [...]

## Rituals This Week
- [...]

## Capacity Pre-Check
- **Contracted:** [X/Y/Z from Client Portfolio §4]
- **Watch for:** [constraints]

## Pressure Mode Baseline
- [ ] Stress indicators self-check
```

---

### `init_day`

**Trigger:** Each morning  
**Purpose:** Prepare for today

**OS Files to Read:**
- `04_PROCESSES/quarterly_plan.md` — today's milestones
- `03_DRIVERS/client_portfolio.md` — §5 Rituals
- `01_KERNEL/coach_operating_system.md` — §4 Communication Protocol, §12 Pressure Mode
- `01_KERNEL/personal_dna.md` — Constraints & Fears

**Ask User For:**
- Today's calendar
- Overnight updates
- Carryover from yesterday's `shutdown_day`

**Output Format:**
```markdown
# [Day], [Date]

## Top 3 Priorities
1. [...]
2. [...]
3. [...]

## Pressure Mode Self-Assessment
- [ ] Over-scheduling?
- [ ] Avoiding hard feedback?
- [ ] Skipping prep?

## Session / Meeting Audit
| Item | Outcome clear? | Keep / Reschedule |
|------|----------------|-------------------|

## Carryover
- [...]
```

---

### `shutdown_day`

**Trigger:** End of day  
**Purpose:** Wrap up and prepare for tomorrow

**OS Files to Read:**
- `01_KERNEL/coach_operating_system.md` — §4 Output Rule, §9 Success Metrics, §12 Recovery
- `01_KERNEL/personal_dna.md` — Constraints & Fears

**Ask User For:**
- Done vs planned
- Open threads
- Any sessions missing action items

**Output Format:**
```markdown
# End of Day — [Date]

## Done / Not Done / Blocked
- ✅ Done: [...]
- ⏸️ Carryover: [...]
- 🚫 Blocked: [...]

## Session Output Audit
- [Client]: Key Insight ✅ | Actions ✅

## Pressure Mode Check
- Decisions made under pressure: [...]

## Stop Signal
- [ ] No urgent items pending → close workday
```

---

### `shutdown_week`

**Trigger:** Friday  
**Purpose:** Close week and prepare next week

**OS Files to Read:**
- `01_KERNEL/coach_operating_system.md` — §8, §9, §12
- `03_DRIVERS/client_portfolio.md` — §4 Capacity Contract
- `04_PROCESSES/quarterly_plan.md` — §1 and §2
- `02_CONFIG/practice_strategy.md` — §1 North Star

**Ask User For:**
- Coaching/admin/biz-dev time split this week
- Client progress highlights
- What from `init_week` was completed

**Output Format:**
```markdown
# Week of [Date] — CLOSED

## Weekly Summary
- Wins: [...]
- Risks: [...]
- Ask: [...]

## Capacity Report
- Coaching: [X]%
- Biz Dev: [Y]%
- Admin/CPD: [Z]%
- Contract status: [Within / Breached]

## North Star Contribution
- [...]

## Carryover for Monday
1. [...]
2. [...]
```

---

## 👥 PEOPLE COMMANDS

### `prep_session [name]`

**Trigger:** Before client session  
**Purpose:** Prepare personalised session agenda

**OS Files to Read:**
- `03_DRIVERS/client_card - [name].md` — §1, §2, §3
- `03_DRIVERS/client_portfolio.md` — §2 Roster
- `04_PROCESSES/quarterly_plan.md` — relevant milestones
- `01_KERNEL/coach_operating_system.md` — §5 Coaching Mode, §6 Feedback Loop, §2 Expectations

**Ask User For:**
- Previous session notes + action item status
- Current blocker / context update
- Any difficult feedback needed

**Output Format:**
```markdown
# Session Prep — [Name]

## Context
- Current role: [...]
- Primary goal: [...]
- Last actions: [...]

## Recommended Coaching Mode
- [Exploratory / Directive / Accountability / Supportive / Facilitative]
- Why: [...]

## Agenda
1. Goal check-in
2. Core challenge
3. Feedback / reframe
4. Commitments before next session

## Coach Self-Check
- [ ] Avoiding difficult feedback?
```

---

### `onboard_client [name]`

**Trigger:** New client starts  
**Purpose:** Generate onboarding package and draft Client Card

**OS Files to Read:**
- `03_DRIVERS/client_card - [Name].md`
- `03_DRIVERS/client_portfolio.md`
- `01_KERNEL/coach_operating_system.md` — §1, §2, §6, §10
- `02_CONFIG/practice_operating_system.md`
- `02_CONFIG/practice_strategy.md`

**Ask User For:**
- Name, timezone, current role, target direction
- Intake highlights
- Communication preferences
- First-month goals

**Output Format:**
```markdown
# Onboarding — [Name]

## Draft Client Card
[Filled with provided intake data]

## Welcome Brief
- What coaching includes
- Expectations and boundaries
- Session cadence and tools

## First 30 Days
- Session 1 focus
- Session 2 focus
- Initial milestones
```

---

## ⚙️ EXECUTION COMMANDS

### `prep_program`

**Trigger:** Before planning period  
**Purpose:** Prepare next execution cycle using capacity + strategy

**OS Files to Read:**
- `04_PROCESSES/quarterly_plan.md`
- `03_DRIVERS/client_portfolio.md` — §2, §4, §6, §7
- `02_CONFIG/practice_strategy.md`
- `01_KERNEL/coach_decision_protocol.md` — §1, §3
- `01_KERNEL/coach_operating_system.md` — §10
- client cards relevant to active programs

**Ask User For:**
- Candidate initiatives
- Availability constraints
- Carryover commitments

**Output Format:**
```markdown
# Program Planning — [Period]

## Capacity Calculation
- Available hours: [...]
- Reserved by contract: [...]

## Suggested Priorities
| Initiative | Owner | Effort | Why now |
|------------|-------|--------|---------|

## Risk Flags
- [...]

## Quality Safeguards
- [...]
```

---

### `capacity_check`

**Trigger:** Work feels overloaded  
**Purpose:** Check contracted ratio and trigger circuit breaker if needed

**OS Files to Read:**
- `03_DRIVERS/client_portfolio.md` — §4, §2
- `01_KERNEL/coach_operating_system.md` — §3, §8
- `04_PROCESSES/quarterly_plan.md`
- `01_KERNEL/coach_decision_protocol.md` — Rule B

**Ask User For:**
- Current period split (coaching/biz dev/admin)
- Previous period split
- Major incidents consuming time

**Output Format:**
```markdown
# Capacity Check — [Date]

## Current Ratio
- Coaching: [X]%
- Biz Dev: [Y]%
- Admin/CPD: [Z]%
- Status: [Within / Elevated / Breached]

## Trend
- Previous: [...]
- Current: [...]
- Circuit Breaker: [OK / Triggered]

## Recommended Action
- Pause: [...]
- Protect: [...]
```

---

### `retro`

**Trigger:** Weekly or biweekly review  
**Purpose:** Reflect and improve coaching + business execution

**OS Files to Read:**
- `03_DRIVERS/client_portfolio.md` — §5, §4, §6
- `04_PROCESSES/quarterly_plan.md`
- `01_KERNEL/coach_operating_system.md` — §6, §5, §7, §1

**Ask User For:**
- What went well
- What went poorly
- Action items from prior retro

**Output Format:**
```markdown
# Retro — [Period]

## Wins
- [...]

## Friction
- [...]

## Capacity Learning
- [...]

## Experiments Next Period
- [...]
```

---

## 🎯 DECISION SUPPORT COMMANDS

### `client_request [description]`

**Trigger:** New client / scope request / referral arrives  
**Purpose:** Run 3-gate decision protocol and recommend ACCEPT / NEGOTIATE / DECLINE

**OS Files to Read:**
- `01_KERNEL/coach_decision_protocol.md` — full
- `03_DRIVERS/client_portfolio.md` — §2, §4, §7
- `02_CONFIG/practice_strategy.md` — §1
- `04_PROCESSES/quarterly_plan.md` — displacement check
- `01_KERNEL/coach_operating_system.md` — §3 No Logic
- relevant `client_card` files

**Ask User For:**
- Request details
- Who requests it
- Estimated effort
- Current capacity utilization
- Reversible or irreversible

**Output Format:**
```markdown
# Decision Protocol — Client Request

## Request Summary
- [...]

## Gate 1: Capacity
- Result: [PASS / FAIL]

## Gate 2: Practice Strategy
- Result: [ALIGNED / NEUTRAL / MISALIGNED]

## Gate 3: Client Fit
- Result: [...]

## Recommendation
- [ACCEPT / NEGOTIATE / DECLINE]
- Script: [...]

## Rule Zero Check
- [ ] Need synchronous conversation?
```

---

### `boundary_check [topic]`

**Trigger:** Possible scope breach, ethical concern, or role confusion  
**Purpose:** Produce a boundary-safe next action

**OS Files to Read:**
- `01_KERNEL/coach_operating_system.md` — §10, §12, §8
- `01_KERNEL/coach_decision_protocol.md` — §0, §1, §4
- `03_DRIVERS/client_portfolio.md` — context
- `01_KERNEL/personal_dna.md` — avoidance patterns

**Ask User For:**
- Situation summary
- What boundary feels at risk
- Stakeholders involved
- Impact if unchanged

**Output Format:**
```markdown
# Boundary Check — [Topic]

## Situation
- [...]

## Boundary at Risk
- [...]

## Recommended Response
- Option A (preferred): [...]
- Option B: [...]

## Referral / Escalation Path
- [...]

## Rule Zero
- [ ] Requires direct conversation now
```

---

### `quarterly_reset`

**Trigger:** End/start of quarter  
**Purpose:** Refresh the full system

**OS Files to Read:**
- All files + `00_BOOT/README.md`

**Ask User For:**
- Previous quarter outcomes
- New quarter strategy
- Client roster changes

**Output Format:**
```markdown
# Quarterly Reset — [Qx → Qy]

## Quarter Review
- [...]

## File Update Checklist
- Kernel: review/update
- Config: refresh strategy
- Drivers: roster + cards update
- Processes: replace quarterly plan

## Diff Summary
- [...]
```

---

## 🔧 MAINTENANCE COMMANDS

### `prep_refresh`

**Trigger:** Freshness warning or monthly maintenance  
**Purpose:** Audit stale files and refresh only necessary sections

### `version_upgrade`

**Trigger:** New COS release  
**Purpose:** Upgrade framework while preserving user data; supports local and `--remote`

> Keep `00_BOOT/bootstrap_prompt.md` static. Replace knowledge files or regenerate `bundle/cos_compiled.md` after upgrade.

---

## 🎙️ BOARDROOM COMMAND

### `boardroom [topic]`

**Trigger:** High-stakes uncertainty  
**Purpose:** Simulate selected advisory personas and synthesise concrete next action

**OS Files to Read:**
- `06_BOARDROOM/boardroom.md`
- `01_KERNEL/personal_dna.md`
- `01_KERNEL/coach_operating_system.md` — §12

**Ask User For:**
- Topic context (1–3 sentences)
- Depth: quick (3 personas) or full (4–5 personas)

**Output Format:**
```markdown
# Boardroom Session — [Topic]

## Personas Activated
- [...]

## Persona Perspectives
- [...]

## Integrated Synthesis
- Agreements
- Tensions
- Recommended next action

> ⚠️ Rule Zero: Boardroom advises. You decide.
```
