# Plan 0001 — Initial Build

`status: active — phase 0`

<!-- TEMPLATE: the greenfield build plan. Phase 0 is the same for every
project; add phases to reach the first release. Delete this plan (and its row
in README.md) in the PR that closes its last phase — see README.md
"Lifecycle". -->

## Goal

Build the system described in [`SPEC.md`](../../SPEC.md), from an empty
repository to {{FIRST_RELEASE}}.

## Spec changes

All of `SPEC.md` — its header reads `status: building` until this plan
finishes, then `status: current`.

## Phases

### Phase 0 — Repository scaffold

**Entry:** The template is adopted; no project code exists.

**Build:**

- The toolchain and the repo layout in [`AGENTS.md`](../../AGENTS.md) §3.
- The gate commands, filled in `AGENTS.md` §5 and mirrored in the `env:` block
  of `.github/workflows/ci.yml`.

**Exit:**

- [ ] Install and every gate command run green locally on an empty or trivial
      test suite.
- [ ] CI runs them with `GATE_REQUIRED: "true"`, and is green.
- [ ] The repo layout matches `AGENTS.md` §3.

### Phase 1 — {{PHASE_1_NAME}}

**Entry:** Phase 0 Exit criteria hold.

**Build:**

- …

**Exit:**

- [ ] …

## Out of scope

<!-- TEMPLATE: what the first release deliberately leaves for later plans. The
spec's non-goals cover what the project never does. -->
