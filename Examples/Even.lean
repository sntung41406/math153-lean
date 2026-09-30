-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Even.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : Even (10 : ℤ) := by
  use 5
  norm_num
