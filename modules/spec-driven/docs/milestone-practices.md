# Milestone Practices

How GitHub milestones map to the build phases. A milestone groups a phase's
issues and PRs and gives each phase one status page. Milestones complement the
`phase:N` labels ([`issue-standards.md`](issue-standards.md)) and the phase
table in [`roadmap.md`](roadmap.md).

## One milestone per phase

- Each phase in `SPEC.md` §6 has exactly one milestone, named
  **`Development Phase N`**.
- **The repo owner creates phase milestones** — agents don't. Agents file and
  assign issues into a milestone that already exists; they never create one as
  a side effect of opening an issue.
- Out-of-scope work (`SPEC.md` §6, last subsection) gets no `phase:N` label and
  no phase milestone until it is deliberately scoped into the build.

## Agents assign issues by phase

- Every build issue is labeled `phase:N` + `task` **and** assigned to the
  matching `Development Phase N` milestone. The label routes the queue; the
  milestone tracks completion.
- A PR inherits its issue's phase through `Closes #N` — assign the issue, not
  the PR.

## Descriptions point, they don't copy

- A milestone description states the phase's **deliverable in one line** and
  **points at `SPEC.md` §6.x** for its Entry / Build / Exit criteria. It never
  restates them — duplication drifts
  ([`documentation-standards.md`](documentation-standards.md)).
- Because the description is a pointer, a spec amendment doesn't require
  editing the milestone. Revise a description only when the phase's
  deliverable or spec reference itself changes.

## When a milestone closes

A phase milestone is the phase's done-marker. It closes at the end of the
phase's QA/QC pass — the single close condition defined in
[`roadmap.md`](roadmap.md) "The phase cycle". Don't close it while any Exit
criterion is unmet, even if every issue is closed; don't leave it open once the
pass has confirmed them.
