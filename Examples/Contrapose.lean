-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/contrapose.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℝ} (h : x ^ 2 < 4) : x < 2 := by
  contrapose! h
  nlinarith
