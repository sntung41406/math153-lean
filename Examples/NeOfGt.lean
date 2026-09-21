-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/ne_of_gt.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {t : ℝ} (h : t ≥ 1) : t ≠ 0 := ne_of_gt (by linarith)
