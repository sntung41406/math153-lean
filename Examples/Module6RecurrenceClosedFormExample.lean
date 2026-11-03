-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/06-induction/Lean/Module 6 - Recurrence closed form example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

def x : ℕ → ℤ
  | 0 => 5
  | n + 1 => 2 * x n - 1

example (n : ℕ) : x n = 2 ^ (n + 2) + 1 := by
  induction n with
  | zero =>
    rw [x]
    norm_num
  | succ k IH =>
    calc x (k + 1) = 2 * x k - 1 := by rw [x]
      _ = 2 * (2 ^ (k + 2) + 1) - 1 := by rw [IH]
      _ = 2 ^ ((k + 1) + 2) + 1 := by ring
