-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/02-proofs-with-structure/Lean/Module 2 - Cancellation example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {t : ℝ} (h1 : t ^ 2 = 3 * t) (h2 : t ≥ 1) : t ≥ 2 := by
  have h3 : t * t = 3 * t := by
    calc
      t * t = t ^ 2 := by ring
      _ = 3 * t     := by rw [h1]
  have h4 : t = 3 := mul_right_cancel₀ (ne_of_gt (by linarith)) h3
  linarith
