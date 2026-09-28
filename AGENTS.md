# AGENTS.md — Canonical Guide for AI Coding Agents

This is the **authoritative guide** for how work is done in this repository, by
agents or humans. If another doc disagrees with this one, this one wins.

<!-- TEMPLATE: if the project has a separate source of truth for *what to
build* (a spec, a design doc), name it here: "…except that SPEC.md is the
source of truth for what to build; this file is the source of truth for how to
work." -->

Work here is done by **memoryless, cold-start sessions** — often scheduled,
often unattended. Nothing carries over between sessions except what is in the
repo and on GitHub (issues, PRs, review threads), so every rule below exists to
make one session's work legible to the next. Read order for a cold start:
**this file → your issue's acceptance criteria → the docs the
[routing table](#protocol-docs--read-when) sends you to.**

---

## 1. Purpose & scope

<!-- TEMPLATE: 2–5 sentences. What the project is, what it ships, and what it
deliberately is not. Link the source of truth for what to build, if there is
one, rather than restating it. -->

{{PROJECT_PURPOSE}}

## 2. Hard rules

These hold for every change, whatever the issue says. A change that breaks one
is wrong even if CI is green.

- **Red CI is never merged**, and tests are never skipped, disabled, or
  weakened to get green ([`docs/ci-standards.md`](docs/ci-standards.md)).
- **Don't silently invent behavior.** If the issue or the docs it cites are
  ambiguous or look wrong, raise it rather than guessing in code (§6).
- **One issue, one PR, its acceptance criteria only**
  ([`docs/scope-discipline.md`](docs/scope-discipline.md)).
- **The repo is the memory.** Decisions, follow-ups, and open questions go into
  docs, issues, and PR descriptions — never only into a chat transcript the next
  session can't see.

<!-- TEMPLATE: project invariants. List the project's own non-negotiables as
stable one-line statements with an ID that docs, issues, and tests can cite:

- **`INV-1` — Short name.** One-line statement.

Keep churn-prone mechanics (which lint rule or test enforces an invariant, which
phase added it) out of this list — put those in a doc under docs/ and link it,
so updating the mechanics never means diffing the rules. Delete this block if
the project has none yet. -->

## 3. Repo layout

<!-- TEMPLATE: extend the tree with the project's own top-level directories.
Mark anything that doesn't exist yet as "(planned)" — build only what your
issue calls for. -->

```
/
├── AGENTS.md          # this file — how to work
├── CLAUDE.md          # Claude Code–specific notes
├── CONTRIBUTING.md    # setup and mechanics for humans
├── docs/              # protocol & standards docs (routing table in §4)
├── .claude/skills/    # project skills for Claude Code
└── .github/           # CI workflow, issue & PR templates
```

## 4. Working loop (every issue)

1. **Take one issue.** If you were handed one, work it. Otherwise take the next
   one from the queue ([`docs/issue-standards.md`](docs/issue-standards.md)
   "Picking up an issue"). Scope your work to that issue only.
2. **Read before you write.** Read the issue and every doc or source it
   references before touching code. The acceptance criteria are your
   pre-written failing tests.
3. **Test first.** Write a failing test (red), the minimal code to pass
   (green), then refactor — per behavior, not per module
   ([`docs/testing-standards.md`](docs/testing-standards.md)).
4. **Gate before commit.** The gate commands (§5) must be green locally. CI
   runs the same commands and must pass before merge.
5. **Commit atomically**, in Conventional Commits format
   ([`docs/commit-standards.md`](docs/commit-standards.md)).
6. **Open one PR per issue.** When the session's work is ready, open the PR —
   work is picked up by unattended sessions, so nobody is watching to ask for
   one. (Exception: you're explicitly told not to.) Fill in the template and
   link the issue with `Closes #N`
   ([`docs/pr-standards.md`](docs/pr-standards.md)).

Changing only Markdown — no code? Steps 3–4 don't apply; use the leaner path in
[`docs/docs-only-changes.md`](docs/docs-only-changes.md).

### Protocol docs — read when

The working loop routes to these standards docs. Read each when its trigger
fires — you don't need all of them for every issue.

| Read | When |
|---|---|
| [`docs/issue-standards.md`](docs/issue-standards.md) | Picking up, filing, scoping, or closing an issue; something out of scope surfaces mid-work. |
| [`docs/testing-standards.md`](docs/testing-standards.md) | Writing the failing test (step 3). |
| [`docs/commit-standards.md`](docs/commit-standards.md) | Writing a commit message (step 5). |
| [`docs/pr-standards.md`](docs/pr-standards.md) | Branching, opening a PR, adding screenshots, or answering review (step 6). |
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

- **Ambiguous or wrong-looking requirements** → don't guess. If proceeding
  means guessing at defined behavior or risking a hard rule (§2), stop and
  raise it on the issue/PR; if the source of truth itself is wrong, fix it
  there first rather than diverging in code.
- **Adjacent work** — an edge case, a follow-on idea, tech debt — gets filed as
  its own issue ([`docs/issue-standards.md`](docs/issue-standards.md)), not
  solved inline, left as a `TODO`, or folded into the current PR.
- **Doc drift you spot while working** → fix it in a separate docs-only PR, or
  file it; don't leave it, and don't fold it into an unrelated change
  ([`docs/doc-audit.md`](docs/doc-audit.md)).
