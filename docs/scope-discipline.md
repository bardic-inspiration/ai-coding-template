# Scope Discipline

Why each PR stays tight to its issue, and how to keep it there.

Work here is done by many independent, memoryless sessions. Nobody tracks
"temporary" scope expansion across sessions, so an out-of-scope change never
gets cleaned up later — it just becomes permanent drift from the issue trail.
Keeping each PR tight to its issue is the single discipline that holds the
project together across cold starts. Treat every PR's diff as if a reviewer
will check it file by file against the acceptance criteria, because eventually
one will.

## The rule

- **Implement the acceptance criteria — nothing more.** Once you're in the
  code, the issue's acceptance criteria are the entire spec for the PR. A file
  or module the criteria don't mention isn't part of this PR, even if the
  change is one line and obviously correct.
- **Don't fold in adjacent work.** No drive-by refactors, no "while I'm in
  here" fixes, no changes a later issue will obviously need — even when they're
  small. A PR touching files the acceptance criteria don't call for is a sign
  of drift; narrow it back down before committing.
- **File, don't fold.** Work worth doing that isn't in scope becomes its own
  issue ([`issue-standards.md`](issue-standards.md)), referencing the origin
  ("Surfaced while working #N") so the chain stays traceable. The one
  exception is ambiguity that would risk a hard rule
  ([`AGENTS.md`](../AGENTS.md) §2) — that stops the work and gets resolved,
  not deferred.
- **A PR that outgrows its issue means the issue was under-scoped** — not that
  the PR may expand. Split the extra ground into new issues and keep the PR
  narrow.

## Out-of-scope lists

Two lists name the tempting-but-out-of-scope work — the likeliest source of
creep, because it looks adjacent:

- [`SPEC.md`](../SPEC.md) "Purpose & non-goals" — what the project never does.
- Each active plan's "Out of scope" ([`plans/`](plans/README.md)) — what this
  stretch of work leaves for later.

## Examples

Concrete drift-vs-in-scope cases collect here as they surface in review. Leave
each with the issue or PR it came from so the pattern is traceable.
