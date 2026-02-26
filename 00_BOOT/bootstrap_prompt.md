# COS Bootstrap Prompt

> **What is this?** A short, static text you paste into your AI platform's Custom Instructions (Gemini Gem instructions, ChatGPT GPT instructions, or Claude Project instructions). It never changes between COS versions — paste it once and forget it.
>
> **Why is this separate?** Your full operating instructions (`system_prompt.md`) live in your AI platform's knowledge base — either as a standalone file or embedded inside `cos_compiled.md`. This bootstrap tells the AI where to find them regardless of which deployment mode you use. Keeping this layer static means you only need to update knowledge files when the OS changes — never touch Custom Instructions again.

---

## Text to paste into Custom Instructions

```
You are a Coach Operating System (COS) copilot.

Your full operating instructions are in `05_COMMANDS/system_prompt.md`. Locate it in your knowledge base:
- If using the bundled file: find the section marked <!-- SOURCE FILE: 05_COMMANDS/system_prompt.md --> inside cos_compiled.md
- If using individual files: open the uploaded 05_COMMANDS/system_prompt.md directly

Before responding to any user message:
1. Read the system_prompt.md content in full
2. Follow every rule, protocol, identity definition, and command behaviour it specifies
3. If the request is ambiguous or critical context is missing, ask 1–2 clarifying questions before proceeding
4. Execute the user's request strictly according to those instructions

Do not improvise. Always ground your responses in the OS files loaded in this project.
```

---

## Setup checklist

**Bundled deployment (`cos_compiled.md`):**
- [ ] Run `scripts/bundle.sh` from the repository root to generate `bundle/cos_compiled.md`
- [ ] Upload `bundle/cos_compiled.md` to your AI platform as a knowledge file
- [ ] Paste the text above into Custom Instructions / Gem instructions / Project instructions
- [ ] Test: type `init_week` — the AI should ask for your schedule and produce a structured weekly plan

**Individual-file deployment:**
- [ ] Upload all COS `.md` files to your AI platform knowledge base
- [ ] Paste the text above into Custom Instructions / Gem instructions / Project instructions
- [ ] Test: type `init_week` — same expected output

> Choose the bundled approach for Gemini Gems (file-count limits apply) or when you want simpler knowledge management. Choose individual files for ChatGPT Projects or Claude Projects, where file-level navigation is supported.

## How to update

**When a new COS version is released:**
- *Bundled:* Re-run `scripts/bundle.sh` to regenerate `cos_compiled.md`, then re-upload the new bundle to your AI platform (or run `version_upgrade --remote` to generate it inline via the AI)
- *Individual files:* Download the changed files and re-upload only those files
- **Do NOT change this bootstrap text** — it is version-independent and works for both modes
- The updated `system_prompt.md` in your knowledge base takes effect automatically on the next conversation

**When should you edit this file?**
Almost never. The only reason to edit it is if the `<!-- SOURCE FILE: -->` marker format itself changes (extremely rare) or if you want to add custom instructions that apply globally across all COS commands.

