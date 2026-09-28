# CI Standards

What CI must accomplish for this repo, whatever the language or toolchain.
[`ci.yml`](../.github/workflows/ci.yml) implements the gate and
[`pr-title.yml`](../.github/workflows/pr-title.yml) guards the commit record; a
stack module supplies the commands and toolchain setup, never a different
contract.

## Why CI exists here

CI is the merge gate that lets unattended, memoryless sessions trust each
other's work. A green check has to mean the same thing every time: *this change
was checked exactly the way a contributor checks it locally, and passed.*
Anything CI does that a contributor can't reproduce locally — or that a
contributor runs but CI doesn't — erodes that.

## What CI must do

1. **Run on every PR and every push to `main`**, plus on manual dispatch.
2. **Run the gate — the same commands contributors run.** The gate is the
   command table in [`AGENTS.md`](../AGENTS.md) §5; `ci.yml`'s `env:` block
   mirrors it. CI has no private checks, and every gate command runs in CI.
   A change to one side is a change to both, in the same PR.
3. **Be the merge gate.** `gate` and `pr-title` are both required status
   checks under branch protection, and red is never merged. Tests are never skipped, disabled, or
   marked `continue-on-error` to get green.
4. **Never pass vacuously.** A stage that isn't wired up announces itself with
   a notice. Once the project has code, `GATE_REQUIRED` is `"true"`, and an
   empty lint or test command fails the job.
5. **Take the docs-only fast path.** A Markdown-only diff skips install and the
   code gate, decided from the changed-file list, not a label
   ([`docs-only-changes.md`](docs-only-changes.md)). The job still runs and
   reports green, so the required check is satisfied. Doc checks run on every
   change.
6. **Self-activate from the baseline.** A repo fresh from the template has no
   code and a green CI; each stage switches on when its command is filled in.
   Nobody has to remember to "turn CI on."
7. **Be reproducible.** Pin the toolchain version, install from a lockfile
   (the frozen-lockfile form of the install command), and keep tests free of
   wall-clock, randomness, and live network
   ([`testing-standards.md`](testing-standards.md)). A flaky check is a bug to
   fix, not something to re-run until it passes.
8. **Use least privilege.** `permissions: contents: read` by default; a job
   that needs more declares exactly that. The gate needs no secrets, so it
   runs the same for every contributor. Commands come from the workflow file,
   never from PR-controlled input such as titles, branch names, or bodies.
9. **Stay fast and bounded.** Every job has a `timeout-minutes`, superseded
   runs on the same ref are cancelled, and the stack module adds dependency
   caching. If the gate gets slow, split or parallelize it — don't drop
   checks.
10. **Be legible to whoever reads the log next** — often an agent with no
    context. Each stage is its own named step, so a failure points at one
    stage, and a skipped stage says why.

## Stages

| Stage | Purpose | Required once `GATE_REQUIRED` is on |
|---|---|---|
| Install (`INSTALL_CMD`) | Reproducible dependency install from the lockfile. | If the stack has dependencies. |
| Lint (`LINT_CMD`) | Static analysis, including the machine-checked project rules below. | **Yes.** |
| Format check (`FORMAT_CHECK_CMD`) | Formatting drift fails. CI checks; it never rewrites. | Recommended. |
| Typecheck (`TYPECHECK_CMD`) | Type errors fail. | If the stack has a type checker. |
| Test (`TEST_CMD`) | The full suite. | **Yes.** |
| Build (`BUILD_CMD`) | The shippable artifact builds. | If the project ships a built artifact. |
| Docs checks (`DOCS_CHECK_CMD`) | Checks that stay meaningful on a docs-only change: links resolve, a doc matches the code it describes. | Optional. |

## PR title check

PRs land by squash merge, so a PR's title becomes the subject of its commit on
`main` ([`commit-standards.md`](commit-standards.md) "How history is shaped").
[`pr-title.yml`](../.github/workflows/pr-title.yml) fails a PR whose title
isn't a Conventional Commits subject, ends with a period, or would make a
subject longer than 72 characters once GitHub appends ` (#N)`. GitHub's own
`Revert "…"` titles pass as they are.

- It checks PR metadata, not code, so it runs on docs-only PRs too, and re-runs
  when the title is edited.
- The title reaches the script only through `env` — never interpolated into
  it — because anyone opening a PR controls it.
- Its type list mirrors [`commit-standards.md`](commit-standards.md); change
  both together.

## Enforcing project rules

An invariant ([`SPEC.md`](../SPEC.md)) or hard rule
([`AGENTS.md`](../AGENTS.md) §2) that a machine can check should be checked
by the gate — as a lint rule or a test — rather than left to
convention. Patterns that have worked:

- A **boundary lint rule**: an architectural invariant ("the client never
  imports the engine") enforced as a real lint rule, so a violation fails the
  cheapest stage.
- A **doc-sync check**: a developer doc that maps the code (file map, module
  list) is verified against the code, so drift fails CI instead of waiting
  for an audit.
- A **forbidden-capability check**: "the product makes no network calls", "no
  unseeded randomness in core logic" — enforced by scanning the source.

Each check names the invariant ID it enforces, in its test name or rule
message, so `grep INV-n` finds every check for a rule
([`testing-standards.md`](testing-standards.md) "Tests that guard
invariants").

## Runtime matrix

If the project claims support for more than one runtime version, test each —
typically the current and previous long-term-support releases. Use
`fail-fast: false` so one version's failure doesn't hide another's. The stack
module defines the matrix.

## Changing CI

- Any change to `.github/workflows/` is a code change, never docs-only, and
  takes the normal PR path.
- Changing a gate command updates [`AGENTS.md`](../AGENTS.md) §5 and the
  `env:` block together.
- **Weakening a check** — removing a stage, loosening a threshold, adding
  `continue-on-error`, excluding files — needs its own issue saying why. It
  never rides along inside an unrelated PR.

## Agents and CI

- Run the gate locally before committing. CI confirms a green gate; it isn't
  where you find out.
- A PR with red CI is not done. The session or person that next picks the PR
  up fixes it on the same branch before anything else
  ([`pr-standards.md`](pr-standards.md) "Review").

## Not covered yet

Candidates for later modules, deliberately left out of the baseline: release
and deploy workflows, dependency-update automation, security and secret
scanning, and coverage thresholds.
