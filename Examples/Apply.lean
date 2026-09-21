-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/apply.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℚ} (h : x < 1) : x ≠ 1 := by
  apply ne_of_lt
  exact h
