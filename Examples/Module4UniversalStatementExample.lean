-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/04-proofs-with-structure-ii/Lean/Module 4 - Universal statement example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ∃ b : ℝ, ∀ x : ℝ, b ≤ x ^ 2 - 2 * x := by
  use -1
  intro x
  nlinarith [sq_nonneg (x - 1)]
