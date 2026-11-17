-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Membership example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : 1 ∈ {n : ℤ | n ≤ 3} := by
  show (1 : ℤ) ≤ 3
  norm_num

example : 10 ∉ {n : ℕ | Odd n} := by
  show ¬ Odd 10
  rw [Nat.odd_iff]
  norm_num
