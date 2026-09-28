# Spec-Driven Development

What a spec contains, how to build from it, and how to keep it useful long
after the first build.

[`SPEC.md`](../SPEC.md) is the source of truth for **what to build**;
[`AGENTS.md`](../AGENTS.md) is the source of truth for **how to work**. Code
conforms to the spec — the spec is never reverse-engineered from code.

## Three tenses, three homes

Specs rot when one document carries three tenses: the design, the plan to
build it, and the history of how it was decided. Once the build is done, a
cold-start session can no longer tell which statements describe the system.
Keep them apart:

| Kind | Tense | Lives in | Lifespan | A session reads it |
|---|---|---|---|---|
| **Spec** | Present — what the system is and must do | `SPEC.md` | The life of the project, edited in place | Always: the sections its issue cites |
| **Plan** | Future — how to get from here to there | [`docs/plans/`](plans/README.md) | Until its exit criteria hold — then deleted | Only while it's active |
| **History** | Past — what changed, and why | git: squash commits, PRs, issues | Forever | On demand, never by default |

**The working tree holds the present and the active future; git holds the
past.** A document that has done its job is deleted, not archived — an archive
in the tree is noise in every search a session runs.

## What a spec contains

The shape varies by project: a small tool's spec may fit on one page; a
system's may be split across files. Keep the parts the project needs, in this
order, and drop the rest.

| Part | Contains | Leave out |
|---|---|---|
| **Purpose & non-goals** | What the project is, who it's for, and what it deliberately isn't. The non-goals are the scope guard. | Pitch, roadmap. |
| **Invariants** | 3–7 timeless, testable rules, each with a stable ID (`INV-1`). A change that breaks one is wrong even if CI is green. | How each is enforced — that lives in the test or lint rule that names it. |
| **Concepts** | The core nouns, each defined once. | |
| **Architecture** | Components, what each owns, and the boundaries between them. | File layout the code already shows. |
| **Interfaces** | Every surface other code or people depend on — types, APIs, file formats, CLI — precise enough to test against. | Internal helpers. |
| **Behavior** | Rules, state transitions, and error cases, at the precision a test can be written from. | Implementation choices with no observable effect. |
| **Quality bars** | Budgets as numbers: latency, size, supported platforms, security posture. | Aspirations without a number. |
| **Open questions** | What is still undecided. **Not contract** — don't build against it; resolve it first. | Anything decided. |

**Never in the spec:** build phases or task lists (a plan), status ("done",
"in progress"), amendment history or version annotations, meeting notes, and
long accounts of rejected alternatives (the PR).

## Writing it

- **Present tense, current state.** "The server rejects bodies over 1 MiB" —
  not "we decided the server will…", not "(refined in 0.9)". Superseded text
  is replaced, never struck through or annotated.
- **Testable.** Every behavioral statement can become an acceptance criterion.
  If it can't, it isn't precise enough yet.
- **Rationale in a line, deliberation in the PR.** A non-obvious rule may carry
  a one- or two-line `Why:` so nobody relitigates it by accident. The options
  weighed and the debate go in the PR description, which becomes the squash
  commit body ([`pr-standards.md`](pr-standards.md)).
- **Say when something isn't built yet.** Everything in the spec is true of
  `main`, except text marked **`Planned (plan NNNN):`**. The PR that makes it
  true removes the marker. During a greenfield build, the header's
  `status: building` covers the whole spec instead.
- **Cite by ID, not position.** Refer to invariants and sections by ID or
  heading, not by numbers that shift when the spec is reorganized.
- **One home per fact** ([`documentation-standards.md`](documentation-standards.md)).
  Other docs point at the spec; the spec doesn't copy them.
- **Split when it's too long to read by section.** Past a few hundred lines,
  move areas into `docs/spec/<area>.md` and keep `SPEC.md` as the index:
  purpose, invariants, and a routing table to the areas.

## Using it

- **Issues cite the spec.** A task names the spec section it implements, and
  its acceptance criteria are derived from that section's statements
  ([`issue-standards.md`](issue-standards.md)).
- **Read before you write.** A session reads the cited sections before
  touching code ([`AGENTS.md`](../AGENTS.md) §4).
- **Spec and code change together.** A PR that changes behavior updates the
  spec in the same PR, so the two never disagree on `main`.
- **Ambiguity stops work.** If the spec is silent or looks wrong, don't invent
  behavior. Add an open question, and resolve it by editing the spec before
  writing the code that depends on it.
- **Disagreement is a bug.** If code and spec disagree on `main`, one of them
  is wrong: file an issue, decide which, and fix that one.
- **History is in git.** `git log -- SPEC.md` lists every spec change — one
  squash commit per PR, with its why in the body. There is no changelog file,
  amendment table, or spec version. Surfaces that outside code depends on are
  versioned individually ([`commit-standards.md`](commit-standards.md)
  "Versioned surfaces").

## Plans

A **plan** turns a spec change too big for one PR into ordered work. The first
build is a plan; so is any large feature afterwards.

- The plan's PR writes the new or changed behavior into the spec, marked
  `Planned`. The plan itself holds only the *how*: phases, each with
  Entry / Build / Exit criteria.
- A phase's issues are filed when the phase opens, not before, so the queue
  only ever holds work that's ready.
- A phase closes on a **QA pass**: walk its Exit criteria against the
  assembled `main`, re-run the full gate, and confirm the spec describes what
  shipped. The checked-off criteria go in the description of the PR that
  closes the phase, so the record lands in git.
- **The PR that closes the last phase deletes the plan.** By then the spec
  describes the result, and git holds the plan.

Format and lifecycle: [`plans/README.md`](plans/README.md).

## Keeping it lean

The doc audit ([`doc-audit.md`](doc-audit.md)) checks that:

- the spec describes `main` — no stale statements, and no `Planned` marker
  whose plan is finished or gone;
- the spec carries no history — no version annotations, amendment tables, or
  past-tense narration;
- `docs/plans/` holds only active plans, and resolved open questions are gone.

Periodically, a **conformance audit** checks `main` against the whole spec,
including the seams no single issue owned. Its findings are ordinary `bug` and
`task` issues.

## Re-baselining a spec that has absorbed its history

When a spec already carries amendment markers, a finished build plan, and
resolved design records, reset it in one docs-only PR:

1. **Tag the last commit before the reset** — `git tag spec-baseline-<date>` —
   so the old doc set stays one command away: `git show <tag>:SPEC.md`.
2. **Rewrite `SPEC.md` in the present tense.** Fold each amendment and
   resolved decision into the text it changed, and strip the markers.
3. **Move anything still unbuilt into a plan**, marked `Planned` in the spec.
   Delete finished plans, surveys, decision records, and changelogs.
4. **Use the PR description as the map:** what was deleted, where each
   surviving idea now lives, and the tag name. It becomes the commit on
   `main`.
