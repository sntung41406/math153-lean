-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/05-logic/Lean/Module 5 - Negation algorithm example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ¬ (∀ x : ℝ, x ^ 2 ≥ x) := by
  push Not
  use (1 / 2 : ℝ)
  norm_num

example : ¬ ∃ c : ℝ, ∀ b : ℝ, b < c := by
  push Not
  intro c
  use c

example {a : ℝ} (h : ¬ ∃ x : ℝ, a < x ∧ x < a + 1) : False := by
  push Not at h
  have h' : a + 1 ≤ a + 1 / 2 := h (a + 1 / 2) (by linarith)
  linarith
