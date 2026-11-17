-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Power set example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ({0} : Set ℕ) ∈ 𝒫 ({0, 1} : Set ℕ) := by
  rw [Set.mem_powerset_iff]
  intro x hx
  simp only [Set.mem_singleton_iff] at hx
  simp [hx]
