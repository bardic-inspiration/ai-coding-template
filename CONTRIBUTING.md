# Contributing

This project is built by AI coding sessions and humans following the same
process. **Read [`AGENTS.md`](AGENTS.md) first** — it is the canonical guide.
This file covers what a human needs to get set up, and the short version.

## Getting started

<!-- TEMPLATE: the minimum a new contributor runs to get a green check. -->

```bash
git clone https://github.com/{{REPO_SLUG}}
cd {{REPO_NAME}}
{{INSTALL_CMD}}
{{CHECK_CMD}}
```

## The short version

- **One concern per PR**, on a branch from `main`. Link its issue, or state
  the task in the description.
- **Test first, and `check` green before you push** — CI runs the same
  command.
- **PRs land by squash merge:** the title becomes the commit subject on `main`
  and the description its body, so write both for `git log`.
- **Never force-push a pushed branch**; merge `main` in to catch up.

The details — issues, branches, commits, PRs, merging — are in
[`docs/workflow.md`](docs/workflow.md).
