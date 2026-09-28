# PR Standards

How branches and pull requests work, so that every PR is one concern a reviewer
can check with only the PR in front of them — and lands on `main` as one
legible commit.

## Branches

- Branch from `main` as `type/short-description`, using the commit types
  ([`commit-standards.md`](commit-standards.md)) — `feat/login-form`,
  `fix/empty-list-crash`, `docs/clarify-queue-rule`.
- If your agent platform assigns the branch name, use it as given; the PR
  title carries the type instead.
- **One issue per branch, one branch per PR.**
- Once pushed, the branch's history is shared: add commits, merge `main` in to
  catch up, never force-push ([`commit-standards.md`](commit-standards.md)
  "Commits on your branch").

## The PR is the record

PRs land by squash merge, so each PR becomes **exactly one commit on `main`**:

| PR field | Becomes | So write it as |
|---|---|---|
| Title | The commit subject, with ` (#N)` appended | A Conventional Commits subject: `type(scope): imperative subject`, ≤ 72 characters including ` (#N)` ([`commit-standards.md`](commit-standards.md)). CI checks the form ([`ci-standards.md`](ci-standards.md) "PR title check"). |
| Description | The commit body | Content a reader of `git log` needs a year from now — what, why, where it came from, how it was tested, the TL;DR. No leftover template comments. |

The description is written once and read for the life of the project. If
review changes the approach or scope, **update the description before merge**
so the record matches what actually landed.

## Opening a PR

- **Open it when the work is ready.** Work is picked up by unattended
  sessions, so finishing must reliably produce a PR — nobody is watching to
  ask for one. (Exception: you're explicitly told not to.)
- **Run the pre-flight checklist** (below) first. CI confirms a green gate;
  it isn't where you find out.
- **Fill in the [template](../.github/pull_request_template.md)**: summary,
  linked issue, testing, screenshots if the UI changed, and the TL;DR. Delete
  sections that don't apply, and delete the guidance comments — they'd
  otherwise land in the commit body.
- **Link exactly one issue** with `Closes #N`
  ([`issue-standards.md`](issue-standards.md)). Trivial docs fixes may omit it
  ([`docs-only-changes.md`](docs-only-changes.md)).
- **Say where the change comes from** — the doc, spec section, or decision the
  issue implements — so a reader can trace commit → PR → issue → source.

## Pre-flight checklist

Confirm before opening the PR. The checklist lives here rather than in the PR
description so it doesn't repeat in every commit on `main`.

**Code changes:**

- [ ] Tests written first, and passing.
- [ ] Gate green locally ([`AGENTS.md`](../AGENTS.md) §5).
- [ ] Branch commits are Conventional Commits; tests committed with their code.
- [ ] Docs updated if behavior changed.
- [ ] Scoped to the linked issue only; hard rules ([`AGENTS.md`](../AGENTS.md)
      §2) still hold.
- [ ] 1–4 screenshots attached, if the UI changed.
- [ ] Title and description written for `git log` (above).

**Docs-only changes** ([`docs-only-changes.md`](docs-only-changes.md)):

- [ ] Every changed file is Markdown.
- [ ] Commits and title use `docs: ...`.
- [ ] Links resolve; cross-references updated where a shared term or section
      changed.
- [ ] No process narration in doc content
      ([`documentation-standards.md`](documentation-standards.md)).

## The TL;DR

Every PR — like every issue — ends with a `## TL;DR`: a few plain-English
bullet points, no jargon, as if explaining to a friend who doesn't code.

- **Why:** what problem or reason this PR exists for.
- **Impact:** what changes for someone using or building the project.

Because the description becomes the commit body, the TL;DR is also the
plain-English line of the project's history.

## Screenshots (UI changes)

<!-- TEMPLATE: keep this section if the project has a user interface; delete
it (and the Screenshots section of the PR template) otherwise. -->

A PR that changes what users see includes **1–4 screenshots** under
`## Screenshots` — before/after for fixes, and a narrow (phone-width) view too
if the layout differs.

Commit them rather than uploading, so a session with no upload path can still
attach them:

- Save to `dev/screenshots/pr-<N>/short-name.png` (open the PR first to get
  `<N>`).
- Link each by commit SHA so the link survives the folder being pruned later:
  `https://github.com/{{REPO_SLUG}}/blob/<commit-sha>/dev/screenshots/pr-<N>/<file>?raw=true`
- `dev/screenshots/` is for PR review only; stale folders may be pruned.

## Keeping the PR narrow

- The linked issue's acceptance criteria are the whole spec for the PR
  ([`scope-discipline.md`](scope-discipline.md)).
- Anything worth doing that surfaced along the way becomes its own issue; the
  PR gets one line pointing at it ("Opened #N for X, out of scope here").
- Mixing a docs edit into a code PR makes the whole PR a code change. Doc drift
  unrelated to the change goes in its own docs-only PR.

## Review

- Fixes go on as **new commits** — never amend or force-push a branch under
  review.
- Answer every review thread: what fixed it (with the commit), or why not.
- A decision that should outlive the PR goes into the docs, written as settled
  intent — not only into the PR thread
  ([`documentation-standards.md`](documentation-standards.md)).
- A PR whose CI is red is not done, whoever opened it. The session or person
  that next picks the PR up fixes it on the same branch before anything else.

## Merging

<!-- TEMPLATE: confirm who merges. The default below keeps a human in the
loop on every change. -->

- **A human maintainer reviews and merges.** Agents open PRs; they don't merge
  them.
- Merge only when both required checks (`gate`, `pr-title`) are green on the
  latest commit and review threads are resolved.
- Land via **"Squash and merge."** GitHub pre-fills the commit from the PR
  title and description; check it reads well as a commit before confirming.
- The branch is deleted after merge.
