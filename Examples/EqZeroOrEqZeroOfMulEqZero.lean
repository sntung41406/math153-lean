-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/eq_zero_or_eq_zero_of_mul_eq_zero.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℝ} (h : (x - 1) * (x - 2) = 0) : x - 1 = 0 ∨ x - 2 = 0 :=
  eq_zero_or_eq_zero_of_mul_eq_zero h
