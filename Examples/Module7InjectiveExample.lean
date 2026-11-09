-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/07-functions/Lean/Module 7 - Injective example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

def q (x : ℝ) : ℝ := x + 3

example : Injective q := by
  intro x1 x2 h
  dsimp only [q] at h
  linarith
