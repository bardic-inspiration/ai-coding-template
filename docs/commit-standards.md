# Commit Standards

How history is shaped, and how commit messages are written, so the record on
`main` is legible to whoever reads it next — usually a cold-start session with
nothing but the repo.

## How history is shaped

`main` gets **one commit per PR** — and so one per issue — because PRs land by
**squash merge** ([`pr-standards.md`](pr-standards.md) "Merging"):

- the **PR title** becomes the commit subject, with ` (#N)` appended;
- the **PR description** becomes the commit body — summary, `Closes #N`,
  testing, TL;DR.

So `git log --oneline` on `main` reads as the project's changelog, one line per
issue, and `git show` on any line gives the full *why* without leaving the
repo. Everything below serves that record.

## Commits on your branch

Branch commits don't land on `main` individually, but reviewers read them, and a
later session may pick up the branch mid-flight. Keep them legible:

- Each commit is **one logical step** with a Conventional Commits message
  (below). Don't mix unrelated concerns in a commit.
- Commit **tests with the implementation they cover** — test-first development
  produces them as one step ([`testing-standards.md`](testing-standards.md)).
- **Don't rewrite pushed history** — no amend, rebase, or force-push once a
  branch is pushed; another session may already have it checked out. Review
  fixes go on as new commits; the squash absorbs them.
- **To catch up with `main`, merge it into the branch** (or use GitHub's
  "Update branch"). The merge commit disappears in the squash.

## Conventional Commits

Applies to branch commits **and** PR titles — a PR title is the subject of the
commit that lands on `main`.

```
type(scope): imperative subject

optional body explaining WHY, wrapped near 72 chars

optional footer (Closes #12, BREAKING CHANGE: ...)
```

- **Types:** `feat`, `fix`, `docs`, `test`, `refactor`, `chore`, `ci`,
  `build`, `style`.
- **Scope** (optional): the package, module, or area touched —
  `feat(auth): ...`, `fix(parser): ...`. Scope names follow
  [`naming-conventions.md`](naming-conventions.md).
- **Breaking changes:** `!` after the type or scope (`feat(api)!: ...`), and a
  `BREAKING CHANGE: ...` footer saying what breaks.
- **Subject:** imperative, lower-case, no trailing period, ≤ ~72 chars
  ("add retry to upload", not "Added retry to upload."). For a PR title the
  limit includes the ` (#N)` GitHub appends.
- **Body:** explain *why* the change was made, not *what* changed — the diff
  shows what. Wrap near 72 characters.
- **Footer:** `Closes #N` where a commit completes an issue;
  `BREAKING CHANGE: ...` for anything that breaks a versioned surface.

## Versioned surfaces

<!-- TEMPLATE: keep this section if the project has a public surface other code
or people depend on — an API, a schema, a wire or file format, a CLI. Name
the surface and its changelog. Delete it otherwise. -->

A change to a versioned surface includes its changelog entry in the **same
PR** — so both land in the same commit on `main` — with the version bump the
change requires (additive → minor, breaking → major). A surface never changes
silently.
