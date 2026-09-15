-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/01-proofs-by-calculation/Lean/Module 1 - Numeric calculation.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {total : ℤ} (h : total = 12) : total - 4 = 8 := by
  calc
    total - 4 = 12 - 4 := by rw [h]
    _         = 8      := by norm_num
