-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/06-induction/Lean/Module 6 - Recursive sequence example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

def A : ℕ → ℚ
  | 0 => 0
  | n + 1 => A n + (n + 1)

example (n : ℕ) : A n = n * (n + 1) / 2 := by
  induction n with
  | zero =>
    calc A 0 = 0 := by rw [A]
      _ = (0 : ℚ) * (0 + 1) / 2 := by norm_num
  | succ k IH =>
    push_cast
    calc A (k + 1) = A k + (k + 1) := by rw [A]
      _ = k * (k + 1) / 2 + (k + 1) := by rw [IH]
      _ = (k + 1) * (k + 1 + 1) / 2 := by ring
