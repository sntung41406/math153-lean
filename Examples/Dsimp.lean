-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/dsimp.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ∃! x : ℝ, x + 1 = 3 := by
  use 2
  dsimp
  constructor
  · norm_num
  · intro y hy
    linarith
