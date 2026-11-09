-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/07-functions/Lean/Module 7 - Images and preimages example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : (fun x : ℝ ↦ x ^ 2) '' {0, 1} = {0, 1} := by
  ext y
  show (∃ x : ℝ, (x = 0 ∨ x = 1) ∧ x ^ 2 = y) ↔ y = 0 ∨ y = 1
  constructor
  · rintro ⟨x, rfl | rfl, rfl⟩ <;> norm_num
  · rintro (rfl | rfl)
    · use 0
      norm_num
    · use 1
      norm_num

example : (fun x : ℝ ↦ x ^ 2) ⁻¹' {0, 1} = {-1, 0, 1} := by
  ext x
  show x ^ 2 = 0 ∨ x ^ 2 = 1 ↔ x = -1 ∨ x = 0 ∨ x = 1
  constructor
  · rintro (h | h)
    · right
      left
      simp at h
      exact h
    · have h2 : (x + 1) * (x - 1) = 0 := by nlinarith
      obtain h3 | h3 := eq_zero_or_eq_zero_of_mul_eq_zero h2
      · left
        linarith
      · right
        right
        linarith
  · rintro (rfl | rfl | rfl) <;> norm_num
