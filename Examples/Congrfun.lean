-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/congrFun.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (u v : ℝ → ℝ) (h : u = v) : u 0 = v 0 := congrFun h 0
