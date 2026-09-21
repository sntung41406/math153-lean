-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/and.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : (2 : ℤ) + 2 = 4 ∧ (3 : ℤ) < 5 := by
  constructor
  · norm_num
  · norm_num
