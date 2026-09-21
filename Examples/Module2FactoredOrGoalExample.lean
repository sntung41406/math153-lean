-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/02-proofs-with-structure/Lean/Module 2 - Factored or-goal example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℝ} (hx : x ^ 2 - 3 * x + 2 = 0) : x = 1 ∨ x = 2 := by
  have h1 : (x - 1) * (x - 2) = 0 := by
    calc
      (x - 1) * (x - 2) = x ^ 2 - 3 * x + 2 := by ring
      _ = 0                                 := by rw [hx]
  obtain h2 | h2 := eq_zero_or_eq_zero_of_mul_eq_zero h1
  · left
    linarith
  · right
    linarith
