-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/06-induction/Lean/Module 6 - Induction from a starting point example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {n : ℕ} (hn : 2 ≤ n) : (3 : ℤ) ^ n ≥ 2 ^ n + 5 := by
  induction n, hn using Nat.le_induction with
  | base => norm_num
  | succ k hk IH =>
    have h3 : (3 : ℤ) ^ (k + 1) = 3 * 3 ^ k := by ring
    have h2 : (2 : ℤ) ^ (k + 1) = 2 * 2 ^ k := by ring
    have hpos : (0 : ℤ) ≤ 2 ^ k := by positivity
    linarith [IH, h3, h2, hpos]
