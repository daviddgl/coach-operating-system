# Client Card: [Name]

> **Layer:** DRIVERS  
> **Owner:** [Name] + [Your Name]  
> **Version:** 2026.02  
> **Last Updated:** [YYYY-MM-DD]  
> **Portable:** No — Client-specific instance

---

## What Is This File?

**Client Cards** are individual client profiles — their career background, coaching goals, communication preferences, and how they work best. One card per client.

Commands use these to:
- Personalise session preparation (`prep_session` — matches person's goals and current situation)
- Design relevant programme content (`prep_program`)
- Provide targeted onboarding experience (`onboard_client`)
- Make aligned decisions in `client_request` (Gate 3: Which engagement best fits this client's goals?)

**Update frequency:** After intake + monthly update during active engagement + after significant milestones  
**Used by:** `prep_session`, `init_week`, `prep_program`, `onboard_client`, `client_request`  
**Critical sections:** §1 (Career Profile), §2 (Communication preferences), §3 (Coaching Goals)

---

**Engagement Type:** [e.g., 1-on-1 career transition coaching / Group cohort / Corporate programme]  
**Session Cadence:** [e.g., Bi-weekly, 60-minute sessions]  
**Engagement Start Date:** [YYYY-MM-DD]  
**Programme End / Renewal Date:** [YYYY-MM-DD]  
**Time Zone:** [e.g., CET, EST, GMT]

---

## 1. Career Profile

* **Current Role:** [Job title + company + how long in this role]
* **Career History (brief):** [2–3 sentences: where they've come from, key transitions, industries]
* **Target Direction:** [Where they want to get to — specific role, level, industry, or type of work]
* **Superpower:** [What do they do better than most? The strength that anchors their career narrative]
* **Career Blocker:** [What's getting in the way? The pattern, belief, or external factor holding them back]
* **Assessments Completed:** [e.g., CliftonStrengths, MBTI, DISC, Career Anchors, Values inventory — and key results]

---

## 2. Communication Preferences

* **Feedback Style:** [How they prefer to receive difficult feedback — direct and immediate? Written reflection first? Framed as questions?]
* **Between-Session Contact:** [Do they use async support? How often? What channel?]
* **Deep Work / Focus Hours:** [e.g., "Best reached in the morning — avoid scheduling sessions after 15:00"]
* **What energises them in sessions:** [e.g., "Concrete tools and frameworks", "Thinking out loud", "Accountability structures"]
* **What shuts them down:** [e.g., "Being told what to do", "Open-ended questions when they're in crisis mode", "Silence when they're not ready for it"]

---

## 3. Coaching Goals ([Current Programme])

* **Primary Goal:** [The main outcome they want from this coaching engagement]
* **Milestone 1:** [An early win or checkpoint — e.g., "Completed CV and cover letter templates by Session 3"]
* **Milestone 2:** [Mid-programme goal — e.g., "Active job applications submitted by Session 5"]
* **Milestone 3:** [End-of-programme target — e.g., "Offer received or clear next step agreed by final session"]

<!-- Fill this in together during intake or Session 1. Update after each session when goals shift. These are used by prep_session and prep_program commands. -->

---

## 4. Session Log (Running Summary)

<!-- Optional but recommended: brief rolling summary of progress and key themes. Update after each session. -->

| Session | Date | Focus | Key Insight | Actions Agreed |
| :--- | :--- | :--- | :--- | :--- |
| **1** | [YYYY-MM-DD] | [Theme] | [What they discovered] | [What they committed to] |
| **2** | [YYYY-MM-DD] | [Theme] | [Key insight] | [Actions] |
