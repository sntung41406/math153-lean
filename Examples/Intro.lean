-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/intro.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ∀ x : ℝ, x > 0 → x ^ 2 > 0 := by
  intro x hx
  positivity
