# virusPrank – Harmless Terminal Prank / Demo

**Important: This is a prank / demonstration project only.**  
It is **not** real malware. It does **not** harm files, steal data, install miners, open backdoors, or perform any malicious action.

## What it actually does

When executed, `virus.sh` shows:

- Dramatic ASCII art
- Fake "hacking" animation sequence (progress bars + animated dots)
- Messages simulating typical ransomware / malware behavior
- A final "SYSTEM COMPROMISED" screen

**Nothing is actually changed** on the system — it's 100% visual theater.

The optional `run.py` script (requires root):

- Switches to TTY3 (`chvt 3`)
- Injects hardcoded username + password via TIOCSTI
- Attempts to auto-run `virus.sh`

This is meant **only for controlled local demonstration** (e.g. on your own virtual machine while showing someone how fake virus screens work).

## ⚠️ VERY IMPORTANT WARNINGS

- **Never run this on someone else's computer without explicit, enthusiastic permission.**
- **Never use this in a school, company, public computer, or any environment where it could cause real panic, support tickets, or legal consequences.**
- **Do NOT rename the project to hide its prank nature** (e.g. "system_update.sh", "driver_fix", etc.)
- **Do NOT distribute it disguised as something useful/important.**
- Misuse of this kind of prank has caused people to be expelled, fired, sued, or even criminally investigated in several countries.

**You are fully responsible for how you use this code.**

But for real i don't care

## Quick local test (safest way)

```bash
# Just look at it — nothing dangerous
chmod +x virus.sh
./virus.sh
