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
| [`docs/`](docs/) | Five protocol docs: spec-driven development (including plans), workflow (everything Git and GitHub), testing, CI, and documentation. |
| [`.github/`](.github/) | The CI gate; the PR title check, which also blocks spikes from merging; Dependabot for Actions; issue templates (task, bug, docs, plan); the PR template. |
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

## Adopting

1. **Create the repo** from this template, and **configure GitHub** — the
   settings below, labels included.
2. **Fill placeholders and resolve `TEMPLATE:` comments** — each one either
   becomes content or is deleted. The stack-shaped ones (commands, the CI
   gate, the hook) are Phase 0's work, below.
3. **Write the spec, right-sized**
   ([`docs/spec-driven-development.md`](docs/spec-driven-development.md)).
4. **Open the initial-build plan** from the Plan issue template. Add phases up
   to your first release; Phase 0 is the same for every project — paste it in:

   ```markdown
   ### Phase 0 — Repository scaffold

   **Entry:** The template is adopted; no project code exists.

   **Build:**

   - The toolchain, and the repo layout in AGENTS.md "Repo layout".
   - `check`, defined in the stack's task runner, and the commands in
     AGENTS.md "Commands".
   - The gate in `.github/workflows/ci.yml` — toolchain setup (pinned, with
     caching), install from the lockfile, `check` — replacing the "Gate not
     wired yet" step (docs/ci.md).
   - The install step in `.claude/hooks/session-start.sh`, and the stack's
     package ecosystem in `.github/dependabot.yml`.

   **Exit:**

   - [ ] `check` runs green locally on an empty or trivial test suite.
   - [ ] CI runs `check` and is green, with no "gate not wired" warning.
   - [ ] A fresh cloud session can run `check` with no manual setup.
   - [ ] The repo layout matches AGENTS.md "Repo layout".
   ```

   Then set `SPEC.md`'s status to `building`.
5. **Clean up:** delete this file, `modules/`, and the README banner.
6. **Audit.** The grep above returns nothing, and every relative link resolves
   ([`docs/documentation.md`](docs/documentation.md) "Doc audit").

## GitHub settings

These enforce what the docs state; they're repository settings, not files.

- [ ] **Labels:** `task`, `bug`, `documentation`, `plan`, `needs-discussion`.
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
