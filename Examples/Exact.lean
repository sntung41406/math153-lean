-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/exact.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {a : ℝ} (h1 : 1 ^ 2 ≤ a ^ 2) (h2 : 0 ≤ a) : 1 ≤ a := by
  exact le_of_pow_le_pow_left₀ (by norm_num) h2 h1

example {a : ℝ} (h : a = 2) : a = 2 := h
