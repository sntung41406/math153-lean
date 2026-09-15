-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/01-proofs-by-calculation/Lean/Module 1 - Order-preserving step.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℤ} (h : x ≤ 2) : x + 3 ≤ 5 := by
  calc
    x + 3 ≤ 2 + 3 := add_le_add_left h 3
    _     = 5     := by norm_num
