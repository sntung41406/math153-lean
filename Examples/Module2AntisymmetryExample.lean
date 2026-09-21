-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/02-proofs-with-structure/Lean/Module 2 - Antisymmetry example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {a b : ℝ} (h1 : a ^ 2 + b ^ 2 = 0) : a ^ 2 = 0 := by
  apply le_antisymm
  calc
    a ^ 2 ≤ a ^ 2 + b ^ 2 := by nlinarith [sq_nonneg b]
    _ = 0                 := h1
  positivity
