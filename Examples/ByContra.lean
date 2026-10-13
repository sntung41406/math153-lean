-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/by_contra.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℝ} (h : x ^ 2 < 1) : x < 1 := by
  by_contra hx
  have hx' : 1 ≤ x := not_lt.mp hx
  nlinarith
