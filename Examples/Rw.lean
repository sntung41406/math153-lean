-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/rw.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (a b : ℕ) (h : a = b) : a + 1 = b + 1 := by rw [h]

example {x : ℝ} (h : x + 1 = 3 ↔ x = 2) (hx : x = 2) : x + 1 = 3 := by
  rw [h]
  exact hx
