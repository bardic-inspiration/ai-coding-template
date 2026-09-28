# CLAUDE.md

Claude Code–specific notes. [`AGENTS.md`](AGENTS.md) is the canonical guide
(purpose, hard rules, layout, working loop, and the PR and scope discipline
that apply to every session). Claude Code loads only this file on its own, so
it imports the guide here — every session starts with it in context:

@AGENTS.md

This file adds only the conventions specific to Claude Code's tools and
interface.

## Asking questions

- When you need to ask the user a question, ask **one question at a time**,
  through regular chat, with a few suggested options they can pick from or riff
  on.
- **Never** use the app's multiple-choice/question-picker widgets — always ask
  in plain chat text instead.

## CI watch protocol

- **Never watch.** Do not call `subscribe_pr_activity` on any PR you open,
  regardless of whether it touches code or is docs-only. Cold-start sessions
  have no memory of prior runs, so a subscription left open has nobody to act
  on it between sessions — open the PR and end the turn.

## Skills

Project skills live in [`.claude/skills/`](.claude/skills/).

| Skill | When |
|---|---|
| [`ask-me`](.claude/skills/ask-me/SKILL.md) | The goal or scope is still fuzzy — interview to form intent before any plan exists. |
| [`grill-me`](.claude/skills/grill-me/SKILL.md) | A plan exists — stress-test it for failure modes before building it. |
