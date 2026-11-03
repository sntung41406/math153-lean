-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/push_cast.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (k : ℕ) : ((k + 1 : ℕ) : ℚ) = (k : ℚ) + 1 := by
  push_cast
  rfl
