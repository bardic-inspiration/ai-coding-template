# Using This Template

How to turn this template into a new project's working standard: the docs,
templates, CI, and Claude Code setup that let AI sessions — interactive or
scheduled — and you build a project the same way. Delete this file and
[`modules/`](modules/) once adoption is done.

## What's in the box

| Path | Purpose |
|---|---|
| [`AGENTS.md`](AGENTS.md) | The canonical guide for any agent: the two modes, hard rules, working loop, routing table, commands. |
| [`SPEC.md`](SPEC.md) | The spec skeleton — right-size it ([`docs/spec-driven-development.md`](docs/spec-driven-development.md)). |
| [`CLAUDE.md`](CLAUDE.md) | Imports `AGENTS.md` for Claude Code, and adds its specifics: PR watching, configuration, skills. |
| [`CONTRIBUTING.md`](CONTRIBUTING.md) | Human setup, and the short version of the rules. |
| [`README.md`](README.md) | Project README skeleton. |
| [`docs/`](docs/) | Five protocol docs — spec-driven development, workflow (everything Git and GitHub), testing, CI, documentation — and `plans/`, with plan 0001, the initial build. |
| [`.github/`](.github/) | The CI gate, the PR title check, Dependabot for Actions, issue and PR templates. |
| [`.claude/`](.claude/) | `settings.json` (permissions and the SessionStart hook), the hook script, and the `ask-me` / `grill-me` skills. |
| [`.gitignore`](.gitignore) | Stack-agnostic baseline. |
| [`LICENSE`](LICENSE) | MIT, with placeholders. |
| [`.llm-facts.yml`](.llm-facts.yml) | Optional AI-usage disclosure label source. |

Stack modules (Node, Python, …) are planned ([`modules/README.md`](modules/README.md));
until then, the stack-shaped slots are marked `TEMPLATE:` and filled by hand.

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
| `{{PROJECT_NAME}}` | README, SPEC.md | Human-readable project name. |
| `{{PROJECT_SUMMARY}}` | README | One public-facing paragraph: what, and for whom. |
| `{{PROJECT_PURPOSE}}` | SPEC.md | Purpose and audience; the non-goals follow it. |
| `{{REPO_SLUG}}`, `{{REPO_NAME}}` | CONTRIBUTING, issue config, workflow.md | `owner/repo`, and `repo`. |
| `{{INSTALL_CMD}}`, `{{CHECK_CMD}}`, `{{FIX_CMD}}`, `{{TEST_CMD}}`, `{{RUN_CMD}}` | AGENTS.md "Commands", CONTRIBUTING, `.claude/settings.json` | The stack's commands; `CHECK_CMD` is the gate. |
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
4. **Wire the gate** (plan 0001, Phase 0): define `check` in the stack's task
   runner and list the commands in `AGENTS.md` "Commands"; in `ci.yml`,
   replace the "Gate not wired yet" step with toolchain setup, install, and
   `check`; fill the install step in `.claude/hooks/session-start.sh`
   ([`docs/ci.md`](docs/ci.md)).
5. **Configure GitHub** — the settings below.
6. **Clean up:** delete this file, `modules/`, and the README banner.
7. **Audit.** The grep above returns nothing, and every relative link resolves
   ([`docs/documentation.md`](docs/documentation.md) "Doc audit").

## GitHub settings

These enforce what the docs state; they're repository settings, not files.

- [ ] **Labels:** `task`, `bug`, `documentation`, `needs-discussion`.
- [ ] **General → Pull Requests:** allow only **squash merging**, with the
      default commit message **"Pull request title and description"** — that
      is what makes each PR one legible commit on `main`. Turn on "Always
      suggest updating pull request branches," "Allow auto-merge," and
      "Automatically delete head branches."
- [ ] **Branch ruleset on `main`:** require a pull request with **0 required
      approvals** (GitHub won't let you approve your own PR — for a solo
      maintainer, the merge is the review); require the `gate` and `pr-title`
      status checks, with **"Require branches to be up to date before
      merging"** — when several PRs are open, each merge makes the rest
      re-test against the new `main` before they can land; require linear
      history; block force pushes and deletion.
- [ ] **Actions:** default workflow permissions read-only.
- [ ] **Security:** Dependabot version updates run from
      `.github/dependabot.yml` with no setting; turn on Dependabot alerts for
      vulnerability notices.
