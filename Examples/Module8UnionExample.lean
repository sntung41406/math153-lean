-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Union example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : {x : ℝ | -1 < x} ∪ {x : ℝ | x < 1} = Set.univ := by
  ext t
  constructor
  · intro _
    exact Set.mem_univ t
  · intro _
    simp only [Set.mem_union, Set.mem_ofPred_eq]
    obtain h | h := lt_or_ge t 0
    · right
      linarith
    · left
      linarith
