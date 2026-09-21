-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/02-proofs-with-structure/Lean/Module 2 - And goal example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {a b : ℝ} (h1 : a - 5 * b = 4) (h2 : b + 2 = 3) : a = 9 ∧ b = 1 := by
  constructor
  · calc
      a = 4 + 5 * b := by linarith
      _ = -6 + 5 * (b + 2) := by ring
      _ = -6 + 5 * 3       := by rw [h2]
      _ = 9                := by ring
  · linarith
