-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/linarith.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (x y : ℤ) (h1 : x ≤ 2) (h2 : y ≤ 3) : x + y ≤ 5 := by linarith
