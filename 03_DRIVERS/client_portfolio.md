# CLIENT PORTFOLIO

> **Layer:** DRIVERS  
> **Owner:** [Your Name]  
> **Version:** 2026.02  
> **Last Updated:** [YYYY-MM-DD]  
> **Portable:** No — replaced when your active client cohort changes significantly

---

## What Is This File?

**Client Portfolio** is your current client roster and engagement rulebook — who your active clients are, how they work with you, your capacity limits, your practice rituals, and your referral network.

Commands use this to:
- Understand coaching capacity and constraints (`capacity_check`)
- Allocate prep time and session focus (`prep_session`, `init_week`)
- Enforce the Capacity Contract (coaching vs. admin ratio)
- Track referral partners and network contacts (`client_request`)
- Make decisions aligned with portfolio principles (`client_request`, `boundary_check`)

**Update frequency:** Quarterly (capacity changes, new clients, ritual changes) + when client roster changes significantly  
**Used by:** ALL commands (most heavily: `init_week`, `prep_program`, `capacity_check`, `prep_session`, `client_request`)  
**Critical sections:** §2 (Roster/Capacity), §4 (Capacity Contract), §6 (Strategic Translation), §7 (Referral Network)

---

## 1. Portfolio Identity

**Current Focus:** [One-line description of your current work — e.g., "Supporting 8 professionals through career transitions, 1 group cohort running Q1"]
**Mission (This Quarter):** [What are you delivering this quarter, to whom?]

* **Services Currently Active:**
  * [Service 1 — e.g., "1-on-1 career transition coaching — 6 active clients"]
  * [Service 2 — e.g., "Group programme — Q1 cohort (5 participants)"]
* **What I Deliver:**
  * [Deliverable 1 — e.g., "Clarity on career direction"]
  * [Deliverable 2 — e.g., "Job search strategy and interview readiness"]
* **Who I Serve:**
  * [Primary client type — e.g., "Mid-career professionals in transition"]
  * [Secondary client type — e.g., "First-time managers building leadership identity"]

---

## 2. Active Roster (Capacity Board)

*All active engagements and their current status.*

| Client | Engagement Type | Sessions/Month | Status | Programme End |
| :--- | :--- | :--- | :--- | :--- |
| **[Client Name]** | [1-on-1 / Group] | [e.g., 2/month] | [Active / On Hold / Completing] | [YYYY-MM-DD or Quarter] |
| **[Client Name]** | [1-on-1 / Group] | [e.g., 2/month] | [Active] | [Date] |
| **[Client Name]** | [1-on-1 / Group] | [e.g., 1/month] | **[On Hold — [reason]]** | [Date] |
| **[Group Cohort Name]** | [Group] | [e.g., 8 sessions total, weekly] | [Active] | [Date] |

<!-- Mark clients with reduced availability or unusual constraints in the Status column. This is critical for capacity_check and prep_program. -->

---

## 3. Engagement Principles

> *Note: Universal coaching principles (your portable values) live in the Kernel → Coach Operating System. This section contains only portfolio-specific working agreements for your current client mix.*

* **[Principle 1]:** [Why this is specific to THIS portfolio — e.g., "All 1-on-1 clients complete a structured intake before the first session. No intake = no start."]
* **[Principle 2]:** [e.g., "Between-session support is available via [tool], but limited to [X] messages per week to protect coaching boundaries."]

<!-- Only add principles that wouldn't apply to a completely different client portfolio. Everything universal belongs in the Kernel. -->

---

## 4. The Capacity Contract

**We acknowledge that "Hidden Work" (admin, marketing, CPD, supervision) exists and must be budgeted.**

* **The Ratio:** Each week, I allocate approximately **[X]%** to Direct Coaching (sessions + prep), **[Y]%** to Business Development (marketing, lead follow-up, networking), and **[Z]%** to Admin & CPD (invoicing, notes, supervision, learning).
* **Maximum Weekly Sessions:** [N] active client sessions per week (beyond this, quality drops).
* **The Circuit Breaker:** If Admin or Biz Dev consistently exceeds their contracted allocation for two consecutive weeks, I **pause** the lowest priority business development activity to fix the root cause. I do not "work more hours"; I protect capacity.

---

## 5. Practice Rituals

<!-- Define your recurring professional routines. -->

* **Weekly Client Review ([Sync/Async]):** [e.g., "Sunday evening — review all upcoming sessions this week, check action items from last session, update CRM"]
* **Monthly Portfolio Review ([Sync/Async]):** [e.g., "First Monday of each month — review client progress, update Client Cards, check renewal dates"]
* **Quarterly Business Review:** [e.g., "Tied to quarterly_reset command — full review of practice health, goals, and client roster"]
* **Peer Supervision / Case Consultation:** [e.g., "Bi-weekly with [peer coach name] — 45 min case consultation format"]

---

## 6. Strategic Translation ([Current Quarter])

*How Practice Strategy translates into portfolio-level priorities this quarter.*

<!-- Read Practice Strategy §1 (North Star) and write your portfolio's interpretation below. -->

* **Priority Logic:** [How does the practice North Star translate to YOUR current client work?]
* **The Trade-off Rule:** [When capacity is tight, what do you cut and what do you protect? — e.g., "Client sessions are sacred. Biz dev is the first thing deferred when capacity is stressed."]

| Practice Value (Static) | Portfolio Implementation (This Quarter) |
| :--- | :--- |
| **[Value 1]** | → [How you're implementing this in your current client work] |
| **[Value 2]** | → [How you're implementing this in your current client work] |
| **[Value 3]** | → [How you're implementing this in your current client work] |

---

## 7. Referral Network & Partners

*Who I collaborate with and how we work together.*

<!-- This section tracks referral partners, peer coaches, and professional contacts relevant to your current practice. Update quarterly. -->

> **Portability note:** Professional relationships that are niche-agnostic or tied to your coaching identity are marked "Carries Over: Yes". Client-source relationships specific to your current niche or geography may be "Carries Over: No" if you pivot your practice.

| Partner / Contact | Role | Relationship | Comm Channel | Referral Direction | Carries Over |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **[Name]** | [e.g., Therapist, Recruiter, Financial Coach] | [e.g., Mutual referral partnership] | [e.g., Monthly check-in, email] | [e.g., "I refer clients needing emotional support; they refer clients seeking career clarity"] | Yes/No |
| **[Name]** | [e.g., Peer coach — same niche] | [e.g., Peer supervision + overflow referrals] | [e.g., Bi-weekly call] | [e.g., "Mutual overflow referrals when either of us is fully booked"] | Yes |
| **[Name]** | [e.g., HR Manager at [Company]] | [e.g., Corporate programme sponsor] | [e.g., Quarterly update email] | [e.g., "They source programme participants; I deliver group coaching"] | No |

**How to use this table:**
- **List every professional contact** you regularly exchange value with (referral partners, peer coaches, supervisors, corporate contacts)
- **Carries Over:** Mark "Yes" if this relationship survives a practice niche change; "No" if it's specific to your current client base
- **Update frequency:** Refresh quarterly during `prep_refresh` or `quarterly_reset`, or add rows when new partnerships form
- **Commands that use this:** `client_request` (context for incoming referrals), `prep_program` (surface collaboration opportunities), `init_week` (flag partner check-ins), `boundary_check` (use referral network for specialist referrals), `capacity_check` (partnership commitments consume capacity)
