# Documentation Standards

Keep docs truthful and in sync with behavior. Documentation drift is a defect.

## Source of truth

- [`SPEC.md`](../SPEC.md) is authoritative for **what to build**; code
  conforms to it, not the other way around
  ([`spec-driven-development.md`](spec-driven-development.md)).
- [`AGENTS.md`](../AGENTS.md) is authoritative for **how to work**.
- Every fact has **one home.** Other docs describe it briefly and link there
  rather than restating it — duplication drifts. When a doc needs a detail,
  link to its home.

## Structure & routing

- **Purpose line.** Every protocol doc opens with a `# Title Case` heading and
  a one-line statement of its purpose, so a cold-start reader can tell at a
  glance what the doc is for.
- **Routing tables.** When a doc hands the reader off to its subdocuments, use
  a table with a name/link column and a "when" column, listing that doc's
  *own* subdocuments. [`AGENTS.md`](../AGENTS.md) §4 "Protocol docs — read
  when" is the model. Don't copy another doc's routing table — point to it —
  and don't leave subdocument references as loose prose.
- **Point, don't duplicate.** A parent doc keeps a one-line pointer to what its
  subdocument owns; the subdocument holds the full text.
- **Stable rules, churn-prone mechanics.** Keep timeless rules (the hard rules,
  the working loop) separate from the details that change as the project grows
  (which tool enforces a rule, current status). The rules doc points at the
  mechanics doc, so updating the mechanics never means diffing the rules.
- **Relative links.** Cross-reference other docs with relative Markdown links,
  not bare file names in code spans.

## Present tense; history lives in git

- Docs describe the project **as it is now**. Plans describe the active
  future and are deleted when done; the past lives in git — squash commits,
  PRs, and issues ([`spec-driven-development.md`](spec-driven-development.md)
  "Three tenses, three homes").
- A doc that has done its job is deleted, not moved to an archive folder.
  Superseded text is replaced, not struck through or annotated with when it
  changed.

## Product docs, not process

- Docs describe the **project** — its technical and design intent — not how a
  change came to be. They must not reference chat sessions, "as discussed",
  session links, or similar process narration.
- That record belongs in the **PR description** instead — which becomes the
  body of the PR's squash commit on `main`, so it stays in history without
  cluttering the docs ([`pr-standards.md`](pr-standards.md) "The PR is the
  record").
- If a decision needs to outlive the PR, capture the decision and its
  rationale in the docs, written as settled intent — not as a summary of the
  conversation that produced it.
- This applies equally to docs-only changes
  ([`docs-only-changes.md`](docs-only-changes.md)): the leaner protocol loosens
  testing and CI, not this rule.

## Keep in sync

- If a change alters observable behavior, update the affected docs **in the
  same PR** — the README and any doc describing the changed surface. The
  pre-flight item "Docs updated if behavior changed"
  ([`pr-standards.md`](pr-standards.md)) is not optional when behavior
  changed.
- When a shared term, identifier, or section number changes, every doc that
  names it changes in the same PR, with identical spelling
  ([`naming-conventions.md`](naming-conventions.md)).
- Where a doc can be checked against the code mechanically (a file map, a
  command list, a config table), prefer a check in CI to good intentions
  ([`ci-standards.md`](ci-standards.md) "Enforcing project rules").

## Style

- Prefer short, skimmable docs with links over long prose.
- Use fenced code blocks for commands and payloads.
- Cite rules and sections by stable ID (`INV-2`, `AGENTS.md` §5) so readers
  can trace a claim back to its home.
