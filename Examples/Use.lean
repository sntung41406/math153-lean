-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/use.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (x : ℝ) : ∃ y : ℝ, y > x := by
  use x + 1
  linarith
