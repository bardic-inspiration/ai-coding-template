# Docs-Only Changes

A leaner issue/PR protocol for changes that touch **only** Markdown. The
test-first and gate steps of the working loop ([`AGENTS.md`](../AGENTS.md) §4)
exist to protect code correctness; they have nothing to check on a change that
contains no code.

## What qualifies

A change is **docs-only** when **every changed file ends in `.md`** —
`AGENTS.md`, `CLAUDE.md`, `README.md`, anything under `docs/`, the issue and PR
templates, skill files, and so on.

Anything else in the diff — source, tests, fixtures, the CI workflow, config,
a lockfile — makes it a **code change**, and the whole PR follows the normal
protocol. When in doubt, treat it as a code change.

## Filing an issue

- **Substantive** changes (a new or restructured standards doc, a change to a
  rule) get an issue using the lighter
  [Docs change template](../.github/ISSUE_TEMPLATE/docs_change.md) — no
  acceptance criteria to test, since there's no code.
- **Trivial, mechanical** fixes (typos, broken links, formatting, a stale
  status line) need no issue — open the PR directly, without `Closes #N`.

## PR & commit

- **Skip:** writing tests first, running the gate locally, and the code
  checklist in the PR template.
- **Still required:**
  - commit type `docs` ([`commit-standards.md`](commit-standards.md)), atomic
    commits;
  - correct content and links that resolve;
  - cross-references updated in the same PR when a shared term, identifier, or
    section number changes
    ([`documentation-standards.md`](documentation-standards.md) "Keep in sync");
  - no process narration in doc content — that belongs in the PR description
    ([`documentation-standards.md`](documentation-standards.md) "Product docs,
    not process");
  - the `## TL;DR` on both the issue (if any) and the PR;
  - the docs-only checklist in the
    [PR template](../.github/pull_request_template.md).

## CI

[`ci.yml`](../.github/workflows/ci.yml) detects a Markdown-only diff from the
changed-file list and skips install and the code gate automatically — the job
still runs and reports green, it just has nothing to build. No label or flag is
needed. Doc checks the project configures (`DOCS_CHECK_CMD`) still run
([`ci-standards.md`](ci-standards.md)).

If CI does *not* take the fast path, a non-Markdown file is in the diff — the
change isn't docs-only after all. Treat it as a code change rather than trying
to force the skip.
