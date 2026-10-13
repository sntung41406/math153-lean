-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/04-proofs-with-structure-ii/Lean/Module 4 - Using an iff example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

theorem three_mul_add_one_le_seven_iff {a : ℚ} : 3 * a + 1 ≤ 7 ↔ a ≤ 2 := by
  constructor
  · intro h
    linarith
  · intro h
    linarith

example {a : ℚ} (h : 3 * a + 1 ≤ 7) : a ≤ 2 := by
  exact three_mul_add_one_le_seven_iff.mp h

example {a : ℚ} (h : a ≤ 2) : 3 * a + 1 ≤ 7 := by
  exact three_mul_add_one_le_seven_iff.mpr h

example {a : ℚ} (h : a ≤ 2) : 3 * a + 1 ≤ 7 := by
  rw [three_mul_add_one_le_seven_iff]
  exact h

example {a : ℚ} (h : 3 * a + 1 ≤ 7) : a ≤ 2 := by
  rw [three_mul_add_one_le_seven_iff] at h
  exact h
