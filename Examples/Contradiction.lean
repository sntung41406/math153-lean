-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/contradiction.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℝ} (h : x > 0) (h' : ¬ x > 0) : x = 5 := by
  contradiction
