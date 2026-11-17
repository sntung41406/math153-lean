-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/if-then-else.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

def sgn (z : ℤ) : ℤ := if 0 ≤ z then 1 else -1

example : sgn (-3) = -1 := by
  norm_num [sgn]
