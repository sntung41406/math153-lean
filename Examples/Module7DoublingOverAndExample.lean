-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/07-functions/Lean/Module 7 - Doubling over ℝ and ℤ example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

example : Surjective (fun x : ℝ ↦ 2 * x) := by
  intro y
  use y / 2
  dsimp only
  ring

example : ¬ Surjective (fun x : ℤ ↦ 2 * x) := by
  intro h
  obtain ⟨x, hx⟩ := h 1
  dsimp only at hx
  omega
