-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/01-proofs-by-calculation/Lean/Module 1 - Creating a useful expression.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℤ} (h : x + 4 = 2) : x = -2 := by
  calc
    x = (x + 4) - 4 := by ring
    _ = 2 - 4        := by rw [h]
    _ = -2            := by norm_num
