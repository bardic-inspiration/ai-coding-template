# Modules

Opt-in layers on top of the core template. Each module is a directory whose
contents are **copied into the repo root** when adopted — paths and relative
links inside a module are written for their destination, not for where they
sit in `modules/`. Each module's `README.md` lists the files it adds and the
slots it fills in core files.

Delete this directory once adoption is done (see [`TEMPLATE.md`](../TEMPLATE.md)).

No modules are published yet.

## Planned

Stack modules — `node`, `python`, and so on — each fill the slots in the core
that are deliberately stack-shaped:

- `check`, defined in the stack's task runner, and the command table in
  `AGENTS.md` "Commands";
- the gate steps in `.github/workflows/ci.yml` — toolchain setup, install,
  `check` — and a runtime matrix, if any;
- the package ecosystem in `.github/dependabot.yml`;
- the install step in `.claude/hooks/session-start.sh`;
- the "Organization" section of `docs/testing.md` and the "Code" naming
  section of `docs/documentation.md`;
- `.gitignore` entries for the toolchain.

A stack module fills these slots; it never changes the contracts in
`docs/ci.md` or `docs/testing.md`.
