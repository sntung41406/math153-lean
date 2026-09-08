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

    written = 0
    for doc_name in include:
        src = REPO_ROOT / f"{doc_name}.md"
        if not src.exists():
            print(f"EXTRACT FAILED: {src} does not exist", file=sys.stderr)
            return 1

        blocks = LEAN_BLOCK_RE.findall(src.read_text())
        if not blocks:
            continue

        dest = args.out / "Examples" / f"{lean_module_name(Path(doc_name).name)}.lean"
        dest.parent.mkdir(parents=True, exist_ok=True)
        body = HEADER.format(source=f"{doc_name}.md")
        body += "\n\n".join(block.rstrip() for block in blocks) + "\n"
        dest.write_text(body)
        written += 1

    print(f"Extracted {written} generated .lean file(s) to {args.out / 'Examples'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
