# Contributing

This project is built by AI coding agents and humans following the same
test-first, atomic, one-issue-per-PR process. **Read [`AGENTS.md`](AGENTS.md)
first** — it is the canonical working guide. This file covers what a human
needs to get set up, and the short version of the rules.

## Getting started

<!-- TEMPLATE: the minimum a new contributor runs to get a green test suite.
Commands come from AGENTS.md §5. -->

```bash
git clone https://github.com/{{REPO_SLUG}}
cd {{REPO_NAME}}
{{INSTALL_CMD}}
{{TEST_CMD}}
```

The full command list — lint, typecheck, build, run — is in
[`AGENTS.md`](AGENTS.md) §5.

## The short version

- **One issue, one branch, one PR.** Branch from `main` as
  `type/short-description` ([`docs/pr-standards.md`](docs/pr-standards.md)).
- **Test first.** Failing test, then the code that passes it
  ([`docs/testing-standards.md`](docs/testing-standards.md)).
- **Atomic Conventional Commits**, tests committed with the code they cover
  ([`docs/commit-standards.md`](docs/commit-standards.md)).
- **Linear history.** Rebase onto `main`, don't merge it in; PRs land via
  "Rebase and merge."
- **Green gate, then PR.** Run the gate locally; CI must be green before merge
  ([`docs/ci-standards.md`](docs/ci-standards.md)).
- **Markdown-only changes** take a lighter path
  ([`docs/docs-only-changes.md`](docs/docs-only-changes.md)).

[`AGENTS.md`](AGENTS.md) §4 "Protocol docs — read when" is the routing table
for every standards doc under [`docs/`](docs/); this file doesn't keep a second
copy.
