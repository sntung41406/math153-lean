#!/usr/bin/env python3
"""Validate the published repository's own Markdown and generated Lean files.

This runs in the *public* repository's CI, with no access to the private
authoring vault, so it can only re-check what the export already produced —
it is not a replacement for the private pipeline's manifest/source validation
(see Public_repo_plan.md), only a second, independent gate against generated
files going stale or an accidental `sorry` slipping through unreviewed.

Checks:
  1. No `[[...]]` / `![[...]]` wiki-link syntax survives anywhere in tracked Markdown.
  2. Every relative Markdown link resolves to a file that actually exists in the repo.
  3. Examples/*.lean exactly matches what tools/extract_lean_examples.py would
     regenerate from the tracked Modules/**/*.md right now (catches hand-edits
     to generated files, and notes edited without re-running the pipeline).
  4. `sorry` appears only in the files explicitly allow-listed below.

Usage: python3 tools/validate.py
"""
from __future__ import annotations

import filecmp
import json
import re
import subprocess
import sys
import tempfile
from pathlib import Path
from urllib.parse import unquote

REPO_ROOT = Path(__file__).resolve().parent.parent
SKIP_DIRS = {".git", ".lake", ".github"}

WIKILINK_RE = re.compile(r"!?\[\[")
MD_LINK_RE = re.compile(r"(?<!!)\[[^\]]*\]\(([^)]+)\)")
SORRY_RE = re.compile(r"\bsorry\b")

# Files where a deliberate, teaching `sorry` is expected. Any other .lean file
# containing `sorry` fails validation -- update this list only when a new note
# deliberately teaches `sorry`.
SORRY_ALLOWLIST = {
    "Examples/Module0SorryPlaceholderExample.lean",
}


def iter_files(*, suffix: str) -> list[Path]:
    out = []
    for p in REPO_ROOT.rglob(f"*{suffix}"):
        if any(part in SKIP_DIRS for part in p.relative_to(REPO_ROOT).parts):
            continue
        out.append(p)
    return out


def check_no_wikilinks(md_files: list[Path]) -> list[str]:
    errors = []
    for f in md_files:
        if WIKILINK_RE.search(f.read_text()):
            errors.append(f"{f.relative_to(REPO_ROOT)}: contains unconverted [[ or ![[ syntax")
    return errors


def check_links_resolve(md_files: list[Path]) -> list[str]:
    errors = []
    for f in md_files:
        text = f.read_text()
        for m in MD_LINK_RE.finditer(text):
            href = m.group(1).split(" ", 1)[0]  # drop an optional "title" after the URL
            if href.startswith(("http://", "https://", "mailto:", "#")):
                continue
            path_part = unquote(href.split("#", 1)[0])
            if not path_part:
                continue
            target = (f.parent / path_part).resolve()
            if not target.exists():
                errors.append(f"{f.relative_to(REPO_ROOT)}: link target does not exist: {href!r}")
    return errors


def check_generated_freshness() -> list[str]:
    extractor = REPO_ROOT / "tools" / "extract_lean_examples.py"
    if not extractor.exists():
        return ["tools/extract_lean_examples.py is missing — cannot verify Examples/ freshness"]

    doc_names = [
        str(p.relative_to(REPO_ROOT))[:-3]
        for p in sorted((REPO_ROOT / "Modules").rglob("*.md"))
    ]

    with tempfile.TemporaryDirectory() as tmp:
        tmp_path = Path(tmp)
        manifest_path = tmp_path / "manifest.json"
        manifest_path.write_text(json.dumps({"include": doc_names, "deferred": []}))

        result = subprocess.run(
            [sys.executable, str(extractor), "--manifest", str(manifest_path), "--out", str(tmp_path)],
            capture_output=True, text=True,
        )
        if result.returncode != 0:
            return [f"regenerating Examples/ failed: {result.stderr}"]

        regenerated_dir = tmp_path / "Examples"
        committed_dir = REPO_ROOT / "Examples"

        regenerated = {p.name for p in regenerated_dir.glob("*.lean")} if regenerated_dir.exists() else set()
        committed = {p.name for p in committed_dir.glob("*.lean")} if committed_dir.exists() else set()

        errors = []
        for name in sorted(regenerated - committed):
            errors.append(f"Examples/{name} should exist (regenerated from notes) but is missing")
        for name in sorted(committed - regenerated):
            errors.append(f"Examples/{name} is committed but no longer regenerates from any note — stale")
        for name in sorted(regenerated & committed):
            if not filecmp.cmp(regenerated_dir / name, committed_dir / name, shallow=False):
                errors.append(f"Examples/{name} does not match what the notes regenerate — re-run scripts/publish.sh")
        return errors


def check_sorry_allowlist() -> list[str]:
    errors = []
    for f in iter_files(suffix=".lean"):
        rel = str(f.relative_to(REPO_ROOT))
        if SORRY_RE.search(f.read_text()) and rel not in SORRY_ALLOWLIST:
            errors.append(f"{rel}: contains 'sorry' but is not in SORRY_ALLOWLIST (tools/validate.py)")
    return errors


def main() -> int:
    md_files = iter_files(suffix=".md")
    errors: list[str] = []
    errors += check_no_wikilinks(md_files)
    errors += check_links_resolve(md_files)
    errors += check_generated_freshness()
    errors += check_sorry_allowlist()

    if errors:
        print("VALIDATION FAILED:")
        for e in errors:
            print(f"  - {e}")
        return 1

    print("Public repository validation passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
