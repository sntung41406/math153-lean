-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/04-proofs-with-structure-ii/Lean/Module 4 - Contradictory hypotheses example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {t : ℤ} (h2 : t < 3) (h : t - 1 = 6) : t = 13 := by
  have H : (7:ℤ) < 3 := by
    have ht : t = 7 := by linarith
    rw [ht] at h2
    exact h2
  norm_num at H

example {t : ℤ} (h2 : t < 3) (h : t - 1 = 6) : t = 13 := by
  have H : (7:ℤ) < 3 := by
    have ht : t = 7 := by linarith
    rw [ht] at h2
    exact h2
  contradiction
