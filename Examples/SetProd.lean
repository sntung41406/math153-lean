-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Set.prod.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ((1 : ℕ), (5 : ℝ)) ∈ {n : ℕ | n < 2} ×ˢ {x : ℝ | 4 < x} := by
  rw [Set.mem_prod]
  constructor
  · show 1 < 2
    norm_num
  · show (4 : ℝ) < 5
    norm_num
