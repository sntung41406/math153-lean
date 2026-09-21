-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/calc.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (a : ℤ) (h : a = 2) : a + 1 = 3 := by
  calc a + 1 = 2 + 1 := by rw [h]
    _         = 3     := by norm_num

example (a : ℤ) (h : a = 2) : a + 1 = 3 := by
  calc a + 1
    _ = 2 + 1 := by rw [h]
    _ = 3     := by norm_num
