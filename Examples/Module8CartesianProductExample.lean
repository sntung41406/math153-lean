-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Cartesian product example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ((3 : ℕ), (-2 : ℤ)) ∈ {n : ℕ | Odd n} ×ˢ {z : ℤ | z < 0} := by
  rw [Set.mem_prod]
  constructor
  · show Odd 3
    use 1
    norm_num
  · show (-2 : ℤ) < 0
    norm_num
