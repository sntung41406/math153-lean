-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Integer enumeration example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

def e (n : ℕ) : ℤ := if n % 2 = 0 then n / 2 else -((n + 1) / 2)

def d (z : ℤ) : ℕ := if 0 ≤ z then 2 * z.natAbs else 2 * z.natAbs - 1

example : e 0 = 0 ∧ e 1 = -1 ∧ e 2 = 1 ∧ e 3 = -2 ∧ e 4 = 2 := by
  norm_num [e]

theorem d_left : LeftInverse d e := by
  intro n
  dsimp only [e, d]
  split_ifs <;> omega

theorem d_right : RightInverse d e := by
  intro z
  dsimp only [e, d]
  split_ifs <;> omega

example : Bijective e := ⟨d_left.injective, d_right.surjective⟩
