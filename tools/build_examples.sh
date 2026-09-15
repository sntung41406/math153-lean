#!/usr/bin/env bash
# Build every generated example module by its explicit Lake target name.
#
# `lake build` against the "Examples" library's own aggregate default target
# (i.e. plain `lake build`, or `lake build Examples`) fails at Lake's "job
# computation" step with "error: Examples: some modules have bad imports" on
# Lake 5.0.0-src+819816b / Lean 4.33.1 (the toolchain this repo pins as of
# 2026-09) -- reproducibly, even for a bare lean_lib with zero-import trivial
# files, so it is unrelated to Mathlib or to any example's content. Building
# each module by its explicit name (e.g. `lake build Examples.Foo`) does not
# hit this and completes normally. This script works around it by discovering
# and building every generated module explicitly; it also gives clearer,
# per-file failures in CI. Re-check whether this is still needed next time
# the pinned toolchain is upgraded.
#
# Usage: tools/build_examples.sh   (run from the repository root)
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

targets=()
for f in Examples/*.lean; do
  [ -e "$f" ] || continue
  targets+=("Examples.$(basename "$f" .lean)")
done

if [ ${#targets[@]} -eq 0 ]; then
  echo "no generated examples found under Examples/" >&2
  exit 1
fi

echo "building: ${targets[*]}"
lake build "${targets[@]}"
