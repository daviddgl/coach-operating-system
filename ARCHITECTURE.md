# Architecture

## Layer model

```text
00_BOOT      -> Onboarding + bootstrap pointer
01_KERNEL    -> Portable identity and decision logic
02_CONFIG    -> Practice context (mission + strategy)
03_DRIVERS   -> Active client portfolio and client-level profiles
04_PROCESSES -> Time-bound execution plan
05_COMMANDS  -> AI command interface and operating instructions
06_BOARDROOM -> Advisory persona simulation for difficult decisions
```

## Design principles
- Logic/data separation: framework logic in markdown files; operational data in external tools
- Portability: Kernel + Commands + Boardroom travel with the coach
- Replaceability: Drivers + Processes are periodically refreshed
- Safety: Rule Zero and boundary checks override automation

## Command lifecycle
1. User invokes command
2. AI loads command definition
3. AI reads referenced file sections
4. AI asks for missing runtime data
5. AI outputs structured decision support
