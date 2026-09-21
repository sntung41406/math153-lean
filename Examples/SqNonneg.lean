-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/sq_nonneg.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (m n : ℤ) (h : m ^ 2 + n ≤ 2) : n ≤ 2 := by nlinarith [sq_nonneg m]
