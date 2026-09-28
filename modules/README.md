# Modules

Opt-in layers on top of the core template. Each module is a directory whose
contents are **copied into the repo root** when adopted — paths and relative
links inside a module are written for their destination, not for where they
sit in `modules/`. Each module's `README.md` lists the files it adds and the
slots it fills in core files.

Delete this directory once adoption is done (see [`TEMPLATE.md`](../TEMPLATE.md)).

No modules are published yet.

## Planned

Stack modules — `node`, `python`, and so on — each supplying the parts of the
core that are deliberately stack-shaped:

- the command table in `AGENTS.md` §5 and the matching `env:` block in
  `.github/workflows/ci.yml`;
- the toolchain setup step (and runtime matrix, if any) in `ci.yml`;
- the runner and layout sections of `docs/testing-standards.md`;
- the code section of `docs/naming-conventions.md`;
- `.gitignore` entries for the toolchain.

A stack module fills these slots; it never changes the contracts in
`docs/ci-standards.md` or `docs/testing-standards.md`.
