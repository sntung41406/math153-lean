-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/01-proofs-by-calculation/Lean/Module 1 - Forward and reverse rewrite.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x y z : ℝ} (h1 : y = x + 1) (h2 : z = x + 1) : y = z := by
  calc
    y = x + 1 := by rw [h1]
    _ = z     := by rw [← h2]
