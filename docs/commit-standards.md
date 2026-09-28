# Commit Standards

Clean, readable history through atomic, conventionally formatted commits.

## Atomic commits

- Each commit is **one logical change** that builds and passes the gate
  ([`AGENTS.md`](../AGENTS.md) §5).
- Don't mix unrelated concerns in a commit, and don't split one change across
  commits that leave the tree broken in between.
- Commit **tests and the implementation they cover together** — test-first
  development produces them as one logical change
  ([`testing-standards.md`](testing-standards.md)).

## Conventional Commits

Format:

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
- **Subject:** imperative, lower-case, no trailing period, ≤ ~72 chars
  ("add retry to upload", not "Added retry to upload.").
- **Body:** explain *why* the change was made, not *what* changed — the diff
  shows what. Wrap near 72 characters.
- **Footer:** `Closes #N` where a commit completes an issue;
  `BREAKING CHANGE: ...` for anything that breaks a versioned surface.

## Linear history

- Keep history linear — **no merge commits**.
- Rebase your branch onto `main` rather than merging `main` into it.
- PRs land with **"Rebase and merge"**
  ([`pr-standards.md`](pr-standards.md) "Merging").
- Clean up work-in-progress commits (amend / interactive rebase) before review
  so each landed commit is atomic and meaningful.

## Versioned surfaces

<!-- TEMPLATE: keep this section if the project has a public surface other code
or people depend on — an API, a schema, a wire or file format, a CLI. Name
the surface and its changelog. Delete it otherwise. -->

A commit that changes a versioned surface includes its changelog entry in the
**same commit**, with the version bump the change requires (additive → minor,
breaking → major). A surface never changes silently.
