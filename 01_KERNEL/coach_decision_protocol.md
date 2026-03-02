# Coach Decision Protocol

> **Layer:** KERNEL  
> **Owner:** David Garcia  
> **Version:** 2026.02  
> **Last Updated:** 2026-02-28  
> **Portable:** Yes

---

## 0. Rule Zero: The Human Handshake (Default to Speak)
* **Principle:** This OS is a *decision-support* tool, not a decision-maker. It calculates trade-offs, but David makes the call.
* **The Trigger:** If the rules below result in a logical conflict, ambiguity, or a "bad gut feeling," the system halts.
* **The Action:** Stop the async/logic flow. Have a synchronous conversation.

---

## 1. The Hierarchy of Precedence (Order of Operations)
When making a decision, apply constraints in this specific order:

1. **Level 1: Client Fit (The Non-Negotiable Core)**
    * *Why?* If the engineer is not willing to do the work and take radical ownership, the rest doesn't matter.
    * *Rule:* Match the engagement to the client's mindset. If they complain about others or refuse to do homework, DECLINE immediately.
2. **Level 2: Practice Strategy (Global Direction)**
    * *Why?* The work must align with where the practice is headed.
    * *Rule:* Choose the path that maximises your North Star (validating the premium model or building the video course).
3. **Level 3: Capacity (The Flexible Boundary)**
    * *Why?* You operate under a strict weekly capacity contract (see Client Portfolio §4 for current figures) to protect your TrustYou job and family time.
    * *Rule:* If Fit and Strategy are perfectly aligned, you may choose to *amplify* capacity temporarily to accommodate the client. If not, block the request or NEGOTIATE the timeline.

---

## 2. Interaction Rules (The API)

### Rule A: The "Override" Function
* **Scenario:** A prospect wants to pay the full amount, but they want you to rewrite their CV for them instead of doing it themselves.
* **Logic:** Level 1 (Client Fit) overrides Level 2 (Strategy/Revenue). You decline the work because it violates your radical ownership standard. 

### Rule B: The "Conflict" Function
* **Scenario:** Two perfect-fit clients want your last available hour.
* **Logic:** Prioritize the one that aligns best with your Practice Strategy (e.g., the one willing to engage with the flipped-classroom video model).

### Rule C: The "Exception" Function
* **Scenario:** Family emergency or kids get sick.
* **Logic:** Suspend normal scheduling. Protect family first. Rely on the asynchronous video course material to keep clients moving forward while live sessions are paused.

---

## 3. New Request Loop (Iteration Protocol)

**Purpose:** Define how to handle a new client request, scope change, or opportunity through the 3-gate hierarchy — including what to do when a gate fails and how to re-enter the loop.

### The Loop

```
1. RECEIVE request (client, referral, or self-generated opportunity)
2. RUN Gate 1 — Client Fit
   → PASS: proceed to Gate 2
   → FAIL (values misaligned): DECLINE immediately. Log reason. Loop ends.
3. RUN Gate 2 — Practice Strategy
   → PASS (aligned or neutral): proceed to Gate 3
   → FAIL (misaligned): NEGOTIATE scope or DEFER. If not negotiable → DECLINE. Loop ends.
4. RUN Gate 3 — Capacity
   → PASS: ACCEPT. → Onboard via `onboard_client`
   → FAIL (at capacity): WAITLIST with re-evaluation date (next quarter start)
   → PARTIAL (near capacity): NEGOTIATE terms (e.g., lighter engagement, async model)
5. DOCUMENT outcome in Notion/CRM with gate results and rationale.
6. REVIEW at next quarterly_reset — were WAITLIST or NEGOTIATE decisions revisited?
```

### Re-Entry Rules
* A WAITLISTED request re-enters the loop at Gate 3 only (Fit and Strategy already cleared).
* A NEGOTIATED request re-enters the loop at the gate that triggered negotiation.
* A DECLINED request does NOT re-enter — a new request from the same person is treated as a fresh evaluation.

### Rule Zero Override
* If any gate produces a "gut conflict" (logical pass but feels wrong), invoke Rule Zero: stop the loop and have a direct conversation before proceeding.

---

## 4. Decision Speed (Reversibility Framework)

**Purpose:** Match decision pace to decision weight. Move fast on reversible things; slow down on irreversible ones.

### The Test

> *"If I get this wrong, can I undo it within 30 days without significant cost to a client, my family, or the practice?"*

| Answer | Classification | Speed |
|--------|--------------|-------|
| Yes, easily | **Reversible** | Decide fast — bias toward action |
| Yes, with effort | **Partially reversible** | Decide within 48 hours with at least one input |
| No | **Irreversible** | Decide slow — mandatory Rule Zero check + Boardroom consult if high stakes |

### Examples by Category

| Decision | Reversible? | Speed Rule |
|----------|------------|------------|
| Try a new session format / framework | ✅ Yes | Decide in the session |
| Post a LinkedIn article or opinion piece | ✅ Yes | Bias toward publishing |
| Offer a discount or trial session | ⚠️ Partial | 48-hour rule — check Practice Strategy first |
| Change the price point (up or down) | ⚠️ Partial | 48-hour rule — run Boardroom first |
| Accept a new 1:1 client commitment | ❌ No | Run full 3-gate loop. Slow down. |
| Drop an active client | ❌ No | Rule Zero + Boardroom. Write it out before any conversation. |
| Leave TrustYou / go full-time coaching | ❌ No | Rule Zero. Family conversation first. Not an OS decision. |

### Pressure Mode Interaction
* Under Pressure Mode (§12), the bias toward fast decisions is **suspended**.
* All decisions above "Reversible" require explicit written reasoning before acting.
* See §12 Pressure Mode Rules: "Write it down before acting."