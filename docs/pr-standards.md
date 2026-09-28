# PR Standards

How branches and pull requests work, so that every PR is one concern a reviewer
can check with only the PR in front of them.

## Branches

- Branch from `main` as `type/short-description`, using the commit types
  ([`commit-standards.md`](commit-standards.md)) — `feat/login-form`,
  `fix/empty-list-crash`, `docs/clarify-queue-rule`.
- If your agent platform assigns the branch name, use it as given; the PR
  title carries the type instead.
- **One issue per branch, one branch per PR.**

## Opening a PR

- **Open it when the work is ready.** Work is picked up by unattended
  sessions, so finishing must reliably produce a PR — nobody is watching to
  ask for one. (Exception: you're explicitly told not to.)
- **Run the gate first** ([`AGENTS.md`](../AGENTS.md) §5). CI confirms a green
  gate; it isn't where you find out.
- **Title** in Conventional Commits form, `type(scope): subject`, following the
  subject rules in [`commit-standards.md`](commit-standards.md).
- **Fill in the [template](../.github/pull_request_template.md)**: summary,
  linked issue, testing, the checklist that fits (code or docs-only), and the
  TL;DR. Delete sections that don't apply rather than leaving them empty.
- **Link exactly one issue** with `Closes #N`
  ([`issue-standards.md`](issue-standards.md)). Trivial docs fixes may omit it
  ([`docs-only-changes.md`](docs-only-changes.md)).
- **Say where the change comes from** — the doc, spec section, or decision the
  issue implements — so a reviewer can trace PR → issue → source without asking.

## The TL;DR

Every PR — like every issue — ends with a `## TL;DR`: a few plain-English
bullet points, no jargon, as if explaining to a friend who doesn't code.

- **Why:** what problem or reason this PR exists for.
- **Impact:** what changes for someone using or building the project.

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
- Merge only when CI is green on the latest commit and review threads are
  resolved.
- Land via **"Rebase and merge"** to keep history linear
  ([`commit-standards.md`](commit-standards.md) "Linear history"). To catch up
  with `main`, rebase the branch — don't merge `main` into it.
- The branch is deleted after merge.
