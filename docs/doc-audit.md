# Doc Audit

The periodic staleness and consistency check that keeps the doc set truthful.

The docs — `AGENTS.md`, `CLAUDE.md`, `CONTRIBUTING.md`, `README.md`, and
everything under `docs/` — are a **living, periodically reconciled** artifact,
not a write-once record. Documentation drift is a defect
([`documentation-standards.md`](documentation-standards.md)); this audit is
what lets a cold-start session trust that the docs are current.

## What the audit checks

- **Stale status.** Any status the docs report (what's built, what's next,
  milestone state) matches the actual issue, PR, and milestone state on GitHub.
- **Links resolve.** Every relative link points at a file — and, for anchors,
  a heading — that still exists.
- **Cross-reference drift.** When a shared term, identifier, or section number
  changed in one doc, every doc that names it changed too, with identical
  spelling.
- **Commands match.** The command table in [`AGENTS.md`](../AGENTS.md) §5 and
  the `env:` block in [`ci.yml`](../.github/workflows/ci.yml) list the same
  commands, and those commands still work
  ([`ci-standards.md`](ci-standards.md)).
- **One home per fact.** Rules are stated once and pointed at elsewhere — no
  second copy that has quietly diverged.
- **Process narration.** No chat, conversation, or session references have
  leaked into doc content.
- **Structure & routing.** Each doc opens with its purpose line, and a parent
  doc's references to its subdocuments use a routing table.
- **Template leftovers.** No unfilled placeholder tokens or unresolved
  template-guidance comments remain from adoption.

## When it runs

Treat the docs as reconciled periodically, not continuously. Any session may
open a docs-only PR ([`docs-only-changes.md`](docs-only-changes.md)) to fix
drift it spots while working — trivial fixes need no issue; a broader
reconciliation pass is filed as its own docs issue. Don't fold doc fixes into
an unrelated code PR ([`scope-discipline.md`](scope-discipline.md)).
