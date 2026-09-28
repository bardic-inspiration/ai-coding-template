#!/bin/bash
# SessionStart hook: prepares a cloud session so `check` can run
# (AGENTS.md "Commands"). Runs only in Claude Code on the web; a local machine
# is set up by hand (CONTRIBUTING.md).
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-.}"

# TEMPLATE: install dependencies here (a stack module fills this in). The
# container is cached once this hook completes, so prefer the install form
# that reuses what's already there (e.g. `npm install` over `npm ci`). Keep it
# idempotent and non-interactive.
