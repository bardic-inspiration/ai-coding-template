# Documentation

How docs are written, named, and kept truthful. Documentation drift is a
defect.

## Source of truth

- [`SPEC.md`](../SPEC.md) is authoritative for **what to build**; code
  conforms to it ([`spec-driven-development.md`](spec-driven-development.md)).
- [`AGENTS.md`](../AGENTS.md) is authoritative for **how to work**.
- **Every fact has one home.** Other docs describe it in a line and link
  there — duplication drifts.

## Present tense; history lives in git

- Docs describe the project **as it is now**. Plans describe the active
  future and are deleted when done; the past lives in git — squash commits,
  PRs, and issues ([`spec-driven-development.md`](spec-driven-development.md)
  "Three tenses, three homes").
- A doc that has done its job is deleted, not moved to an archive folder.
  Superseded text is replaced, not struck through or annotated.
- **No process narration.** Docs don't reference chat sessions, "as
  discussed," or session links. How a change came to be belongs in its PR
  description, which becomes the commit body on `main`.

## Structure

- **Purpose line.** Every doc opens with a `# Title` and a one-line statement
  of what it's for.
- **Routing tables.** A doc that hands the reader off to others uses a table
  of link and "read when" — [`AGENTS.md`](../AGENTS.md) "Protocol docs" is the
  model. Point at another doc's table; don't copy it.
- **Stable rules apart from churn-prone detail.** Timeless rules don't embed
  what changes as the project grows (which tool enforces a rule, current
  status) — they point at where that lives.
- **Cite by name, not number.** Link docs relatively, and refer to sections
  by heading or stable ID (`INV-2`), never by a number that shifts.

## Keep in sync

- A change that alters observable behavior updates the affected docs **in the
  same PR**.
- When a shared term, identifier, or heading changes, every doc that names it
  changes in the same PR, with identical spelling.
- Where a doc can be checked against the code mechanically — a file map, a
  command list — prefer a check in `check` to good intentions
  ([`ci.md`](ci.md) "Enforcing project rules").

## Style

- Short, skimmable docs with links over long prose.
- Fenced code blocks for commands and payloads.

## Naming

- **Root meta-files** keep the open-source convention of `ALL-CAPS.md`:
  `README.md`, `CONTRIBUTING.md`, `CHANGELOG.md`, `LICENSE`, `AGENTS.md`,
  `CLAUDE.md`, `SPEC.md`.
- **Everything under `docs/`:** `kebab-case.md`. Plans are
  `docs/plans/NNNN-kebab-case.md`, and a number is never reused. Spec areas,
  once the spec is split, are `docs/spec/<area>.md`.
- **Stable IDs** that docs cite, like invariants: a short uppercase prefix
  plus a number (`INV-3`). Never reuse or renumber one; retire it.
- **Branches, commits, and labels:** [`workflow.md`](workflow.md).

### Code

<!-- TEMPLATE: filled in by the stack module — identifier casing (variables,
functions, types, constants), source-file and package naming, and any
deliberate split between code identifiers and wire or data field names (e.g.
`camelCase` in code, `snake_case` in JSON). State a split explicitly, so it
reads as a convention and not an inconsistency to "fix". -->

## Doc audit

The docs are reconciled periodically, not continuously. An audit checks that:

- **the spec describes `main`** — no stale statements, no `Planned` marker
  whose plan is finished, no history (version annotations, amendment tables,
  past-tense narration);
- **only live documents exist** — `docs/plans/` holds only active plans, and
  resolved open questions are gone from the spec;
- **status matches GitHub** — anything the docs report about what's built or
  what's next matches the actual issues, PRs, and milestones;
- **links resolve**, and cross-references use identical spelling;
- **`check` is the gate** — AGENTS.md "Commands" and `ci.yml` run the same
  command;
- **one home per fact** — no second copy of a rule that has quietly diverged;
- **no template leftovers** — no unfilled placeholders or unresolved guidance
  comments from adoption.

Any session may open a docs-only PR to fix drift it spots while working. A
broader pass is filed as its own docs issue. Doc fixes never ride along in an
unrelated code PR.
