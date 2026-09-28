# Testing Standards

Test-driven development is **required**: write a failing test before the code
that makes it pass. This is the stack-agnostic contract; the runner, file
layout, and commands come from the stack ([`AGENTS.md`](../AGENTS.md) §5).

## Core workflow

- **Red → Green → Refactor**, applied incrementally **per behavior**, not per
  module. Write the smallest failing test that encodes one acceptance
  criterion, make it pass with minimal code, then refactor with the test as a
  safety net.
- An issue's **acceptance criteria are your pre-written failing tests.** If a
  criterion can't become a test, it isn't specific enough — raise it on the
  issue ([`issue-standards.md`](issue-standards.md)).
- **Bug fixes ship with a regression test** that fails before the fix.

## Test organization

<!-- TEMPLATE: filled in by the stack module — the runner, where tests live
(co-located `foo.test.*` or a `tests/` tree), file naming, and the fixture
directory. -->

- Tests mirror the source structure. Pick co-located or a separate test tree
  and be consistent within a package or module.
- Test names state the behavior: "returns an empty list when the input is
  empty", not "test_parse_2".
- Shared test data lives in one fixtures directory. For each surface, provide
  a **minimal**, a **typical**, and a **maxed-out** case to exercise the edges.

## Tests are deterministic

- No wall-clock time, unseeded randomness, live network, or dependence on test
  order. Inject a clock, seed the random source, stub the network.
- A flaky test is a defect to fix, not a reason to re-run CI until it passes.

## Tests that guard hard rules

Every hard rule in [`AGENTS.md`](../AGENTS.md) §2 that a machine can check
should have a test or lint rule that fails when the rule breaks — rather than
relying on reviewers to notice. Name the rule in the test so a failure points
straight at it.

Lessons that carry across projects:

- **Determinism / reproducibility tests** compare two *independent* runs that
  share no state (a fresh process, or a reset module cache), and compare the
  **raw output bytes** — never a re-serialization of parsed objects, which can
  hide drift such as key order.
- **Boundary tests** (module A must never import module B) belong in lint when
  the linter can express them, so they fail at the earliest, cheapest step.
- **Identity tests** — "these two entry points must call the *same*
  function" — assert the reference itself, not merely equal output.

## Manual verification

If a change affects what users see, run the product and look at it —
automated tests don't prove an interface works. Record what you checked in the
PR's Testing section, with screenshots
([`pr-standards.md`](pr-standards.md) "Screenshots").

## Quality bar to merge

- The full suite is **green**. No skipped tests, unless marked with a reason in
  the code and justified in the PR.
- New behavior ships with its tests, in the same commit
  ([`commit-standards.md`](commit-standards.md)).
- Hard-rule tests pass.
- CI runs the whole gate and must be green before merge
  ([`ci-standards.md`](ci-standards.md)). Markdown-only changes skip this
  ([`docs-only-changes.md`](docs-only-changes.md)).
