-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/02-proofs-with-structure/Lean/Module 2 - Manufactured or-statement example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {n : ℕ} : n ^ 2 ≠ 2 := by
  obtain hn | hn := lt_or_ge n 2
  · apply ne_of_lt
    calc
      n ^ 2 ≤ 1 ^ 2 := Nat.pow_le_pow_left (by omega) 2
      _ < 2          := by norm_num
  · apply ne_of_gt
    calc
      (2:ℕ) < 2 ^ 2 := by norm_num
      _ ≤ n ^ 2       := Nat.pow_le_pow_left hn 2
