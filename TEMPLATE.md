# Using This Template

How to turn this template into a new project's working governance: the docs,
templates, and CI that let memoryless agent sessions and humans build the
project the same way. Delete this file and [`modules/`](modules/) once adoption
is done.

## What's in the box

### Core — every project

| Path | Purpose |
|---|---|
| [`AGENTS.md`](AGENTS.md) | The canonical working guide: hard rules, working loop, routing table to every standards doc, command table. |
| [`SPEC.md`](SPEC.md) | The spec skeleton — right-size it: keep the parts the project needs ([`docs/spec-driven-development.md`](docs/spec-driven-development.md)). |
| [`CLAUDE.md`](CLAUDE.md) | Claude Code–specific conventions (one question at a time; never watch PRs). |
| [`CONTRIBUTING.md`](CONTRIBUTING.md) | Human setup, plus the short version of the rules. |
| [`README.md`](README.md) | Project README skeleton, including "How this repo is built". |
| [`docs/`](docs/) | Protocol docs — spec-driven development, issues, PRs, commits, testing, CI, scope, docs-only path, documentation standards, naming, doc audit. |
| [`docs/plans/`](docs/plans/README.md) | Plan format and lifecycle, and plan 0001 — the initial build. |
| [`.github/`](.github/) | Stack-agnostic CI gate; PR-title check; issue templates (task, bug, docs); PR template. |
| [`.claude/skills/`](.claude/skills/) | `ask-me` (form intent) and `grill-me` (stress-test a plan). |
| [`.gitignore`](.gitignore) | Stack-agnostic baseline. |
| [`LICENSE`](LICENSE) | MIT, with placeholders. |
| [`.llm-facts.yml`](.llm-facts.yml) | Optional AI-usage disclosure label source. |

### Modules — opt in

See [`modules/README.md`](modules/README.md). Stack modules (Node, Python, …)
are planned; until then, the stack-shaped slots are marked `TEMPLATE:` and
filled by hand.

## Conventions

| Marker | Meaning |
|---|---|
| `{{UPPER_SNAKE}}` | A value to fill in. |
| `<!-- TEMPLATE: … -->` (or `# TEMPLATE:` in YAML) | Guidance: act on it, then delete the comment. |

Find what's left at any point:

```bash
grep -rnE '\{\{[A-Z_0-9]+\}\}|TEMPLATE:' --exclude-dir=.git .
```

### Placeholders

| Placeholder | Where | Value |
|---|---|---|
| `{{PROJECT_NAME}}` | README | Human-readable project name. |
| `{{PROJECT_SUMMARY}}` | README | One paragraph: what, for whom, what it isn't. |
| `{{PROJECT_PURPOSE}}` | SPEC.md | A paragraph of purpose and audience; non-goals follow it. |
| `{{REPO_SLUG}}` | CONTRIBUTING, issue config, PR standards | `owner/repo`. |
| `{{REPO_NAME}}` | CONTRIBUTING | `repo`. |
| `{{INSTALL_CMD}}` … `{{RUN_CMD}}` | AGENTS.md §5, CONTRIBUTING | The stack's commands — and mirror them in `ci.yml`'s `env:` block. |
| `{{YEAR}}`, `{{COPYRIGHT_HOLDER}}` | LICENSE | Copyright line. |
| `{{START_DATE}}` | .llm-facts.yml | When AI-assisted development began. |
| `{{INVARIANT_NAME}}`, `{{INVARIANT}}` | SPEC.md | The first invariant's short name and statement. |
| `{{PLAN_0001_GOAL}}`, `{{FIRST_RELEASE}}`, `{{PHASE_1_NAME}}` | docs/plans/ | The initial build's goal, its target release, and its first real phase. |

## Adopting

1. **Create the repo** from this template.
2. **Write the spec, right-sized**, and shape plan 0001's phases
   ([`docs/spec-driven-development.md`](docs/spec-driven-development.md)).
   Set `SPEC.md`'s status to `building` when Phase 0 opens.
3. **Fill placeholders and resolve `TEMPLATE:` comments** — each one either
   becomes content or is deleted.
4. **Wire the gate.** Fill the command table in `AGENTS.md` §5 and the `env:`
   block in `.github/workflows/ci.yml` together, and add the toolchain setup
   step. Once there is code to check, set `GATE_REQUIRED: "true"`
   ([`docs/ci-standards.md`](docs/ci-standards.md)).
5. **Configure GitHub** — the settings below.
6. **Clean up:** delete this file, `modules/`, and the README banner.
7. **Audit.** The grep above returns nothing, and every relative link resolves
   ([`docs/doc-audit.md`](docs/doc-audit.md)).

## GitHub settings

These enforce the rules the docs state; they're repository settings, not files.

- [ ] **Labels:** `task`, `bug`, `documentation`, `needs-discussion` (plus any
      a module adds).
- [ ] **Pull requests:** allow only **squash merging**, with the default
      commit message set to **"Pull request title and description"** — that
      is what makes each PR one legible commit on `main`
      ([`docs/commit-standards.md`](docs/commit-standards.md)). Turn on
      "Automatically delete head branches."
- [ ] **Branch ruleset on `main`:** require a pull request with **0 required
      approvals** (GitHub won't let you approve your own PR — for a solo
      maintainer, the merge is the review); require the `gate` and `pr-title`
      status checks; require linear history; block force pushes and deletion.
- [ ] **Actions:** default workflow permissions read-only.
- [ ] **Issues:** templates are picked up from `.github/ISSUE_TEMPLATE/`;
      blank issues are disabled by `config.yml`.
