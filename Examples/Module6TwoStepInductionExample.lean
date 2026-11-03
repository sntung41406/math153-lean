-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/06-induction/Lean/Module 6 - Two-step induction example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

def F : ℕ → ℤ
  | 0 => 1
  | 1 => 1
  | n + 2 => F (n + 1) + F n

theorem F_le_two_pow : ∀ n, F n ≤ 2 ^ n
  | 0 => by rw [F]; norm_num
  | 1 => by rw [F]; norm_num
  | k + 2 => by
      have IH1 := F_le_two_pow (k + 1)
      have IH2 := F_le_two_pow k
      have h1 : (2 : ℤ) ^ (k + 2) = 2 * 2 ^ (k + 1) := by ring
      have h2 : (2 : ℤ) ^ (k + 1) = 2 * 2 ^ k := by ring
      have h3 : (0 : ℤ) ≤ 2 ^ k := by positivity
      calc F (k + 2) = F (k + 1) + F k := by rw [F]
        _ ≤ 2 ^ (k + 1) + 2 ^ k := by linarith
        _ ≤ 2 ^ (k + 2) := by linarith
