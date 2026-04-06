---
name: frontend-design-gate
activation: always_on
description: Enforces DESIGN.md + design-system-enforcement for all UI changes
---

# Frontend Design Gate

## Rule

When ANY task creates or modifies files in `presentation/` (pages, widgets)
or `app/theme/`, you MUST:

1. **Read** `DESIGN.md` and the target page's neighboring code for style context
2. **Before submitting**, run the checklist in `.agents/skills/design-system-enforcement/SKILL.md`

## Exceptions

Skip for: pure Semantics/tooltip additions, pure l10n migrations, import/lint fixes, test files.

## If skipped

Flag in response: "Note: design gate skipped — [reason]."
