-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/03-parity-divisibility-number-theory/Lean/Module 3 - Congruence from divisibility.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : (11 : ℤ) ≡ 3 [ZMOD 4] := by
  rw [Int.modEq_iff_dvd]
  use -2
  norm_num
