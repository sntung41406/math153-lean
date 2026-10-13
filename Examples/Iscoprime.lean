-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/IsCoprime.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : IsCoprime (8 : ℤ) 5 := by
  use 2, -3
  norm_num
