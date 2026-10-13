-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/04-proofs-with-structure-ii/Lean/Module 4 - Nested quantifiers example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ∃ a : ℝ, ∀ b : ℝ, ∃ c : ℝ, a + b < c := by
  use 0
  intro b
  use b + 1
  linarith

example : ∀ b : ℝ, ∃ c : ℝ, b < c := by
  intro b
  use b + 1
  linarith

example : ¬ ∃ c : ℝ, ∀ b : ℝ, b < c := by
  intro h
  obtain ⟨c, hc⟩ := h
  have h1 : c < c := hc c
  linarith
