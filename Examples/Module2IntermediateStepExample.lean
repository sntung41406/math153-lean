-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/02-proofs-with-structure/Lean/Module 2 - Intermediate step example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {a b : ℝ} (h1 : a - 5 * b = 4) (h2 : b + 2 = 3) : a = 9 := by
  have hb : b = 1 := by linarith
  calc
    a = a - 5 * b + 5 * b := by ring
    _ = 4 + 5 * 1         := by rw [h1, hb]
    _ = 9                 := by ring
