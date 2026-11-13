# AI Coding Template

A repository template for projects built mostly by AI coding sessions. It is
the working standard — docs, CI, issue and PR templates, and Claude Code setup
— that lets sessions with no memory of each other build one project
coherently, with a human reviewing and merging. It carries no code and no
stack: the stack-shaped slots are filled when a project adopts it.

Written for a solo maintainer using Claude Code, mostly in cloud sessions.
The guide itself, [`AGENTS.md`](AGENTS.md), works with any agent.

To start a project from it, see [`TEMPLATE.md`](TEMPLATE.md).

## How a project built from it works

- **The task is the prompt, the PR is the response, review is the evaluation,
  and the squash commit on `main` is the record.**
- **The repo is the memory.** [`SPEC.md`](SPEC.md) says what to build, in the
  present tense; plans are GitHub issues; history is `git log`. Nothing
  depends on a chat the next session can't see.
- **One gate.** A single `check` command runs locally and in CI, and red is
  never merged.
- **Review is for intent.** The agent agrees what "done" means before
  building, tests first, and reviews its own diff; the human reads the
  summary, the spec change, and the tests, and merges.
- **Spikes explore, and never merge.** What reaches `main` is what was
  learned, rebuilt through the normal loop.

## What's in it

| Path | Purpose |
|---|---|
| [`AGENTS.md`](AGENTS.md) | How to work: modes, hard rules, the working loop, commands. Start here. |
| [`SPEC.md`](SPEC.md) | The spec skeleton: what to build. |
| [`CLAUDE.md`](CLAUDE.md) | Claude Code specifics, on top of `AGENTS.md`. |
| [`docs/`](docs/) | The protocol docs: spec-driven development, workflow, testing, CI, documentation. |
| [`.github/`](.github/) | The CI gate, the PR title check, Dependabot, issue and PR templates. |
| [`.claude/`](.claude/) | Settings, the session-start hook, and the `ask-me` / `grill-me` skills. |
| [`TEMPLATE.md`](TEMPLATE.md) | How to adopt it, and the GitHub settings that enforce it. |

## Changing the template

The template is built the way it prescribes: one concern per PR, a
Conventional Commits title, a squash merge. `{{PLACEHOLDERS}}` and `TEMPLATE:`
comments are deliberate — they are the slots an adopting project fills
([`TEMPLATE.md`](TEMPLATE.md) "Conventions").

## License

MIT — see [`LICENSE`](LICENSE).
