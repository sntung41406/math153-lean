-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/03-parity-divisibility-number-theory/Lean/Module 3 - Numeric witnesses.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : Odd (-3 : ℤ) := by
  use -2
  norm_num

example : Even (26 : ℤ) := by
  use 13
  norm_num

example : (11 : ℕ) ∣ 88 := by
  use 8

example : (-2 : ℤ) ∣ 6 := by
  use -3
  norm_num

example (t : ℤ) : t ∣ 0 := by
  use 0
  ring
