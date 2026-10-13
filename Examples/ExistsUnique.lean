-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/exists-unique.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ∃! x : ℝ, 2 * x = 6 := by
  use 3
  dsimp
  constructor
  · norm_num
  · intro y hy
    linarith
