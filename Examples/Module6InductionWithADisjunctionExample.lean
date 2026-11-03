-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/06-induction/Lean/Module 6 - Induction with a disjunction example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (n : ℕ) : (4 : ℤ) ^ n ≡ 1 [ZMOD 15] ∨ (4 : ℤ) ^ n ≡ 4 [ZMOD 15] := by
  induction n with
  | zero =>
    left
    norm_num
  | succ k IH =>
    obtain hk | hk := IH
    · right
      calc (4 : ℤ) ^ (k + 1) = 4 * 4 ^ k := by ring
        _ ≡ 4 * 1 [ZMOD 15] := by rel [hk]
        _ = 4 := by norm_num
    · left
      calc (4 : ℤ) ^ (k + 1) = 4 * 4 ^ k := by ring
        _ ≡ 4 * 4 [ZMOD 15] := by rel [hk]
        _ ≡ 1 [ZMOD 15] := by decide
