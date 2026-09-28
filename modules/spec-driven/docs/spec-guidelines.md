# Spec Guidelines

How to change [`SPEC.md`](../SPEC.md) when it genuinely needs to change.

## The spec is the contract

- Build to the spec. Code conforms to it; the spec is never reverse-engineered
  from code.
- If the spec is ambiguous or looks wrong, **don't silently invent behavior in
  code.** Raise it on the issue or PR.
- If it's a real defect or a needed change, amend `SPEC.md` deliberately and in
  a versioned way (below) — then make the code conform.

## Versioning the spec

`spec-version` in the `SPEC.md` header is semver:

| Bump | When |
|---|---|
| **MAJOR** | An invariant changes, or a versioned surface (`SPEC.md` §3) breaks — a field renamed or removed, a grammar changed. |
| **MINOR** | Additive, non-breaking — a new field, a new allowed value, a new endpoint. |
| **PATCH** | A clarification or a recorded decision with no surface change — naming a default, resolving an open question. |

## Making an amendment

In one PR:

1. Edit the spec text and bump `spec-version`.
2. Add a one-line row to the amendment table at the top of `SPEC.md`.
3. Add the full entry to [`spec-changelog.md`](spec-changelog.md) — what
   changed, why, and what it resolves.
4. If the decision needed real deliberation, record it in `docs/design/`
   ([`design/README.md`](design/README.md)) and link it from both.
5. If an open question is resolved, strike it from
   [`design/open-questions.md`](design/open-questions.md).

## Invariants

- The canonical statement of each invariant lives in `SPEC.md` §0 — nowhere
  else. `AGENTS.md` §2 carries only a one-line gloss and a pointer.
- Keep churn-prone mechanics (which lint rule enforces an invariant, which
  phase added a check, the exact seed-derivation formula) in a separate notes
  doc linked from `AGENTS.md` §2, so updating the mechanics never means
  diffing the constitution.
- Changing an invariant is a MAJOR, deliberate decision that ripples through
  every phase. Amend §0, then update the `AGENTS.md` glosses and the mechanics
  doc to match, in the same PR.

## Editing hygiene

- Preserve section numbering that issues and docs cite. If you must renumber,
  update every cross-reference (docs, `AGENTS.md`, issue templates, open
  issues) in the same PR.
- Don't pull items from the out-of-scope list (`SPEC.md` §6, last subsection)
  into the build via a spec edit without an explicit decision to move them in
  scope.
- Write the spec as settled intent, not as a record of how it was decided
  ([`documentation-standards.md`](documentation-standards.md) "Product docs,
  not process").
