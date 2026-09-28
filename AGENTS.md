# AGENTS.md — Canonical Guide for AI Coding Agents

This is the **authoritative guide** for how work is done in this repository, by
agents or humans. If another doc disagrees with this one, this one wins —
except that [`SPEC.md`](SPEC.md) is the source of truth for *what to build*;
this file is the source of truth for *how to work*.

Work here is done by **memoryless, cold-start sessions** — often scheduled,
often unattended. Nothing carries over between sessions except what is in the
repo and on GitHub (issues, PRs, review threads), so every rule below exists to
make one session's work legible to the next. Read order for a cold start:
**this file → the `SPEC.md` sections your issue cites → your issue's
acceptance criteria → the docs the
[routing table](#protocol-docs--read-when) sends you to.**

---

## 1. Purpose & scope

What the project is, and what it deliberately isn't, lives in one place:
[`SPEC.md`](SPEC.md) "Purpose & non-goals". Work in flight beyond single
issues is in [`docs/plans/`](docs/plans/README.md).

## 2. Hard rules

These hold for every change, whatever the issue says. A change that breaks one
is wrong even if CI is green.

- **Red CI is never merged**, and tests are never skipped, disabled, or
  weakened to get green ([`docs/ci-standards.md`](docs/ci-standards.md)).
- **Don't silently invent behavior.** If the spec or the issue is ambiguous
  or looks wrong, resolve it in the spec rather than guessing in code (§6).
- **The project's invariants hold** — [`SPEC.md`](SPEC.md) "Invariants".
- **One issue, one PR, its acceptance criteria only**
  ([`docs/scope-discipline.md`](docs/scope-discipline.md)).
- **The repo is the memory.** Decisions, follow-ups, and open questions go into
  docs, issues, and PR descriptions — never only into a chat transcript the next
  session can't see.

## 3. Repo layout

<!-- TEMPLATE: extend the tree with the project's own top-level directories.
Mark anything that doesn't exist yet as "(planned)" — build only what your
issue calls for. -->

```
/
├── AGENTS.md          # this file — how to work
├── SPEC.md            # what to build
├── CLAUDE.md          # Claude Code–specific notes
├── CONTRIBUTING.md    # setup and mechanics for humans
├── docs/              # protocol & standards docs (routing table in §4)
│   └── plans/         # active plans only — deleted when done
├── .claude/skills/    # project skills for Claude Code
└── .github/           # CI workflow, issue & PR templates
```

## 4. Working loop (every issue)

1. **Take one issue.** If you were handed one, work it. Otherwise take the next
   one from the queue ([`docs/issue-standards.md`](docs/issue-standards.md)
   "Picking up an issue"). Scope your work to that issue only.
2. **Read before you write.** Read the issue, the `SPEC.md` sections it
   cites, and every other doc it references before touching code. The
   acceptance criteria are your pre-written failing tests. `git log` on the
   files you'll touch is context too: each commit on `main` is one whole PR,
   with its why in the body.
3. **Test first.** Write a failing test (red), the minimal code to pass
   (green), then refactor — per behavior, not per module
   ([`docs/testing-standards.md`](docs/testing-standards.md)).
4. **Gate before commit.** The gate commands (§5) must be green locally. CI
   runs the same commands and must pass before merge.
5. **Commit atomically**, in Conventional Commits format
   ([`docs/commit-standards.md`](docs/commit-standards.md)).
6. **Open one PR per issue.** When the session's work is ready, open the PR —
   work is picked up by unattended sessions, so nobody is watching to ask for
   one. (Exception: you're explicitly told not to.) If the PR changes
   behavior, it updates `SPEC.md` too. Fill in the template and link the
   issue with `Closes #N`
   ([`docs/pr-standards.md`](docs/pr-standards.md)).

Changing only Markdown — no code? Steps 3–4 don't apply; use the leaner path in
[`docs/docs-only-changes.md`](docs/docs-only-changes.md).

### Protocol docs — read when

The working loop routes to these standards docs. Read each when its trigger
fires — you don't need all of them for every issue.

| Read | When |
|---|---|
| [`docs/spec-driven-development.md`](docs/spec-driven-development.md) | Reading, writing, or changing `SPEC.md`; the spec is silent or wrong; a change is too big for one PR. |
| [`docs/plans/README.md`](docs/plans/README.md) | Proposing a plan, opening or closing a phase, or finishing a plan. |
| [`docs/issue-standards.md`](docs/issue-standards.md) | Picking up, filing, scoping, or closing an issue; something out of scope surfaces mid-work. |
| [`docs/testing-standards.md`](docs/testing-standards.md) | Writing the failing test (step 3). |
| [`docs/commit-standards.md`](docs/commit-standards.md) | Writing a commit message (step 5); how history on `main` is shaped. |
| [`docs/pr-standards.md`](docs/pr-standards.md) | Branching, the pre-flight checklist, writing the PR title and description (they become the commit on `main`), screenshots, review (step 6). |
| [`docs/ci-standards.md`](docs/ci-standards.md) | Changing the CI workflow or the gate commands; CI fails in a way you don't understand. |
| [`docs/scope-discipline.md`](docs/scope-discipline.md) | Tempted to fold in adjacent work — why each PR stays tight to its issue. |
| [`docs/docs-only-changes.md`](docs/docs-only-changes.md) | Your change touches only Markdown — no code (skips steps 3–4). |
| [`docs/documentation-standards.md`](docs/documentation-standards.md) | Writing or editing any doc — source of truth, routing, keep-in-sync, and style rules. |
| [`docs/naming-conventions.md`](docs/naming-conventions.md) | Naming a file, doc, branch, label, or code identifier. |
| [`docs/doc-audit.md`](docs/doc-audit.md) | Reconciling the doc set for staleness and drift. |

## 5. Commands

<!-- TEMPLATE: fill in from the project's stack (a stack module supplies these
— see TEMPLATE.md). Use "—" for a task the stack doesn't have. -->

| Task | Command |
|---|---|
| Install | `{{INSTALL_CMD}}` |
| Lint | `{{LINT_CMD}}` |
| Format (check) | `{{FORMAT_CHECK_CMD}}` |
| Typecheck | `{{TYPECHECK_CMD}}` |
| Test | `{{TEST_CMD}}` |
| Build | `{{BUILD_CMD}}` |
| Run | `{{RUN_CMD}}` |

**The gate** is every row from Lint through Build. CI runs exactly these
commands: the `env:` block at the top of
[`.github/workflows/ci.yml`](.github/workflows/ci.yml) mirrors this table, and
a change to one is a change to both, in the same PR
([`docs/ci-standards.md`](docs/ci-standards.md)).

## 6. When in doubt

- **The spec is silent, ambiguous, or wrong** → don't guess. If proceeding
  means guessing at behavior or risking a hard rule (§2), stop: add an open
  question to `SPEC.md`, raise it on the issue/PR, and resolve it by editing
  the spec before writing code that depends on it
  ([`docs/spec-driven-development.md`](docs/spec-driven-development.md)).
- **Adjacent work** — an edge case, a follow-on idea, tech debt — gets filed as
  its own issue ([`docs/issue-standards.md`](docs/issue-standards.md)), not
  solved inline, left as a `TODO`, or folded into the current PR.
- **Doc drift you spot while working** → fix it in a separate docs-only PR, or
  file it; don't leave it, and don't fold it into an unrelated change
  ([`docs/doc-audit.md`](docs/doc-audit.md)).
