-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/07-functions/Lean/Module 7 - Inverse example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

def p (x : ℝ) : ℝ := 2 * x - 5
noncomputable def pinv (y : ℝ) : ℝ := (y + 5) / 2

theorem pinv_left : LeftInverse pinv p := by
  intro x
  dsimp only [p, pinv]
  ring

theorem pinv_right : RightInverse pinv p := by
  intro y
  dsimp only [p, pinv]
  ring

example : Bijective p := ⟨pinv_left.injective, pinv_right.surjective⟩
