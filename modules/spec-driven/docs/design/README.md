# Design Records

How gaps and ambiguities in [`SPEC.md`](../../SPEC.md) get decided deliberately
— instead of guessed at by whichever session reaches them first.

## What lives here

| File | Purpose |
|---|---|
| `NNNN-kebab-title.md` | A **decision record**: one or more related decisions, with rationale, that were amended into the spec. Numbered in order, never renumbered. |
| [`open-questions.md`](open-questions.md) | Questions flagged explicitly rather than silently decided. `SPEC.md` §7 points here, so the spec holds only settled decisions. |
| `open-scope.md` *(optional)* | A **survey** of places where the spec is silent, inferred, or self-contradictory — written before a build (or after an audit) so gaps are triaged together, in dependency tiers, rather than one at a time. |

## Decision record format

```markdown
# Decision Record NNNN — Title

`status: proposed | accepted | superseded by NNNN`
`issue: #N`

One paragraph: the gap or conflict that forced a decision, citing the
SPEC sections involved.

## D1 — The question, phrased as a question?

The context that makes it hard. The options considered.

**Decision — the answer in one line.**

- What exactly is decided.
- Why this over the alternatives.
- Which SPEC sections change, and the resulting spec-version.
```

A record is written as settled intent — the decision and its reasons — not as
a transcript of how it was reached
([`documentation-standards.md`](../documentation-standards.md) "Product docs,
not process").

## The design track

- Each open gap is a GitHub issue labeled `design` (plus `spec-revision` if it
  will amend the spec). Design issues carry no `phase:N` label.
- Resolving one means amending `SPEC.md` per
  [`spec-guidelines.md`](../spec-guidelines.md) — that is when the answer
  becomes contract — and recording the decision here if it needed real
  deliberation.
- Queue and gating rules live in [`roadmap.md`](../roadmap.md) "Design track".
