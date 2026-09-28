# CLAUDE.md

Claude Code–specific notes. [`AGENTS.md`](AGENTS.md) is the canonical guide,
written to work with any agent; Claude Code loads only this file on its own,
so it imports the guide here:

@AGENTS.md

This file adds only what's specific to Claude Code.

## Watching PRs

After opening a PR, subscribe to its activity (`subscribe_pr_activity`) and
end the turn. CI results, review comments, and merge conflicts wake the
session; handle each one as [`docs/workflow.md`](docs/workflow.md) "Watching
CI" says. Unsubscribe once the PR is merged or closed.

Without that tool (a local session), check before handing back:
`gh pr checks <number> --watch`.

## Asking questions

- When you need to ask the user a question, ask **one question at a time**,
  through regular chat, with a few suggested options they can pick from or riff
  on.
- **Never** use the app's multiple-choice/question-picker widgets — always ask
  in plain chat text instead.

## Configuration

| File | What it does |
|---|---|
| [`.claude/settings.json`](.claude/settings.json) | Pre-approves `check`, the test command, and read-only git, so sessions don't stop for permission. Blocks force-pushes and reading `.env` files — the common forms; the branch ruleset on GitHub is the real guard for `main`. |
| [`.claude/hooks/session-start.sh`](.claude/hooks/session-start.sh) | In cloud sessions, installs dependencies at startup so `check` can run. |

## Skills

Project skills live in [`.claude/skills/`](.claude/skills/).

| Skill | When |
|---|---|
| [`ask-me`](.claude/skills/ask-me/SKILL.md) | The goal or scope is still fuzzy — interview to form intent before any plan exists. |
| [`grill-me`](.claude/skills/grill-me/SKILL.md) | A plan exists — stress-test it for failure modes before building it. |
