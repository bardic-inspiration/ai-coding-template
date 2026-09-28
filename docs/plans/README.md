# Plans

Temporary documents that turn a spec change too big for one PR into ordered,
checkable work. Why plans live apart from the spec — and are deleted when
done — is in [`spec-driven-development.md`](../spec-driven-development.md).

## Active plans

| Plan | Goal | Current phase |
|---|---|---|
| [0001 — Initial build](0001-initial-build.md) | {{PLAN_0001_GOAL}} | Phase 0 |

With no active plans, work comes straight from the issue queue
([`workflow.md`](../workflow.md) "The queue").

## Lifecycle

1. **Propose.** One PR adds `NNNN-kebab-name.md` (the next unused number —
   never reuse one), adds its row above, and writes the behavior it will build
   into `SPEC.md`, marked `Planned (plan NNNN):`.
2. **Open a phase.** File the phase's issues — each citing the spec section it
   implements, with `Depends on #N` where order matters. Optionally group them
   in a milestone named `NNNN · Phase N`, whose description links the plan
   rather than restating it. Don't file later phases' issues yet.
3. **Build.** Sessions work the issues through the normal working loop
   ([`AGENTS.md`](../../AGENTS.md) "Working loop").
4. **QA pass.** When the phase's issues are merged, walk its Exit criteria
   against the assembled `main`, re-run the full gate, and confirm the spec
   describes what shipped. A failed or partial pass isn't a close: file the
   gaps as issues in the same phase. Record the checked-off criteria in the
   description of the PR that closes the phase, and update "Current phase"
   above.
5. **Finish.** The PR that closes the last phase deletes the plan file and its
   row, and confirms that no `Planned (plan NNNN)` marker is left in the spec.

## Format

```markdown
# Plan NNNN — Title

`status: active — phase N`

## Goal

One or two sentences: the outcome, and how you'll know it's reached.

## Spec changes

The SPEC.md sections this plan adds or changes (marked `Planned (plan NNNN):`
there). The behavior itself is written in the spec, not here.

## Phases

### Phase 1 — Name

**Entry:** what must already be true.

**Build:** what to create — each item sized for one issue.

**Exit:**

- [ ] Checkable done-criteria.

## Out of scope

What this plan deliberately leaves for later.
```

A plan holds only the *how*: order, slicing, and done-criteria. If a phase
needs design deliberation, it happens in that phase's issue and PR, and the
outcome goes into the spec.
