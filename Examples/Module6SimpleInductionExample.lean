-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/06-induction/Lean/Module 6 - Simple induction example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (n : ℕ) : 2 ^ n ≥ n + 1 := by
  induction n with
  | zero => norm_num
  | succ k IH =>
    calc 2 ^ (k + 1) = 2 * 2 ^ k := by ring
      _ ≥ 2 * (k + 1) := by gcongr
      _ = (k + 1 + 1) + k := by ring
      _ ≥ k + 1 + 1 := by omega
