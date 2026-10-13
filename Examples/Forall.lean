-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/forall.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ∀ x : ℝ, x ^ 2 + 1 > 0 := by
  intro x
  positivity

example (h : ∀ x : ℝ, x ^ 2 + 1 > 0) : (3 : ℝ) ^ 2 + 1 > 0 := h 3
