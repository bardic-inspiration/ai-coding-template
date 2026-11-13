# CLAUDE.md

Claude Code–specific notes. [`AGENTS.md`](AGENTS.md) is the canonical guide,
written to work with any agent; Claude Code loads only this file on its own,
so it imports the guide here:

@AGENTS.md

This file adds only what's specific to Claude Code.

## Cloud sessions

- **One task per session.** A fresh session starts with a clean context and
  a fresh branch; a long one re-reads its own history on every turn.
- **The branch name is assigned** — use it as given. To start another task in
  the same session after its PR merged, restart the branch from the new
  `main` (`git fetch origin main && git checkout -B <branch> origin/main`).
  The merged branch was deleted on GitHub, so the push needs no force.

## Self-review

Before opening a PR that changes code, run `/code-review` on the branch's
diff and fix what it confirms ([`AGENTS.md`](AGENTS.md) "Working loop", step
6). Skip it for docs-only changes and spikes.

## Watching PRs

After opening a PR, subscribe to its activity (`subscribe_pr_activity`) and
end the turn. CI results, review comments, and merge conflicts wake the
session; handle each one as [`docs/workflow.md`](docs/workflow.md) "Watching
CI" says. Unsubscribe once the PR is merged or closed. Don't subscribe to a
spike's draft PR — it's red by design.

Without that tool (a local session), check before handing back:
`gh pr checks <number> --watch`.

For a spike in a cloud session, where the branch name is assigned, the
`spike:` PR title is what marks it ([`docs/workflow.md`](docs/workflow.md)
"Spikes").

## Plans

A plan's tasks are native sub-issues: file each task issue, then attach it to
the plan with `sub_issue_write`, and read a plan's progress with
`issue_read` (`get_sub_issues`)
([`docs/spec-driven-development.md`](docs/spec-driven-development.md)
"Plans").

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
