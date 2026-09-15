-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/01-proofs-by-calculation/Lean/Module 1 - Equality proof by calc.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {a b : ℚ} (h1 : a - b = 4) (h2 : a * b = 1) : (a + b) ^ 2 = 20 := by
  calc
    (a + b) ^ 2 = (a - b) ^ 2 + 4 * (a * b) := by ring
    _           = 4 ^ 2 + 4 * 1             := by rw [h1, h2]
    _           = 20                        := by ring
