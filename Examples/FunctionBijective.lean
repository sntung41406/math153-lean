-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Function.Bijective.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

example : Bijective (fun x : ℝ ↦ x + 3) := by
  constructor
  · intro x1 x2 h
    dsimp only at h
    linarith
  · intro y
    use y - 3
    dsimp only
    ring
