-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/iff.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℝ} : 2 * x = 6 ↔ x = 3 := by
  constructor
  · intro h
    linarith
  · intro h
    linarith

example {x : ℝ} (h : 2 * x = 6 ↔ x = 3) (hx : x = 3) : 2 * x = 6 := h.mpr hx
