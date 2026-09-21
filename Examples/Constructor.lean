-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/constructor.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {a b : ℝ} (ha : a = 9) (hb : b = 1) : a = 9 ∧ b = 1 := by
  constructor
  · exact ha
  · exact hb
