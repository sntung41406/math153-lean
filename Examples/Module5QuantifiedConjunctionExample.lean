-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/05-logic/Lean/Module 5 - Quantified conjunction example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {α : Type*} {P Q : α → Prop} (h1 : ∀ x : α, P x) (h2 : ∀ x : α, Q x) :
    ∀ x : α, P x ∧ Q x := by
  intro x
  constructor
  · exact h1 x
  · exact h2 x

example : ∀ x : ℝ, x ^ 2 ≥ 0 ∧ x ^ 2 + 1 > 0 := by
  intro x
  constructor
  · positivity
  · positivity
