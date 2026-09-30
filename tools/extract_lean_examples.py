#!/usr/bin/env python3
"""Extract fenced ```lean code blocks from exported Markdown into runnable .lean files.

Second stage of the publication pipeline (see Public_repo_plan.md, "Lean workspace
for students"): run after export_public.py. Reads the same manifest's 'include' list,
pulls every ```lean fenced block out of each exported note, and writes one generated
.lean file per source note under <out>/Examples/, mirroring the note's relative path.

Generated files are build output: do not hand-edit them, edit the source note instead.

Usage:
    python3 scripts/extract_lean_examples.py --manifest scripts/manifest.json --out <public-repo-dir>
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
LEAN_BLOCK_RE = re.compile(r"```lean\n(.*?)```", re.DOTALL)

IMPORT_RE = re.compile(r"^import\s")


def join_blocks(blocks: list[str]) -> str:
    """Join a note's blocks into one file body with every `import` at the top.

    Each block on a page is written to run on its own, so a page with two blocks
    usually repeats `import Mathlib`. Lean only accepts imports at the start of a
    file, so the repeats are collected, de-duplicated in order, and hoisted.
    A page with a single block comes out exactly as before.
    """
    imports: list[str] = []
    bodies: list[str] = []
    for block in blocks:
        rest: list[str] = []
        for line in block.rstrip().splitlines():
            if IMPORT_RE.match(line):
                if line not in imports:
                    imports.append(line)
            else:
                rest.append(line)
        body = "\n".join(rest).strip("\n")
        if body:
            bodies.append(body)
    parts = ["\n".join(imports)] if imports else []
    parts += bodies
    return "\n\n".join(parts) + "\n"


def lean_module_name(stem: str) -> str:
    """Turn an arbitrary note name into a valid Lean module identifier."""
    words = re.split(r"[^A-Za-z0-9]+", stem)
    return "".join(w.capitalize() for w in words if w) or "Example"


HEADER = (
    "-- GENERATED FILE — do not edit by hand.\n"
    "-- Extracted from {source} by scripts/extract_lean_examples.py.\n"
    "-- Edit the Markdown source and re-run the publication pipeline instead.\n\n"
)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()

    manifest = json.loads(args.manifest.read_text())
    include = manifest.get("include", [])

    # First pass: collect the blocks and the generated module name each note
    # claims. Two notes can normalise to the same Lean module name -- the
    # mangler drops every character outside [A-Za-z0-9], so `mul_right_cancel₀`
    # and a future `mul_right_cancel` would both become `MulRightCancel`. Writing
    # both would silently publish one note's examples under the other's name, so
    # collisions fail the extraction before anything is written.
    planned: dict[str, tuple[str, list[str]]] = {}
    collisions: list[str] = []
    for doc_name in include:
        src = REPO_ROOT / f"{doc_name}.md"
        if not src.exists():
            print(f"EXTRACT FAILED: {src} does not exist", file=sys.stderr)
            return 1

        blocks = LEAN_BLOCK_RE.findall(src.read_text())
        if not blocks:
            continue

        module = lean_module_name(Path(doc_name).name)
        if module in planned:
            collisions.append(
                f"{module}.lean is claimed by both {planned[module][0]}.md and {doc_name}.md"
            )
            continue
        planned[module] = (doc_name, blocks)

    if collisions:
        print("EXTRACT FAILED: generated module name collision:", file=sys.stderr)
        for c in collisions:
            print(f"  - {c}", file=sys.stderr)
        print(
            "  rename one of the source notes so the generated names differ",
            file=sys.stderr,
        )
        return 1

    written = 0
    for module, (doc_name, blocks) in planned.items():
        dest = args.out / "Examples" / f"{module}.lean"
        dest.parent.mkdir(parents=True, exist_ok=True)
        body = HEADER.format(source=f"{doc_name}.md")
        body += join_blocks(blocks)
        dest.write_text(body)
        written += 1

    print(f"Extracted {written} generated .lean file(s) to {args.out / 'Examples'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
