# {{PROJECT_NAME}} — Build Specification

`spec-version: 0.1.0`
`status: draft`
`audience: coding-agent + human-maintainer`

> **Amendment history.** A one-line pointer per amendment — the full text of
> each lives in [`docs/spec-changelog.md`](docs/spec-changelog.md), with the
> decision record in `docs/design/` where there is one
> ([`docs/spec-guidelines.md`](docs/spec-guidelines.md)).

| Amendment | Summary | Decision record |
|---|---|---|
| — | No amendments yet. | — |

## 0. Purpose and Reading Order

This document is the authoritative build specification for
{{PROJECT_NAME}}. It is written to drive a phased, iterative, agent-driven
build: each phase in §6 is independently checkable, listing what to create and
pass/fail done-criteria.

**Read order for a coding agent starting fresh:** §1 (concepts) → §2
(architecture) → §3 (interfaces, verbatim) → the §6 phase you are on. §4–§5 are
reference material to consult when a phase requires them, not sequential
reading.

**Non-negotiable invariants** (referenced throughout as `INV-n`; must hold at
every phase boundary):

<!-- TEMPLATE: 3–7 invariants. Each is a timeless statement that a test or lint
rule can check — what must always be true, not how it's currently enforced
(that goes in a mechanics doc). Changing one later is a MAJOR amendment. -->

- `INV-1`: {{INVARIANT}}

---

## 1. Concept Summary

<!-- TEMPLATE: what the project is, in terms a newcomer can hold in their head.
Define the core nouns here; the glossary (§8) collects them. -->

## 2. System Architecture

<!-- TEMPLATE: components, how they connect, and which boundaries are
invariants. A diagram or tree is better than prose. -->

## 3. Interfaces & Data Schemas

<!-- TEMPLATE: every surface other code depends on — types, wire formats, file
formats, APIs — stated verbatim, so an implementation can be checked against
it. End with the versioning rules. -->

### 3.N Versioning Rules

Every surface in this section is versioned. Additive changes are a MINOR bump;
renaming or removing anything is a MAJOR bump. A change to a surface ships with
its changelog entry in the same commit.

## 4. Behavior

<!-- TEMPLATE: the core logic — algorithms, rules, state transitions, error
handling — at the precision a test can be written against. -->

## 5. External Contracts

<!-- TEMPLATE: how the outside world talks to the system (API endpoints, CLI,
adapters) and how conformance is checked. -->

## 6. Phased Build Plan

Each phase has explicit **Entry** (what must already be true), **Build** (what
to create), and **Exit** (checkable done-criteria) conditions. A coding agent
must not begin phase N+1 until phase N's Exit criteria are all met — confirmed
by the phase's QA/QC pass ([`docs/roadmap.md`](docs/roadmap.md) "The phase
cycle").

### 6.1 Phase 0 — Repository Scaffold

**Entry**: The template is adopted; no project code exists.

**Build**:

<!-- TEMPLATE: the directory tree to create, the toolchain, the empty packages
or modules. -->

- The toolchain and repo layout (`AGENTS.md` §3).
- The gate commands, filled in `AGENTS.md` §5 and mirrored in the CI `env:`
  block.

**Exit**:

- [ ] Install and every gate command run green locally on an empty or trivial
      test suite.
- [ ] CI runs those commands, with `GATE_REQUIRED` set to `"true"`, and is
      green.
- [ ] The repo layout matches `AGENTS.md` §3.

### 6.2 Phase 1 — {{PHASE_1_NAME}}

**Entry**: Phase 0 Exit criteria met.

**Build**:

**Exit**:

- [ ] …

### 6.N Out of Scope

Listed here so a coding agent doesn't scope-creep into these during the
phases above:

- …

---

## 7. Open Questions

Open questions are tracked in
[`docs/design/open-questions.md`](docs/design/open-questions.md), keeping this
contract to settled decisions rather than deferred ones.

---

## 8. Glossary

| Term | Meaning |
|---|---|
| | |
