-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/05-logic/Lean/Module 5 - Nested negation example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example :
    ¬ (∀ m : ℤ, m ≠ 2 → ∃ n : ℤ, n ^ 2 = m) ↔ ∃ m : ℤ, m ≠ 2 ∧ ∀ n : ℤ, n ^ 2 ≠ m := by
  push Not
  rfl

example : ¬ (∀ m : ℤ, m ≠ 2 → ∃ n : ℤ, n ^ 2 = m) := by
  push Not
  use 3
  constructor
  · norm_num
  · intro n hn
    have h1 : -2 < n := by nlinarith
    have h2 : n < 2 := by nlinarith
    interval_cases n
    · norm_num at hn
    · norm_num at hn
    · norm_num at hn
