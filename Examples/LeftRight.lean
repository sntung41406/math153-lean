-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/left-right.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℝ} (hx : x = 2) : x = 1 ∨ x = 2 := by
  right
  exact hx
