-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/02-proofs-with-structure/Lean/Module 2 - Same-exponent cancellation example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {a b : ℝ} (h1 : a ^ 2 = b ^ 2 + 1) (h2 : a ≥ 0) : a ≥ 1 := by
  have h3 : a ^ 2 ≥ 1 ^ 2 := by
    calc
      a ^ 2 = b ^ 2 + 1 := h1
      _ ≥ 1             := by nlinarith [sq_nonneg b]
      _ = 1 ^ 2         := by ring
  exact le_of_pow_le_pow_left₀ (by norm_num) h2 h3
