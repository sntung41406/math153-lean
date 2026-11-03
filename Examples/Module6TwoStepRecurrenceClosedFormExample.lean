-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/06-induction/Lean/Module 6 - Two-step recurrence closed form example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

def a : ℕ → ℤ
  | 0 => 2
  | 1 => 1
  | n + 2 => a (n + 1) + 2 * a n

theorem a_closed_form : ∀ n, a n = 2 ^ n + (-1) ^ n
  | 0 => by
      rw [a]
      norm_num
  | 1 => by
      rw [a]
      norm_num
  | k + 2 => by
      have IH1 := a_closed_form (k + 1)
      have IH2 := a_closed_form k
      calc a (k + 2) = a (k + 1) + 2 * a k := by rw [a]
        _ = (2 ^ (k + 1) + (-1) ^ (k + 1)) + 2 * (2 ^ k + (-1) ^ k) := by rw [IH1, IH2]
        _ = 2 ^ (k + 2) + (-1) ^ (k + 2) := by ring

example (n : ℕ) :
    a n = 2 ^ n + (-1) ^ n ∧ a (n + 1) = 2 ^ (n + 1) + (-1) ^ (n + 1) := by
  induction n with
  | zero =>
    constructor
    · rw [a]
      norm_num
    · rw [a]
      norm_num
  | succ k IH =>
    obtain ⟨IH1, IH2⟩ := IH
    constructor
    · exact IH2
    · calc a (k + 1 + 1) = a (k + 1) + 2 * a k := by rw [a]
        _ = 2 ^ (k + 1 + 1) + (-1) ^ (k + 1 + 1) := by
          rw [IH1, IH2]
          ring
