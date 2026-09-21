-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/mul_right_cancel₀.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {t : ℝ} (ht : t ≠ 0) (h : t * t = 3 * t) : t = 3 := mul_right_cancel₀ ht h
