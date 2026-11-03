-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/06-induction/Lean/Module 6 - Sufficiently large induction example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ∃ N : ℕ, ∀ n ≥ N, 2 ^ n ≥ n ^ 2 := by
  use 4
  intro n hn
  induction n, hn using Nat.le_induction with
  | base => norm_num
  | succ k hk IH =>
    calc 2 ^ (k + 1) = 2 * 2 ^ k := by ring
      _ ≥ 2 * k ^ 2 := by gcongr
      _ = k ^ 2 + k * k := by ring
      _ ≥ k ^ 2 + 4 * k := by gcongr
      _ = k ^ 2 + 2 * k + 2 * k := by ring
      _ ≥ k ^ 2 + 2 * k + 1 := by omega
      _ = (k + 1) ^ 2 := by ring
