-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/le_antisymm.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℝ} (h1 : x ≤ 3) (h2 : 3 ≤ x) : x = 3 := le_antisymm h1 h2
