# Naming Conventions

The single source of truth for naming across files, docs, process artifacts,
and code. Every doc that names the same thing uses the same spelling
([`documentation-standards.md`](documentation-standards.md) "Keep in sync").

## Files & directories

- Root and package meta-files keep the standard open-source convention of
  `ALL-CAPS.md`: `README.md`, `CONTRIBUTING.md`, `CHANGELOG.md`, `LICENSE`,
  `AGENTS.md`, `CLAUDE.md` (and `SPEC.md`, where there is one).
- Everything under `docs/`: `kebab-case.md` (`testing-standards.md`).
- Decision records, if the project keeps them: `NNNN-kebab-case.md`,
  zero-padded and never renumbered.

## Git & process

- **Branches:** `type/short-description` in kebab-case
  ([`pr-standards.md`](pr-standards.md) "Branches").
- **Commit and PR types, scopes:** [`commit-standards.md`](commit-standards.md).
  Scopes are the lowercase name of the package, module, or area.
- **Labels:** lowercase, colon-scoped where hierarchical (`task`, `bug`,
  `needs-discussion`, `phase:2`) — the label set lives in
  [`issue-standards.md`](issue-standards.md) "Labels".
- **Stable IDs** that docs cite (invariants, decisions): short uppercase prefix
  plus number — `INV-3`, `D2`. Never reuse or renumber an ID; retire it.

## Code

<!-- TEMPLATE: filled in by the stack module — identifier casing (variables,
functions, types, constants), source-file naming, package naming, and any
deliberate split between code identifiers and wire/data field names (e.g.
`camelCase` in code, `snake_case` in JSON). State the split explicitly so it
reads as a convention, not an inconsistency to "fix". -->

## Keeping this cohesive

When the same function, field, or term is named in more than one doc,
renaming it is a rename everywhere it's mentioned, in the same PR.
