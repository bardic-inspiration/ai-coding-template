<!-- TEMPLATE: delete this banner once the project is adopted. -->
> **This repository is a template** for agent-built projects. See
> [`TEMPLATE.md`](TEMPLATE.md) to adopt it.

# {{PROJECT_NAME}}

<!-- TEMPLATE: one paragraph — what this is, who it's for, and what it
deliberately is not. -->

{{PROJECT_SUMMARY}}

## Status

<!-- TEMPLATE: one line on where the project stands, then point at the live
tracker (issues, milestones, a roadmap doc) rather than restating it here —
a status restated in two places drifts. -->

## How this repo is built

This project is developed largely by AI coding agents working in small,
verifiable steps:

1. Work is sliced into PR-sized GitHub issues with testable acceptance
   criteria ([`docs/issue-standards.md`](docs/issue-standards.md)).
2. Agent sessions — memoryless, often scheduled — each take one issue, follow
   the working loop in [`AGENTS.md`](AGENTS.md) (test first, green gate,
   atomic commits), and open one PR.
3. CI and review keep each PR honest: the gate must be green, each PR carries
   one concern, and every issue and PR ends with a plain-English TL;DR.
4. Each PR lands as a single squash commit, so `git log` on `main` reads one
   line per issue, with the full why in each commit body.

Agents and humans starting fresh should read [`AGENTS.md`](AGENTS.md) first —
it is the canonical guide.

## Development

<!-- TEMPLATE: optionally a short code block of the most common commands; the
full list stays in AGENTS.md §5. -->

The commands to install, lint, test, and run are in [`AGENTS.md`](AGENTS.md)
§5.

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md) to get set up.
[`AGENTS.md`](AGENTS.md) is the canonical guide for how to work, and its §4
routing table indexes the standards docs under [`docs/`](docs/).

## License

<!-- TEMPLATE: match LICENSE. -->

MIT — see [`LICENSE`](LICENSE).

<!-- TEMPLATE: optional AI-usage disclosure. If the project publishes an LLM
Facts label (https://github.com/bardic-inspiration/llm-facts), fill in
.llm-facts.yml, render the label, and uncomment this section; otherwise delete
this comment and .llm-facts.yml.

## LLM Facts

<p align="center">
  <img src=".github/llm-facts.png" alt="LLM Facts label for this repository" width="620">
</p>

An LLM Facts label for this repo's AI-assisted development, rendered from
[`.llm-facts.yml`](.llm-facts.yml).
-->
