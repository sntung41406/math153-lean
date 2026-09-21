-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/add_le_add_left.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (x : ℤ) (h : x ≤ 2) : x + 3 ≤ 2 + 3 := add_le_add_left h 3
