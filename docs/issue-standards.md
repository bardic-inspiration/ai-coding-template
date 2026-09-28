# Issue Standards

The canonical reference for picking up, filing, scoping, and closing issues.
The goal is **iterative, traceable work**: every PR maps to exactly one issue,
and anything that surfaces mid-work but isn't in scope gets a paper trail
instead of getting lost or silently folded in.

## Picking up an issue

- **If you were handed an issue, work that one.**
- **Otherwise, take the next one from the queue:** the lowest-numbered open
  issue labeled `task` or `bug` that
  - has no open PR already linked to it,
  - isn't labeled `needs-discussion`, and
  - has every issue it names under "Depends on" closed.

  Lowest-numbered-first keeps independent sessions from racing each other and
  lets filing order encode dependency order — file prerequisites first.
- Read the issue and everything it references before touching code.
- Scope work to **that issue only** — don't range ahead, and don't pull in
  adjacent cleanup that isn't part of the acceptance criteria.

<!-- TEMPLATE: modules may extend the queue rule (e.g. spec-driven: pick only
from the active phase's label, interleaved with audit findings). Record the
extension here so this stays the one place the queue is defined. -->

## Filing an issue

Use the template that fits:

- **[Feature / task](../.github/ISSUE_TEMPLATE/feature_task.md)** — a new
  capability or change sized for one PR. Requires: goal, context (what it
  builds on), testable acceptance criteria, and an explicit "Out of scope".
- **[Bug report](../.github/ISSUE_TEMPLATE/bug_report.md)** — behavior that
  contradicts the docs or reasonable expectation. Requires: what happened,
  what was expected (cite the doc that says so), a minimal reproduction, and
  environment.
- **[Docs change](../.github/ISSUE_TEMPLATE/docs_change.md)** — a substantive
  Markdown-only change ([`docs-only-changes.md`](docs-only-changes.md)).

Every issue, whatever the template:

- **Is sized for one PR.** If it won't fit, it isn't one issue — split it
  before starting, not mid-implementation.
- **Has testable acceptance criteria** (code issues). They are the pre-written
  failing tests ([`testing-standards.md`](testing-standards.md)) — if a
  criterion can't become a test, it isn't specific enough yet.
- **States what's out of scope.** This is the primary guard against scope
  creep ([`scope-discipline.md`](scope-discipline.md)).
- **Names its dependencies** as a `Depends on #N` line, so the queue rule
  above can skip it until they close.
- **Ends with a `## TL;DR`:** a few plain-English bullet points, no jargon —
  why the issue exists and what changes once it's done. Someone unfamiliar
  with the code should get the point from that section alone. The templates
  have it built in — fill it in, don't delete it.
- **Is labeled** (below).

## Labels

| Label | Meaning |
|---|---|
| `task` | A feature or change sized for one PR. In the queue. |
| `bug` | Behavior that contradicts the docs or reasonable expectation. In the queue. |
| `documentation` | A substantive docs-only change. |
| `needs-discussion` | Needs a human decision before anyone builds it. Out of the queue until the label comes off. |

Label names are lowercase and colon-scoped where hierarchical
([`naming-conventions.md`](naming-conventions.md)).

## Linking issues to PRs

- Every PR closes exactly one issue with `Closes #N`
  ([`pr-standards.md`](pr-standards.md)). Trivial docs fixes are exempt
  ([`docs-only-changes.md`](docs-only-changes.md)).
- Issues close **only** via a merged PR carrying `Closes #N`. Closing by hand
  outside that flow breaks the trace from issue to the commit that resolved it.
- An issue that turns out invalid, superseded, or out of scope is closed with a
  comment saying why (and the matching close reason — "not planned",
  "duplicate") — never deleted or left to go stale silently.

## Open questions & follow-ups that surface mid-work

Sessions and reviewers alike surface things beyond the issue in front of them —
edge cases, ambiguities, follow-on work. Handle them without losing scope or
traceability:

- **Don't solve it inline.** Finish the issue you were given first. An open
  question is not license to widen the current PR.
- **Ambiguity or a defect in the source of truth** (the acceptance criteria
  conflict with the docs, or the docs look wrong) → don't silently invent
  behavior. Raise it on the issue; if the docs are wrong, fix them deliberately
  before writing code that guesses.
- **Everything else** (an out-of-scope edge case, a deferred feature, tech
  debt, a later idea) → file it as a **new issue** using the rules above — not
  a `TODO` comment, and not a note buried in a PR description where it will rot.
  - Reference the origin in the new issue's body ("Surfaced while working #N")
    so the chain stays traceable.
- **Link back once.** In the PR that surfaced it, add a single line ("Opened #N
  for X, out of scope here"). Don't re-explain it in every later PR — the
  issue is the record.
- **Don't block on it** — unless it's the ambiguity case above, where guessing
  would risk a hard rule ([`AGENTS.md`](../AGENTS.md) §2).

## Quick decision rule

When something unplanned comes up mid-issue, ask one question: **does
proceeding require guessing at defined behavior, or risk a hard rule?**

- **Yes** → stop. Don't guess; raise it and resolve it before continuing.
- **No** → keep going on the current issue; file a new issue for the rest.
