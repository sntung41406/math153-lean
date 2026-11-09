-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/07-functions/Lean/Module 7 - Non-injective and non-surjective example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

example : ¬ Injective (fun x : ℝ ↦ x ^ 2) := by
  intro h
  have h1 : (-1 : ℝ) = 1 := h (by norm_num)
  norm_num at h1

example : ¬ Surjective (fun x : ℝ ↦ x ^ 2) := by
  intro h
  obtain ⟨x, hx⟩ := h (-1)
  nlinarith [sq_nonneg x]
