# Spec-Driven Build Module

Adds a written spec as the contract for *what to build*, and a phased build
order around it — for projects too large or too invariant-sensitive to steer
by issues alone.

## What it adds

| Concept | What it means |
|---|---|
| **Spec as contract** | `SPEC.md` is authoritative for what to build. Code conforms to the spec; the spec is never reverse-engineered from code. Ambiguity stops work and gets resolved by amending the spec, not by guessing. |
| **Invariants** | A short list of `INV-n` rules, stated canonically in `SPEC.md` §0 and glossed in `AGENTS.md` §2, that hold at every phase boundary. |
| **Versioned spec** | `spec-version` in semver; every amendment gets a one-line row in `SPEC.md` and full text in `docs/spec-changelog.md`. |
| **Phased build** | `SPEC.md` §6 splits the build into phases with Entry / Build / Exit criteria. One phase is active at a time. |
| **Phase cycle** | open issues → build → a **QA/QC pass** against the phase's Exit criteria → close the milestone → open the next phase. |
| **Milestones** | One `Development Phase N` milestone per phase, created by the repo owner; agents assign issues to it. |
| **Design track** | Decision records (`docs/design/NNNN-*.md`) and an open-questions list, so gaps in the spec are decided deliberately instead of by whichever session reaches them first. |
| **Conformance audits** | Periodic whole-build checks against the spec, filed as `[audit]` issues and interleaved with the phase queue. |

## Files

Copy everything in this directory except this README into the repo root,
preserving paths:

| File | Purpose |
|---|---|
| `SPEC.md` | The spec skeleton. |
| `docs/spec-guidelines.md` | How to amend the spec: versioning, invariant care. |
| `docs/spec-changelog.md` | Full text of every spec amendment. |
| `docs/roadmap.md` | Phase status table, the phase cycle, the audit and design tracks. |
| `docs/milestone-practices.md` | How milestones map to phases. |
| `docs/design/README.md` | Decision-record format and the design track. |
| `docs/design/open-questions.md` | Questions flagged rather than silently decided. |

## Edits to core files

Apply these when adopting, so the core points at the spec instead of standing
alone.

- [ ] **`AGENTS.md` preamble** — "…except that [`SPEC.md`](SPEC.md) is the
      source of truth for *what to build*; this file is the source of truth
      for *how to work*." Read order: **this file → the SPEC section your
      issue references → your issue's acceptance criteria.**
- [ ] **`AGENTS.md` §1** — summarize the purpose in a few lines and point at
      `SPEC.md` §1.
- [ ] **`AGENTS.md` §2** — replace the project-invariants block with one line
      per invariant (`INV-n` — short name — one-line gloss) and state that
      `SPEC.md` §0 is the canonical statement; the glosses are not a second
      copy to keep in sync.
- [ ] **`AGENTS.md`, new section before the working loop: "Build order"** —
      work proceeds phase by phase (`SPEC.md` §6); don't start phase N+1 until
      phase N's QA/QC pass confirms its Exit criteria; live status is in
      `docs/roadmap.md`.
- [ ] **`AGENTS.md` §4 step 2** — "Read the SPEC section the issue references
      before touching code."
- [ ] **`AGENTS.md` routing table** — add rows for `docs/roadmap.md`,
      `docs/milestone-practices.md`, `docs/spec-guidelines.md`, and
      `docs/design/README.md`.
- [ ] **`docs/issue-standards.md` "Picking up an issue"** — the queue becomes:
      lowest-numbered open issue labeled with the **active phase**
      (`phase:N`); compare it against the lowest-numbered open `[audit]` issue
      and take whichever number is lower; when no phase is active, take the
      lowest-numbered open `design` issue whose dependencies are resolved.
- [ ] **`docs/issue-standards.md` "Labels"** — add `phase:N`, `design`, and
      `spec-revision`; build issues are labeled `phase:N` + `task` and
      assigned to the `Development Phase N` milestone.
- [ ] **`.github/ISSUE_TEMPLATE/feature_task.md`** — title prefix
      `"[phase:N] "`; rename "Context" to "Spec reference" (which `SPEC.md`
      section this implements).
- [ ] **`.github/ISSUE_TEMPLATE/bug_report.md`** — "Expected" cites the
      `SPEC.md` section; "Notes" names the invariant (`INV-n`) touched, if any.
- [ ] **`.github/pull_request_template.md`** — add a `## Spec section` after
      "Linked issue"; code checklist gains "Compliant with the invariants
      (`INV-1`..`INV-n`) and this phase only"; docs-only checklist gains "If
      `SPEC.md` changed: versioned per `docs/spec-guidelines.md`."
- [ ] **`docs/documentation-standards.md` "Source of truth"** — add the
      `SPEC.md` bullet.
- [ ] **`docs/docs-only-changes.md`** — a `SPEC.md` change still follows
      `docs/spec-guidelines.md`, whichever path it takes.
- [ ] **`docs/scope-discipline.md` "Out-of-scope list"** — point at the
      spec's out-of-scope phase (`SPEC.md` §6, last subsection).
- [ ] **GitHub** — create the labels above and the `Development Phase 0`
      milestone.
