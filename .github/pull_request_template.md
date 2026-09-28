<!--
One PR = one issue = one concern. See AGENTS.md and docs/pr-standards.md.

Docs-only PR (every changed file is Markdown)? Use the docs-only checklist and
delete the code one — see docs/docs-only-changes.md. Mixing a doc edit with any
code change makes it a code change; use the code checklist.

Delete any section that doesn't apply rather than leaving it empty.
-->

## Summary

<!-- One or two sentences: what this PR does, and where it comes from (the doc,
spec section, or decision the issue implements). -->

## Linked issue

Closes #

<!-- Trivial docs fixes (typos, broken links) may omit this — see docs/docs-only-changes.md. -->

## Testing

<!-- Tests added or changed, and anything checked by hand. N/A for docs-only PRs. -->

## Screenshots

<!--
UI changes only: 1–4 screenshots of what changed (before/after for fixes, a
phone-width view if the layout differs), committed to dev/screenshots/pr-<N>/
and linked by commit SHA — see docs/pr-standards.md. Delete this section if
nothing users see changed.
-->

## Checklist — code changes

- [ ] Tests written first, and passing
- [ ] Gate green locally (AGENTS.md §5)
- [ ] Atomic commits in Conventional Commits format
- [ ] Docs updated if behavior changed
- [ ] Scoped to the linked issue only; hard rules (AGENTS.md §2) still hold
- [ ] 1–4 screenshots attached, if the UI changed

## Checklist — docs-only changes

- [ ] Every changed file is Markdown
- [ ] Commits use `docs: ...`
- [ ] Links resolve; cross-references updated where a shared term or section changed
- [ ] No process narration in doc content (docs/documentation-standards.md)

## TL;DR

<!--
Required. Plain English, no jargon, bullet points — explain it like you're
telling a friend who doesn't code:
- Why: what problem or reason this PR exists for.
- Impact: what changes for someone using or building the project.
-->

-
