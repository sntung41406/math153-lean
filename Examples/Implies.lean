-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/implies.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℝ} : x > 2 → x ^ 2 > 4 := by
  intro h
  nlinarith

example {x : ℝ} (h : x > 2 → x ^ 2 > 4) (hx : x > 2) : x ^ 2 > 4 := h hx
