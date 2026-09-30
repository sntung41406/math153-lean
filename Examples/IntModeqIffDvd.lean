-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Int.modEq_iff_dvd.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : (-5 : ℤ) ≡ 1 [ZMOD 3] := by
  rw [Int.modEq_iff_dvd]
  use 2
  norm_num
