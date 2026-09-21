-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/exists.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ∃ n : ℤ, 12 * n = 84 := by
  use 7
  norm_num
