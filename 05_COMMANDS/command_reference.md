# Command Reference

> **Layer:** COMMANDS  
> **Owner:** David Garcia  
> **Version:** 2026.02  
> **Last Updated:** 2026-03-01  
> **Portable:** Yes — command logic is context-independent

---

**Purpose:** This file defines the Coach Operating System (COS) command layer — named operations that an AI copilot executes using OS files as context.

**How to use:** Type the command name (e.g., `init_week`) in your AI conversation. The AI reads this reference, loads the specified OS files, asks for missing inputs, and produces the structured output.

---

## Command Categories

1. **Lifecycle** — Daily and weekly bookends (init/shutdown cycles)
2. **People** — Client interactions (session prep, onboarding)
3. **Execution** — Program planning and capacity management
4. **Decision Support** — Incoming requests, boundary checks, and boardroom sessions
5. **Maintenance** — System refresh and version upgrades

---

## File Freshness Legend

| Symbol | Meaning |
|--------|---------|
| 🔴 | 0-day grace — must be current before command runs |
| 🟡 | 3–7 day grace — warn if stale, proceed with caution |
| 🟢 | 30-day grace — reference-only, low urgency |

---

## Command Chaining Overview

```
Monday:
  init_week → [weekly plan stored]
    Each day:
      init_day → [daily priorities]
      (prep_session before each session)
      shutdown_day → [carryover captured]
  Friday:
    shutdown_week → [compares to init_week output]

Quarter end:
  retro → quarterly_reset → prep_program

New request:
  client_request → [accept/negotiate/decline]
  (if uncertain: boardroom first)

Scope/ethics concern:
  boundary_check → [action or escalation]

Maintenance:
  prep_refresh → (then resume normal commands)
  version_upgrade → init_week (verify)
```

---

## Usage Instructions

1. **Upload all COS files** (or `cos_compiled.md` bundle) to your AI platform knowledge base
2. **Paste `00_BOOT/bootstrap_prompt.md`** into Custom Instructions / Gem instructions / Project instructions — do this once; it never changes
3. **Type a command name** in the conversation (e.g., `init_week`)
4. **AI will:** read this reference → load OS files → run freshness checks → ask for inputs → produce structured output
5. **Keep outputs in session** — commands chain within a conversation; `shutdown_week` can reference `init_week` output from the same session

---

## 📋 LIFECYCLE COMMANDS

### `init_week`

**Trigger:** Monday morning  
**Purpose:** Prepare for the week ahead — priorities, per-client focus, capacity pre-check, and Pressure Mode baseline

**OS Files to Read:**
- `04_PROCESSES/quarterly_plan.md` — §1 Plan (filter by this week's dates), §2 Risks
- `03_DRIVERS/client_portfolio.md` — §2 Roster, §4 Capacity Contract, §5 Rituals, §6 Strategic Translation, §7 Referral Network
- `02_CONFIG/practice_strategy.md` — §1 North Star
- `01_KERNEL/coach_operating_system.md` — §8 Managing Stakeholders, §9 Success Metrics, §12 Pressure Mode
- `01_KERNEL/personal_dna.md` — Goals
- **All client cards** — §3 Coaching Goals

**Ask User For:**
- This week's availability (session windows + no-go blocks)
- Carryover from last `shutdown_week` (or describe what's carrying over manually)
- Any known blockers, priority changes, or new requests

**Critical Files for Freshness:**
- 🔴 `quarterly_plan.md` — 0-day grace (weekly planning needs current milestones)
- 🟡 `client_portfolio.md` — 3-day grace (roster + capacity contract)
- 🟡 `practice_strategy.md` — 3-day grace (North Star alignment)
- 🟢 `client_card - [Name].md` — 7-day grace for each active client

**Output Format:**
```
# Week of [Date]

## Priorities (Ranked)
1. [Highest-leverage coaching or business outcome this week]
2. [...]
3. [...]

## Per-Client Focus
| Client | Session? | This Week's Focus | Goal (from Card) |
|--------|----------|------------------|-----------------|
| [Name] | [Y / N] | [Specific objective] | [From §3] |

## Risk Watchlist
- [From quarterly_plan §2 — anything live this week]

## Rituals This Week
- [From Client Portfolio §5 — check-ins, group calls, etc.]

## Capacity Pre-Check
- **Contracted ratio:** [Coaching X% / Biz Dev Y% / Admin Z% — from Client Portfolio §4]
- **Sessions scheduled:** [Count + hours]
- **Biz dev time allocated:** [Hours]
- **Watch for:** [Overload risk, thin buffer]

## Pressure Mode Baseline
- [ ] Pre-week stress level: [Low / Moderate / High]
- [ ] Any Pressure Mode indicators active? (from COS §12)
- [ ] Proactive mitigation: [If yes — what to simplify]
```

**Chains With:** `init_day` (daily execution), `shutdown_week` (end-of-week reference comparison)

---

### `init_day`

**Trigger:** Each morning  
**Purpose:** Prepare for today — calibrate priorities, review any sessions, and set Pressure Mode check

**OS Files to Read:**
- `04_PROCESSES/quarterly_plan.md` — today's milestones
- `03_DRIVERS/client_portfolio.md` — §5 Rituals
- `01_KERNEL/coach_operating_system.md` — §4 Communication Protocol, §12 Pressure Mode
- `01_KERNEL/personal_dna.md` — Constraints & Fears

**Ask User For:**
- Today's calendar (sessions, calls, blocks)
- Any overnight updates (emails, messages, client context changes)
- Carryover from yesterday's `shutdown_day`

**Critical Files for Freshness:**
- 🔴 `quarterly_plan.md` — 0-day grace (daily milestones)
- 🟢 `coach_operating_system.md` — 30-day grace (protocol reference)

**Output Format:**
```
# [Day], [Date]

## Top 3 Priorities
1. [Clear outcome, not just activity]
2. [...]
3. [...]

## Sessions Today
| Client/Meeting | Time | Prep needed? | Source |
|---------------|------|-------------|--------|
| [Name] | [HH:MM] | [Y / N — use prep_session if Y] | [Session / call] |

## Pressure Mode Self-Assessment
- [ ] Over-scheduling vs. available energy?
- [ ] Avoiding a hard conversation or difficult feedback?
- [ ] Skipping prep for a session booked later?
- [ ] Three or more Pressure Mode indicators active? → Simplify today's plan

## Carryover from Yesterday
- [From shutdown_day output — specific items rolling forward]

## End-of-Day Check (Preview)
- Tonight's shutdown_day will check: [Outstanding threads from this plan]
```

**Chains With:** `shutdown_day` (closes the day), `prep_session [name]` (before any session today)

---

### `shutdown_day`

**Trigger:** End of day  
**Purpose:** Wrap up and prepare tomorrow — done/not-done, session output audit, Pressure Mode debrief

**OS Files to Read:**
- `01_KERNEL/coach_operating_system.md` — §4 Output Rule, §9 Success Metrics, §12 Recovery
- `01_KERNEL/personal_dna.md` — Constraints & Fears

**Ask User For:**
- Done vs planned (today's top 3 outcomes)
- Open threads and outstanding client commitments
- Any sessions missing key outputs (insight, action item, follow-up)
- Pressure Mode incidents (decisions made under stress today)

**Critical Files for Freshness:**
- 🟢 `coach_operating_system.md` — 30-day grace (output + recovery protocols)

**Output Format:**
```
# End of Day — [Date]

## Done / Not Done / Blocked
- ✅ Done: [List completed items]
- ⏸️ Carryover to tomorrow: [Specific items — why not done?]
- 🚫 Blocked: [What's stuck and who/what unblocks it]

## Session Output Audit
| Client | Key Insight Captured? | Action Items Agreed? | Follow-Up Needed? |
|--------|----------------------|---------------------|------------------|
| [Name] | ✅ / ❌ | ✅ / ❌ | [Y — what?] |

## Pressure Mode Debrief
- Decisions made under pressure today: [List or 'none']
- Recovery actions taken: [Rest, delegation, postponed item]
- Pattern note: [Anything to log for COS §12 review]

## Stop Signal
- [ ] All session outputs captured
- [ ] Carryover list is specific + actionable (not vague)
- [ ] No urgent items blocking tomorrow → close workday
```

**Chains With:** `init_day` (next morning uses this carryover)

---

### `shutdown_week`

**Trigger:** Friday afternoon or end of working week  
**Purpose:** Close the week — capacity report, North Star contribution, and clear carryover for Monday

**OS Files to Read:**
- `01_KERNEL/coach_operating_system.md` — §8 Managing Stakeholders, §9 Success Metrics, §12 Pressure Mode
- `03_DRIVERS/client_portfolio.md` — §4 Capacity Contract
- `04_PROCESSES/quarterly_plan.md` — §1 Plan, §2 Risks
- `02_CONFIG/practice_strategy.md` — §1 North Star

**Ask User For:**
- Actual coaching/biz dev/admin/CPD time split this week
- Client progress highlights (wins or concerns per client)
- What from `init_week` priorities was completed vs deferred
- Any new risks or requests to carry forward

**Critical Files for Freshness:**
- 🟡 `client_portfolio.md` — 3-day grace (capacity contract to compare against)
- 🟡 `practice_strategy.md` — 3-day grace (North Star comparison)

**Output Format:**
```
# Week of [Date] — CLOSED

## Weekly Summary
- **Wins:** [Client breakthroughs, business milestones, effective sessions]
- **Friction:** [What slowed you down, recurring issues]
- **Asks for next week:** [Requests received that need a decision]

## Capacity Report
| Category | Contracted | Actual | Status |
|----------|-----------|--------|--------|
| Coaching | [X]% | [X]% | ✅ / ⚠️ |
| Biz Dev | [Y]% | [Y]% | ✅ / ⚠️ |
| Admin/CPD | [Z]% | [Z]% | ✅ / ⚠️ |

- **Circuit Breaker:** [Not triggered / ⚠️ Triggered — 2nd consecutive overrun]

## North Star Contribution
- **This week contributed to North Star how?** [From practice_strategy §1]
- **Any drift detected?** [Yes — adjust Monday / No]

## Pressure Mode Week Review
- Indicators logged this week: [List or 'clear']
- Pattern trend: [Stable / Building / Resolved]

## Carryover for Monday
1. [Most important item — specific action]
2. [...]
3. [...]
```

**Chains With:** `init_week` (Monday reads this carryover)

---

## 👥 PEOPLE COMMANDS

### `prep_session [name]`

**Trigger:** Before any client session  
**Purpose:** Prepare a personalised session agenda — coaching mode, focus, and self-check

**OS Files to Read:**
- `03_DRIVERS/client_card - [name].md` — §1 Context, §2 Communication Preferences, §3 Coaching Goals
- `03_DRIVERS/client_portfolio.md` — §2 Roster (session cadence, risk flags)
- `04_PROCESSES/quarterly_plan.md` — milestones relevant to this client
- `01_KERNEL/coach_operating_system.md` — §5 Coaching Mode, §6 Feedback Loop, §2 Expectations

**Ask User For:**
- Previous session notes (key insights, actions agreed, what happened since)
- Current blockers or context updates from the client
- Any difficult feedback you've been holding back

**Critical Files for Freshness:**
- 🔴 `client_card - [name].md` — 0-day grace (current goals and context required)
- 🟡 `client_portfolio.md` — 3-day grace (session cadence, risk status)
- 🟡 `quarterly_plan.md` — 3-day grace (relevant milestones)

**Output Format:**
```
# Session Prep — [Name]

## Client Context
- **Current role/situation:** [From Client Card §1]
- **Primary coaching goal:** [From §3]
- **Last session date:** [Date]
- **Last session actions — status?**
  - [Action 1]: ✅ Done / ⏸️ In progress / ❌ Dropped
  - [Action 2]: [...]

## Recommended Coaching Mode
**Mode:** [Exploratory / Directive / Accountability / Supportive / Facilitative]
**Why this mode:** [Rationale from COS §5 and current client state]

## Session Agenda
1. **Check-in** (5 min) — energy, mindset, since-last-session update
2. **Goal progress** (10 min) — which coaching goal to focus on today
3. **Core challenge** (20 min) — go deep on the presenting issue
4. **Feedback / reframe** (10 min) — honest observation or pattern flag
5. **Commitments** (5 min) — 1–3 specific actions before next session

## Difficult Feedback (If Any)
> [Pre-drafted feedback using COS §6 Feedback Loop protocol]

## Coach Self-Check
- [ ] Am I avoiding giving difficult feedback to keep the client comfortable?
- [ ] Are the session goals still aligned to their primary coaching goal in §3?
- [ ] Is the client in an emotionally unsafe state requiring a mode shift first?

## Post-Session Note Prompt
Log in Notion/Google Docs: key insight, committed actions, pattern observed
```

**Chains With:** `shutdown_day` (session output captured there), `client_request` (if the session surfaces a scope change)

---

### `onboard_client [name]`

**Trigger:** New client confirmed — before or at start of first session  
**Purpose:** Generate onboarding package and draft Client Card

**OS Files to Read:**
- `03_DRIVERS/client_card - [Name].md` — template to populate
- `03_DRIVERS/client_portfolio.md` — §2 Roster, §4 Capacity Contract
- `01_KERNEL/coach_operating_system.md` — §1 Core Values, §2 Expectations, §6 Feedback Loop, §10 Engagement Framework
- `02_CONFIG/practice_operating_system.md` — service model, session cadence
- `02_CONFIG/practice_strategy.md` — niche alignment check

**Ask User For:**
- Full name, timezone, current role, organisation (if relevant)
- Intake highlights: why they came to coaching, what they want to be different
- Career stage and relevant background
- Communication preferences (depth, frequency, directness level)
- First-month goals (what would make the first 30 days a success for them)
- Any known constraints (budget, time, emotional bandwidth)

**Critical Files for Freshness:**
- 🟡 `client_portfolio.md` — 3-day grace (capacity check before adding to roster)
- 🟢 `coach_operating_system.md` — 30-day grace (engagement framework reference)
- 🟢 `practice_operating_system.md` — 30-day grace (service model)

**Output Format:**
```
# Onboarding — [Name]

## Capacity Check
- **Current active clients:** [X] of [Y max from Portfolio §4]
- **Capacity to take on:** ✅ Yes / ⚠️ At limit / ❌ Over capacity → discuss scope

## Draft Client Card
[Use client_card template, populated with intake data above as starting point]

## Welcome Brief (Email-Ready)
---
Hi [Name],

Welcome — I'm looking forward to working with you.

**What coaching with me includes:**
- [From COS §2 Expectations]

**What I'll need from you:**
- [Active participation, honest updates, completing committed actions]

**Session cadence:** [From practice_operating_system]
**Between sessions:** [Communication protocol — from COS §4]
**Tools we'll use:** [Notion / Google Docs / calendar system]

First session will focus on [First-month goal]. See you [date/time].

[Name]
---

## First 30 Days Plan
| Session | Focus | Expected Outcome |
|---------|-------|-----------------|
| Session 1 | Goal clarification and baseline | Clear primary coaching goal documented in Client Card |
| Session 2 | First obstacle / coaching mode calibration | One concrete action in motion |
| Session 3 | Progress check + feedback loop | Pattern identified; coaching rhythm established |

## Coach Notes
- Pre-read intake data on day of first session
- Add client to Client Portfolio §2 Roster after this command completes
- Set up session note folder in Notion/Google Docs
```

**Chains With:** `prep_session [name]` (first session), `capacity_check` (if portfolio feels stretched)

---

## ⚙️ EXECUTION COMMANDS

### `prep_program`

**Trigger:** Before a planning period (start of quarter or mid-quarter cycle)  
**Purpose:** Build next execution cycle — capacity-gated, strategy-aligned, quality-safeguarded

**OS Files to Read:**
- `04_PROCESSES/quarterly_plan.md` — §1 Plan, §2 Risks
- `03_DRIVERS/client_portfolio.md` — §2 Roster, §4 Capacity Contract, §6 Strategic Translation, §7 Referral Network
- `02_CONFIG/practice_strategy.md` — §1 North Star, §2 Quarterly Focus
- `01_KERNEL/coach_decision_protocol.md` — §1 Hierarchy of Precedence, §3 New Request Loop
- `01_KERNEL/coach_operating_system.md` — §10 Engagement Framework
- **All active client cards** — §3 Coaching Goals (for milestone alignment)

**Ask User For:**
- Candidate initiatives for this cycle (list anything being considered)
- Availability constraints (travel, CPD commitments, leave)
- Carryover from previous cycle that's still live
- Revenue targets or enrollment goals for this period

**Critical Files for Freshness:**
- 🔴 `quarterly_plan.md` — 0-day grace (current milestones required before replanning)
- 🟡 `client_portfolio.md` — 3-day grace (capacity and roster accuracy)
- 🟡 `practice_strategy.md` — 3-day grace (North Star alignment)

**Output Format:**
```
# Program Planning — [Period]

## Capacity Calculation
| Category | Contracted | Available hours/week | Over cycle [X weeks] |
|----------|-----------|---------------------|----------------------|
| Coaching | [X]% | [Hrs] | [Total hrs] |
| Biz Dev | [Y]% | [Hrs] | [Total hrs] |
| Admin/CPD | [Z]% | [Hrs] | [Total hrs] |

**Reserved commitments:** [Existing client programs, retainers]
**Available for new initiatives:** [Remaining hours]

## Suggested Priorities
| Initiative | Owner / Client | Effort | North Star Alignment | Priority |
|------------|---------------|--------|---------------------|----------|
| [Initiative 1] | [Coach / Client] | [Days/hrs] | [Aligned / Neutral] | H/M/L |

## Risk Flags
- [From quarterly_plan §2 — what's already at risk?]
- [New risks from this planning horizon]

## Quality Safeguards
- [From COS §10 Engagement Framework — standards that apply to each initiative]
- Milestone review scheduled: [Date]

## Dependency Map
- [Item A] requires [Item B] to be resolved first
- [Client C] program gates on [milestone]
```

**Chains With:** `capacity_check` (sanity check before committing), `quarterly_reset` (full reset uses this as a template)

---

### `capacity_check`

**Trigger:** Any time coaching, biz dev, or admin work feels overwhelming or unbalanced  
**Purpose:** Calculate current ratio and trigger circuit breaker if contract is breached

**OS Files to Read:**
- `03_DRIVERS/client_portfolio.md` — §4 Capacity Contract (ratio + circuit breaker thresholds), §2 Roster (individual client loads)
- `01_KERNEL/coach_operating_system.md` — §3 Capacity Philosophy, §8 Managing Stakeholders
- `04_PROCESSES/quarterly_plan.md` — §1 Roadmap (what's at risk if capacity is pulled)
- `01_KERNEL/coach_decision_protocol.md` — Rule B (Conflict Function)

**Ask User For:**
- Current period breakdown (hours or % for: coaching / biz dev / admin / CPD)
- Previous period breakdown (for trend analysis)
- Any incidents or emergency work consuming significant time this period

**Critical Files for Freshness:**
- 🟡 `client_portfolio.md` — 3-day grace (Capacity Contract + Roster accuracy)
- 🔴 `quarterly_plan.md` — 0-day grace (what's at risk needs to be current)

**Output Format:**
```
# Capacity Check — [Date]

## Current Ratio
| Category | Contracted | Actual | Status |
|----------|-----------|--------|--------|
| Coaching | [X]% | [X]% | ✅ / ⚠️ |
| Biz Dev | [Y]% | [Y]% | ✅ / ⚠️ |
| Admin/CPD | [Z]% | [Z]% | ✅ / ⚠️ |

**Overall:** [Within contract / ⚠️ Elevated ops / 🚨 Breached]

## Trend Analysis
- **Previous period:** [Breakdown]
- **This period:** [Breakdown]
- **Circuit Breaker:** [OK / ⚠️ TRIGGERED — 2 consecutive periods over contract]

## Bottleneck Analysis
- [Which category is consuming excess capacity and why?]
- [Root cause if identifiable]

## If Circuit Breaker Triggered

### Recommended Action
**Pause:** [Lowest-priority current initiative from quarterly_plan §1]
**Reason:** Address root cause before adding capacity back
**Root cause:** [Diagnosis from current data]

### Pre-Filled Client Communication (If Needed)
[From COS §3 and §8 — populated with current numbers and suggested framing]

### Escalation (If Needed)
[If capacity breach is caused by external factors — communication template using COS §8 Managing Stakeholders]
```

**Chains With:** `client_request` (capacity gate), `prep_program` (planning uses this baseline), `boundary_check` (if overload relates to scope issues)

---

### `retro`

**Trigger:** Weekly, biweekly, or per-quarter cadence  
**Purpose:** Structured reflection on coaching effectiveness, capacity, and practice execution

**OS Files to Read:**
- `03_DRIVERS/client_portfolio.md` — §5 Rituals (retro format), §4 Capacity Contract, §6 Strategic Translation
- `04_PROCESSES/quarterly_plan.md` — §1 Plan (planned vs actual), §2 Risks
- `01_KERNEL/coach_operating_system.md` — §6 Feedback Loop, §5 Coaching Mode, §7 Failure Protocol, §1 Core Values

**Ask User For:**
- Period metrics (sessions delivered, action item completion rates, client feedback highlights)
- What went well (specific examples — a session that landed, a technique that worked)
- What went poorly (specific examples — stuck clients, avoided conversations, admin overwhelm)
- Status of each previous retro action item (done / in progress / dropped)
- Any client patterns that are emerging across the roster

**Critical Files for Freshness:**
- 🔴 `quarterly_plan.md` — 0-day grace (planned vs actual is the anchor)
- 🟡 `client_portfolio.md` — 3-day grace (capacity and client context)

**Output Format:**
```
# Retro — [Period]

## Ground Rules (Reminder)
- Be honest about what didn't work — the retro protects the practice
- One concrete improvement per category
- [Practice-specific principles from Client Portfolio §3]

## Metrics Summary
| Metric | Target | Actual |
|--------|--------|--------|
| Sessions delivered | [X] | [X] |
| Action item completion rate | [target%] | [actual%] |
| Capacity ratio (coaching) | [X]% | [X]% |
| New referrals/inquiries | [target] | [actual] |

## Previous Action Items (Status Check)
- [Action 1]: ✅ Done / ⏸️ In progress / ❌ Dropped — [why]

## What Went Well
[Celebrate specific wins — a session, a technique, a client milestone, a business outcome]

## What Went Poorly
[Honest friction points — patterns to address, not just bad luck]

## Strategic Translation Review
[From Client Portfolio §6 — How are client outcomes contributing to practice strategy?]

## Failure Protocol Review
[From COS §7 — Any safe-fail experiments? What did they teach?]

## Action Items (For Next Period)
| Action | Owner | By When |
|--------|-------|---------|
| [Specific change] | Coach | [Date] |
```

**Chains With:** `quarterly_reset` (retro feeds the reset), `prep_program` (retro learnings inform next cycle planning)

---

## 🎯 DECISION SUPPORT COMMANDS

### `client_request [description]`

**Trigger:** New client inquiry, scope change, or referral arrives  
**Purpose:** Run the 3-gate Decision Protocol and produce a concrete recommendation: ACCEPT / NEGOTIATE / DECLINE / WAITLIST

**OS Files to Read:**
- `01_KERNEL/coach_decision_protocol.md` — full (all gates + Rule Zero)
- `03_DRIVERS/client_portfolio.md` — §2 Roster, §4 Capacity Contract, §7 Referral Network
- `02_CONFIG/practice_strategy.md` — §1 North Star
- `04_PROCESSES/quarterly_plan.md` — §1 Plan (displacement check)
- `01_KERNEL/coach_operating_system.md` — §3 The "No" Logic
- **Relevant client cards** — §3 Coaching Goals (fit assessment)

**Ask User For:**
- Full description of the request (new client, scope extension, referral, new program)
- Who is requesting and their context
- Estimated effort (weekly hours, program length)
- Current capacity utilisation
- Is this reversible? (Can you exit if it doesn't work?)

**Critical Files for Freshness:**
- � `coach_decision_protocol.md` — 30-day grace (protocol logic must be current)
- 🟡 `practice_strategy.md` — 3-day grace (North Star gate)
- 🟡 `client_portfolio.md` — 3-day grace (Capacity Contract gate)
- 🔴 `quarterly_plan.md` — 0-day grace (what gets displaced?)

**Output Format:**
```
# Decision Protocol — Client Request

## Request Summary
- **Request:** [Description]
- **Requester:** [Name / context]
- **Estimated effort:** [Hours/week, program length]
- **Reversible?** [Yes / No — informs decision speed from Decision Protocol §4]

---

## Gate 1: Client Fit (Level 1)
| Criterion | Assessment | Score |
|-----------|-----------|-------|
| Niche alignment | [Yes / Partial / No] | H/M/L |
| Readiness for coaching | [Yes / Partial / No] | H/M/L |
| Values alignment | [Yes / Partial / No] | H/M/L |
| Expected programme match | [Yes / Partial / No] | H/M/L |

**Best-fit assessment:** [Summary]
**Result:** ✅ PASS / ❌ FAIL

**If FAIL (Values alignment = No):** DECLINE immediately (Decision Protocol §1 — values misalignment is non-negotiable regardless of other criteria)

**If FAIL for other reasons (niche, readiness, or programme mismatch) and Values alignment = Yes/Partial:** Do not proceed now — document the rationale, consider flagging as a "future-fit lead" or referral (from Portfolio §7), then move to the next opportunity (Decision Protocol §1–§2)

---

## Gate 2: Practice Strategy (Level 2)
**North Star:** [From practice_strategy §1]
**Analysis:** [How does this request serve or hurt the strategic goal?]
**Result:** ✅ ALIGNED / ⚠️ NEUTRAL / ❌ MISALIGNED

---

## Gate 3: Capacity (Level 3)
**Capacity Contract:** [From Portfolio §4]
**Current utilisation:** [%]
**Available headroom:** [Hours or client slots]
**Result:** ✅ PASS / ❌ FAIL

**If FAIL → Invoke "No" Logic (COS §3):**
- Is this a strategic priority that warrants a temporary capacity stretch? [Yes → NEGOTIATE / No → DECLINE or WAITLIST]
- Pre-filled communication: [Script]

---

## RECOMMENDATION: [ACCEPT / NEGOTIATE / DECLINE / WAITLIST]

### If ACCEPT
- Onboard via: `onboard_client [name]`
- Displace: [Nothing / Review quarterly_plan item X]

### If NEGOTIATE
[Pre-filled script from COS §3 with current numbers and proposal]

### If DECLINE
[Reason + constructive referral path — from Portfolio §7 Referral Network]

### If WAITLIST
[Timeline + re-evaluation trigger]

---

## Rule Zero Check
- [ ] Is this decision ambiguous enough to require a live conversation? → Recommend talking first
```

**Chains With:** `onboard_client [name]` (if accepted), `capacity_check` (if capacity gate triggered), `boardroom [topic]` (if decision is high-stakes and uncertain)

---

### `boundary_check [topic]`

**Trigger:** Possible scope breach, ethical concern, role confusion, or client relationship tension  
**Purpose:** Identify the boundary at risk and produce a boundary-safe next action

**OS Files to Read:**
- `01_KERNEL/coach_operating_system.md` — §10 Engagement Framework, §12 Pressure Mode, §8 Managing Stakeholders
- `01_KERNEL/coach_decision_protocol.md` — §0 Rule Zero, §1 Hierarchy of Precedence, §4 Decision Speed
- `03_DRIVERS/client_portfolio.md` — context for the client or situation involved
- `01_KERNEL/personal_dna.md` — Avoidance Patterns (is this being avoided due to conflict aversion?)

**Ask User For:**
- Full situation summary (what happened or is about to happen)
- Which boundary feels at risk (scope, ethics, role, emotional)
- Stakeholders involved and their relationship to the coaching relationship
- Potential impact if the situation is left unaddressed

**Critical Files for Freshness:**
- � `coach_decision_protocol.md` — 30-day grace (Rule Zero + boundary logic)
- 🟢 `personal_dna.md` — 30-day grace (avoidance pattern check)

**Output Format:**
```
# Boundary Check — [Topic]

## Self-Awareness Flag
> From Personal DNA — Am I flagging this to address a real concern, or to avoid a difficult conversation?
> Avoidance patterns: [From personal_dna.md]

## Situation Summary
[Concise description of what is happening and why a boundary may be at risk]

## Boundary at Risk
- **Type:** [Scope / Ethics / Role / Emotional / Contractual]
- **Specific concern:** [Exact nature of the boundary]
- **Urgency:** [Act now / Address in next session / Monitor]

## Decision Protocol Gate
- **Rule Zero check:** [Does this require direct human conversation — not AI mediation?]
  - If yes → Stop here. Conversation first. Return to COS after.

## Recommended Response
**Option A (preferred — address directly):**
[Pre-drafted communication or in-session approach using COS §8 and §10]

**Option B (protective — slow the situation):**
[If immediate action is risky — create holding space, buy time ethically]

## Referral / Supervision Path
- When to involve a supervisor: [Criteria]
- When to refer the client: [Criteria]
- Available referral options: [From Client Portfolio or practice network]

## Documentation Note
Log this boundary check in Notion/session notes with: date, type, action taken, outcome
```

**Chains With:** `boardroom [topic]` (if the situation needs advisory input before deciding), `client_request` (if scope breach needs a formal decision)

---

### `quarterly_reset`

**Trigger:** End of quarter / start of new quarter  
**Purpose:** Full system refresh — archive the old quarter, update all layers, plan the new quarter

**OS Files to Read:**
- **All files** — full system review
- `00_BOOT/README.md` — quarterly maintenance section

**Ask User For:**
- Previous quarter's outcomes (client milestones, revenue, program delivery %)
- New quarter's strategic direction (from practice_strategy update)
- Client roster changes (new clients, graduated clients, paused relationships)
- Any company value, pricing model, or niche updates
- Specific risks from the previous quarter to address going forward

**Critical Files for Freshness:**
- 🔴 `quarterly_plan.md` — 0-day grace (replace with new quarter plan)
- 🟡 `practice_strategy.md` — 3-day grace (North Star must reflect new quarter)
- 🟡 `client_portfolio.md` — 3-day grace (roster + capacity contract must be current)
- 🟢 `coach_operating_system.md`, `personal_dna.md`, `coach_decision_protocol.md` — 30-day grace
- 🟢 `boardroom.md` — quarterly review

> Run `prep_refresh` first if any files are stale — start with the most overdue.

**Output Format:**
```
# Quarterly Reset — [Q(X) → Q(X+1)]

## Quarter Retrospective
- **Client outcomes:** [% coaching goals significantly progressed or achieved]
- **Program delivery:** [% milestones hit vs planned]
- **Capacity ratio average:** [Coaching / Biz Dev / Admin]
- **Practice health:** [Revenue trend, roster size trend]

## File-by-File Update Checklist

### 01_KERNEL/ (review — update only if evolved)
- [ ] `coach_operating_system.md`: Review values, update Pressure Mode Pattern Log, check §11 Standards
- [ ] `coach_decision_protocol.md`: Any new decision patterns to codify from this quarter?
- [ ] `personal_dna.md`: Update Goals (next 90 days), refresh Constraints & Fears

### 02_CONFIG/ (replace if strategy has shifted)
- [ ] `practice_strategy.md`: Archive old, create new with updated North Star + quarterly focus
- [ ] `practice_operating_system.md`: Check for mission or service model updates

### 03_DRIVERS/ (update roster and capacity)
- [ ] `client_portfolio.md`: Update §2 Roster, rewrite §6 Strategic Translation, review §4 Capacity Contract
  - Mark clients graduating → archive their cards
  - Add new clients from `onboard_client` runs this quarter
- [ ] `client_card - [Name].md`: Update §3 Coaching Goals for each continuing client
  - Mark "Carries Over: Yes" entries to keep across cohort changes

### 04_PROCESSES/ (replace)
- [ ] `quarterly_plan.md`: Archive old, create new from updated strategy + milestones

## Diff Summary
- Practice North Star: [Old → New or unchanged]
- Roster: [Old size → New size]
- Capacity ratio: [Old → New]
- Key strategic shift: [Summary]
```

**Chains With:** `prep_refresh` (run first if files are stale), `prep_program` (new quarter planning after reset), `retro` (retro feeds into the quarterly review section)

---

> **Also in this category:** `boardroom [topic]` — classified as Decision Support. Full definition below, after all other categories, for readability.

---

## 🔧 MAINTENANCE COMMANDS

### `prep_refresh`

**Trigger:** When file freshness warnings appear during command execution, or as monthly maintenance  
**Purpose:** Audit all OS files for staleness and refresh only the stale sections — not a full rewrite

**OS Files to Read:**
- **All files** — scan each file's `Last Updated` header against expected refresh frequency (automatic check)

**Ask User For:**
- *Determined by command logic* — only asks about files that are stale based on the freshness table below
- No fixed questions; questions are generated dynamically based on which files are overdue

**Critical Files for Freshness:**

This command scans all files. Freshness table (used to calculate staleness):

| File | Expected Refresh | Grace Period |
|------|-----------------|-------------|
| `quarterly_plan.md` | Weekly (active quarter) | 0 days |
| `client_card - [Name].md` | Monthly (per active client) | 7 days |
| `client_portfolio.md` | Quarterly | 3 days |
| `practice_strategy.md` | Quarterly | 3 days |
| `practice_operating_system.md` | Annually or on pivot | 30 days |
| `coach_operating_system.md` | Annually or on evolution | 30 days |
| `personal_dna.md` | Annually or as needed | 30 days |
| `coach_decision_protocol.md` | Annually or as needed | 30 days |

**Output Format:**
```
# File Refresh — [Date]

## Staleness Audit
| File | Last Updated | Expected Refresh | Days Overdue | Priority |
|------|-------------|-----------------|-------------|---------|
| [File 1] | [YYYY-MM-DD] | [Frequency] | [#] days | 🔴 / 🟡 / 🟢 |
[Order by priority — most overdue first]

---

## Files Requiring Refresh (Priority Order)

### 🔴 [Most Urgent File]

**What has changed since [last update date]?**

**Targeted questions — select which apply:**

- If `quarterly_plan.md`: What changed in the plan since last update? New priorities, dropped milestones, new risks?
- If `client_card - [Name].md`: Has the client's primary goal shifted? Any new context, life events, or coaching focus changes?
- If `client_portfolio.md`: Roster changes? Capacity contract still accurate? Referral network updates?
- If `practice_strategy.md`: Has the North Star evolved? Any niche, pricing, or positioning changes?
- If `coach_operating_system.md`: New patterns to log in Pressure Mode? Values evolution? Updated protocols?
- If `personal_dna.md`: Have your 90-day goals changed? New constraints? Avoidance patterns evolved?

**Updated section:**
[User provides summary of what changed — AI drafts the updated file section]

---

### 🟡 [Second Priority File]
[Repeat above structure]

---

### 🟢 [Low Priority — No Immediate Action]
[List files within their grace window — noting when they next come due]

---

## Updated File Headers (Ready to Paste)

```markdown
> **Last Updated:** [TODAY in YYYY-MM-DD]
```

Apply this to all files refreshed in this session.

## What NOT to Change

Only update what has actually changed. Do **not** rewrite the entire file — that is `quarterly_reset`.

**Examples:**
- ✅ Client goal shifted? → Update `client_card §3` only
- ✅ New risk identified? → Add to `quarterly_plan §2` only
- ❌ Don't rewrite the full coaching philosophy because one value evolved
```

**Chains With:** Always feeds forward — after refreshing, the next command you run will see current "Last Updated" dates and won't trigger stale warnings. Run before `version_upgrade` to ensure your data is complete before framework changes are applied.

---

### `version_upgrade [target_version]`

**Trigger:** When a new COS framework version is released — typed as `version_upgrade`, `version_upgrade [target_version]`, or `version_upgrade --remote`  
**Purpose:** Upgrade from your current COS version to a newer one while preserving all your data. Supports two modes:
- **Local mode** (default): reads CHANGELOG.md already loaded in the conversation
- **Remote mode** (`--remote` flag, or when CHANGELOG is missing/outdated): fetches `CHANGELOG.md` and changed template files from the COS GitHub repository via web browsing

**OS Files to Read:**
- **All files** — detect current version from `Version:` headers
- `CHANGELOG.md` — read all entries between current and target version (local or remote)

**External Tools / Live Data:**
- **GitHub raw file access** (Remote mode only) — browse the following URLs:
  - CHANGELOG: `https://raw.githubusercontent.com/daviddgl/coach-operating-system/main/CHANGELOG.md`
  - Individual changed files: same base URL + file path (e.g., `.../main/03_DRIVERS/client_portfolio.md`)
  - File list derived from CHANGELOG `### Added` / `### Changed` entries
  - Fallback: if browsing fails, ask user to paste the new `CHANGELOG.md` content manually

**Ask User For:**
- Target version to upgrade to (e.g., `2026.08`) — or detect latest from remote CHANGELOG
- Confirmation before applying each migration step
- Generate inline bundle after migration? (Y/N) — for bundled-deployment users (Gemini Gems, ChatGPT)

**Critical Files for Freshness:**
- All files will have their `Version` field updated during upgrade
- `Last Updated` field is preserved — your refresh dates remain accurate

**Output Format:**
```
# Version Upgrade — [Current Version] → [Target Version]

## Current State
- **Your Version:** [Detected from file headers]
- **Latest Version:** [From CHANGELOG — local or remote]
- **Versions to Apply:** [List intermediate versions if jumping more than one]
- **Source:** Local CHANGELOG / Remote GitHub fetch

---

## Change Summary

### Added (New content)
- [New files, commands, or sections from CHANGELOG]

### Changed (Modified content)
- [Renamed/restructured items from CHANGELOG]

### Removed (Deprecated content)
- [Deprecated features from CHANGELOG]

---

## Migration Plan

Total steps: [#]

---

### Step 1: [Action from CHANGELOG Migration Steps]

**Type:** Added / Changed / Removed

**What's changing:**
[Description from CHANGELOG]

**Your action:**
- If Added: [Template section to fill in with your data]
- If Changed: [Diff between old and new structure — adapt your content]
- If Removed: [Confirm archiving and what to delete]

**Ready to proceed?** (yes/no)

---

### Step 2: [Next action]
[Repeat for each migration step]

---

## Final Update

**Version field updates:**
```markdown
> **Version:** [Target Version]
```

Apply this to all affected files (listed below). Your `Last Updated` dates are preserved.

---

## Verification Checklist

- [ ] All new sections filled in with your data
- [ ] Changed sections adapted to new structure
- [ ] Removed sections archived
- [ ] Version field updated in all affected files
- [ ] Last Updated fields unchanged
- [ ] Test: run `init_week` and verify no warnings appear

---

## Rollback Instructions

If something breaks after upgrade:
1. Restore your pre-upgrade file versions
2. Report issue at `https://github.com/daviddgl/coach-operating-system/issues`
3. Include: your previous version, target version, and the step that failed

---

## Inline Bundle Generation (Bundled-Deployment Users)

After all migration steps are complete, if bundle generation is confirmed:

1. Assemble `cos_compiled.md` inline from migrated file contents (your data + new framework)
2. Concatenation order (same as `scripts/bundle.sh`):
   - `00_BOOT/README.md`
   - `01_KERNEL/coach_operating_system.md`, `coach_decision_protocol.md`, `personal_dna.md`
   - `02_CONFIG/practice_operating_system.md`, `practice_strategy.md`
   - `03_DRIVERS/client_portfolio.md`, all `client_card - [Name].md` files
   - `04_PROCESSES/quarterly_plan.md`
   - `05_COMMANDS/command_reference.md`, `system_prompt.md`
   - `06_BOARDROOM/boardroom.md`
3. Wrap each file with: `<!-- SOURCE FILE: [relative_path] -->`
4. Output full bundle as a single code block
5. Instruct user: replace existing `cos_compiled.md` in their platform knowledge base with this new bundle — no need to run `bundle.sh` manually

> **Platform note:** If output exceeds the platform's limit, split into 2–3 parts with clear paste-order instructions. `00_BOOT/bootstrap_prompt.md` in Custom Instructions stays unchanged.
```

**Chains With:** Run `prep_refresh` first (data should be current before framework changes are applied). After upgrade, run `init_week` to verify the system works correctly.

---

### `boardroom [topic]`

**Trigger:** High-stakes uncertainty — you need adversarial, multi-perspective input before deciding  
**Purpose:** Convene your virtual advisory council — activate the most relevant personas, get each perspective and probing questions, then synthesise into a decision-ready output

**OS Files to Read:**
- `06_BOARDROOM/boardroom.md` — §1 Persona Roster, §2 Working Principles, §3 Activation Logic, §5 Coach's Chair
- `01_KERNEL/personal_dna.md` — Goals, Constraints & Fears, Avoidance Patterns
- `01_KERNEL/coach_operating_system.md` — §12 Pressure Mode (is this session stress-driven?)

**Ask User For:**
- `[topic]` — The situation, decision, or challenge to bring to the boardroom (1–3 sentences of context)
- Session depth: **Quick scan** (3 personas, 5-min read) or **Full session** (4–5 personas, deeper analysis)

**Persona Selection Logic:**

Auto-select 3–4 personas based on topic type:

| Topic Type | Activate |
|------------|---------|
| Client relationship / trust / rapport | People Coach + Vulnerability Anchor + Challenger |
| Delivery / accountability / outcomes | Execution Force + Standards Anchor + Challenger |
| Strategy / positioning / niche | Narrative Strategist + Execution Force + Challenger |
| Multi-faceted / complex decision | All 4 core personas |
| Coach wellbeing / burnout / pressure | Vulnerability Anchor + Narrative Strategist + People Coach |

Always include the **Challenger** persona unless the topic is explicitly wellbeing-focused.

**Critical Files for Freshness:**
- 🟢 `boardroom.md` — review quarterly (no hard staleness trigger)
- 🟢 `personal_dna.md` — 30-day grace

**Output Format:**
```
# Boardroom Session — [Topic Summary]
**Date:** [Today]
**Session Depth:** [Quick / Full]

---

## Personas Activated
[List 3–4 personas selected, with one-line rationale for each]

---

## [Persona 1 Name] — [Role]
> *"[Their worldview or signature quote]"*

**Their Take:**
[2–4 sentences of their perspective on the topic, voiced in their style]

**They Ask:**
1. [Probing question that challenges your framing]
2. [Second probing question that opens a new angle]

---

## [Persona 2 Name] — [Role]
[Same structure]

---

[Repeat for each activated persona]

---

## Integrated Synthesis
**Where they agree:**
- [Point of consensus]
- [...]

**Where they diverge:**
- [Persona A] wants [X] — [Persona B] pushes back with [Y]
- [Name the tension and what it means for your decision]

**Recommended next action:**
[One concrete, actionable step you can take today, grounded in the boardroom discussion]

---

> ⚠️ **Rule Zero:** The boardroom advises. You decide.
> Run `client_request` or `boundary_check` if this requires a formal protocol.
```

**Chains With:** `client_request [description]` (boardroom clarifies your position before running the decision protocol), `boundary_check [topic]` (boardroom helps think through whether and how to address a concern), `capacity_check` (if the boardroom surfaces a structural pattern)

---

## Command Quick Reference

| Command | Trigger | Key Output |
|---------|---------|-----------|
| `init_week` | Monday | Weekly priorities, per-client focus, capacity pre-check |
| `init_day` | Each morning | Daily top 3, session audit, Pressure Mode check |
| `shutdown_day` | End of day | Done/blocked list, session output audit, carryover |
| `shutdown_week` | Friday | Capacity report, North Star contribution, Monday carryover |
| `prep_session [name]` | Before session | Agenda, coaching mode, coach self-check |
| `onboard_client [name]` | New client | Draft Client Card, welcome brief, first-30-days plan |
| `prep_program` | Planning period | Capacity calculation, initiative priorities, risk flags |
| `capacity_check` | Overwhelm/imbalance | Ratio analysis, trend, circuit breaker status |
| `retro` | Review cadence | Metrics, wins/friction, action items |
| `client_request [desc]` | New request/referral | 3-gate protocol → ACCEPT/NEGOTIATE/DECLINE/WAITLIST |
| `boundary_check [topic]` | Scope/ethics concern | Boundary identified, options, referral path |
| `quarterly_reset` | End of quarter | File-by-file refresh checklist, diff summary |
| `prep_refresh` | Staleness warnings | Audit table, targeted questions, updated headers |
| `version_upgrade [v]` | New COS release | Migration steps, data preserved, verification checklist |
| `boardroom [topic]` | High-stakes uncertainty | Multi-persona perspectives, synthesis, action |
