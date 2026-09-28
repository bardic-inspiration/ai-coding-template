<!-- TEMPLATE: delete this banner once the project is adopted. -->
> **This repository is a template** for agent-built projects. See
> [`TEMPLATE.md`](TEMPLATE.md) to adopt it.

# {{PROJECT_NAME}}

<!-- TEMPLATE: one paragraph — what this is and who it's for. This is the
public face; SPEC.md holds the detailed purpose and non-goals. -->

{{PROJECT_SUMMARY}}

## Status

<!-- TEMPLATE: one line on where the project stands, then point at the live
tracker (issues, milestones, active plans) rather than restating it here. -->

## How this repo is built

This project is built largely by AI coding sessions — some interactive, some
running on a schedule — in small, verifiable steps:

- **The task is the prompt, the PR is the response, review is the evaluation,
  and the squash commit on `main` is the record.**
- [`SPEC.md`](SPEC.md) is the source of truth for what to build; work bigger
  than one PR is sequenced by a plan in [`docs/plans/`](docs/plans/README.md).
- Every change passes the same gate — one `check` command, run locally and in
  CI — and a human merges it.
- So `git log` on `main` reads one line per change, with its why in the body.

Agents and humans starting fresh should read [`AGENTS.md`](AGENTS.md) first.

## Development

See [`CONTRIBUTING.md`](CONTRIBUTING.md) to get set up; the commands are in
[`AGENTS.md`](AGENTS.md) "Commands".

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
