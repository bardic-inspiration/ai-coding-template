# Roadmap

The phase-by-phase build order ([`SPEC.md`](../SPEC.md) §6): the
[development-phases table](#development-phases) is the live status index, and
[The phase cycle](#the-phase-cycle) is the canonical open/close procedure —
other docs point here rather than restating either.

**Current status:** <!-- TEMPLATE: one or two lines — the active phase, and
what's next. --> Phase 0 not yet opened.

## Development phases

`SPEC.md` §6.x is the source of truth for each phase's Entry / Build / Exit
criteria — this table is a status index, not a second copy of them. Each phase
has one `Development Phase N` milestone
([`milestone-practices.md`](milestone-practices.md)).

| Phase | Deliverable | SPEC | Milestone | Status |
|---|---|---|---|---|
| 0 | Repository scaffold — toolchain, layout, CI gate wired | §6.1 | Development Phase 0 | Not started |
| 1 | {{PHASE_1_NAME}} | §6.2 | Development Phase 1 | Not started |
| — | Out of scope | §6.N | — | Out of scope |

A phase becomes **active** when its issues are opened; it (and its milestone)
**closes** at the end of its QA/QC pass. A completed phase's QA/QC record lives
in the PR that closed its last issue — not duplicated here.

## The phase cycle

Every phase runs the same loop: **open its issues → build them → QA/QC pass →
close the milestone → open the next phase.** This section is the single place
the open/close conditions are defined. The per-issue working loop that step 3
wraps lives in [`AGENTS.md`](../AGENTS.md) §4.

1. **Confirm entry.** The previous phase's Exit criteria hold — verified by its
   QA/QC pass (none to check for Phase 0) — and no open `design` issue blocks
   this phase.
2. **Open the issues.** Confirm the phase's milestone exists (the repo owner
   creates it), then open one issue per item in the phase's `SPEC.md` §6.x
   **Build** list — each sized for one PR, labeled `phase:N` + `task`, and
   assigned to the milestone.
3. **Build.** Sessions work the phase's issues through the working loop,
   lowest-numbered first, one PR each, CI green per PR. The PR that closes the
   phase's last issue updates this phase's **Status** above.
4. **QA/QC pass — the phase gate.** Once every issue is merged, run a
   comprehensive quality pass **before** closing the milestone. Per-PR CI proves
   each slice in isolation; this pass proves the **assembled phase**:
   - Walk the `SPEC.md` §6.x **Exit** checklist item by item against the
     integrated code — including criteria no single issue owned, and the seams
     between issues.
   - Re-run the full gate across the whole repo, including every invariant
     test that applies.
   - Confirm the docs and any surface changelogs match what actually shipped.
   - **Record the result** — the Exit checklist, checked off — in the PR that
     closes the phase's last issue. A failed or partial pass is not a close:
     file the gaps as issues in the same phase and finish them first.
5. **Close and open the next.** A phase and its milestone close only when every
   issue is resolved **and** the QA/QC pass has confirmed every Exit
   criterion. Then return to step 1 for the next phase.

## Conformance audit track

Alongside the phase queue, periodic **conformance audits** check the assembled
build — code, fixtures, docs — against the current `SPEC.md`, including seams
between phases that no single phase's QA/QC pass owns. Findings are filed as
`[audit]`-titled issues (`bug` or `task`, no `phase:N` label).

**Queue rule.** `[audit]` issues interleave with the phase queue rather than
waiting behind it: compare the lowest-numbered open `phase:N` issue with the
lowest-numbered open `[audit]` issue and take whichever is lower
([`issue-standards.md`](issue-standards.md) "Picking up an issue").

## Design track

Gaps and ambiguities in the spec are decided deliberately as `design` issues
(no `phase:N` label), recorded in [`design/`](design/README.md), and amended
into `SPEC.md` per [`spec-guidelines.md`](spec-guidelines.md). When no phase is
active, the design track is the queue: the lowest-numbered open `design` issue
whose dependencies are resolved. An open `design` issue that a phase depends on
blocks that phase from opening (the phase cycle, step 1).
