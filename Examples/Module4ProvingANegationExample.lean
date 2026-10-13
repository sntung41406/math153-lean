-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/04-proofs-with-structure-ii/Lean/Module 4 - Proving a negation example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x y : ℝ} (hsum : x + y = 0) : ¬(x > 0 ∧ y > 0) := by
  intro h
  obtain ⟨hx, hy⟩ := h
  have H : (0:ℝ) > 0 := by
    calc (0:ℝ) = x + y := by rw [hsum]
    _ > 0 := by linarith
  linarith
