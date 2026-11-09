-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/07-functions/Lean/Module 7 - Bijective example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

def p (x : ℝ) : ℝ := 2 * x - 5

example : Bijective p := by
  constructor
  · intro x1 x2 hx
    dsimp only [p] at hx
    linarith
  · intro y
    use (y + 5) / 2
    dsimp only [p]
    ring

example : ∀ y, ∃! x, p x = y := by
  intro y
  use (y + 5) / 2
  dsimp
  constructor
  · dsimp only [p]
    ring
  · intro x hx
    dsimp only [p] at hx
    linarith
