-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/nlinarith.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x y : ℝ} (hx : 0 ≤ x) (hy : 0 ≤ y) : 0 ≤ x * y := by
  nlinarith
