-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/07-functions/Lean/Module 7 - Composition example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

def f (a : ℝ) : ℝ := a + 3
def g (b : ℝ) : ℝ := 2 * b
def h (c : ℝ) : ℝ := 2 * c + 6

example : g ∘ f = h := by
  ext x
  show g (f x) = h x
  dsimp only [f, g, h]
  ring

example : f ∘ g ≠ h := by
  intro H
  have H0 : f (g 0) = h 0 := congrFun H 0
  dsimp only [f, g, h] at H0
  norm_num at H0
