-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/04-proofs-with-structure-ii/Lean/Module 4 - Prime example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : Nat.Prime 2 := by
  rw [Nat.prime_def]
  constructor
  · norm_num
  intro m hm
  have h1 : m ≤ 2 := Nat.le_of_dvd (by norm_num) hm
  have h2 : 0 < m := Nat.pos_of_dvd_of_pos hm (by norm_num)
  interval_cases m
  · left
    rfl
  · right
    rfl
