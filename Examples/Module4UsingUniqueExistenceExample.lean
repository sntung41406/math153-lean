-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/04-proofs-with-structure-ii/Lean/Module 4 - Using unique existence example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℚ} (hx : ∃! a : ℚ, a ^ 2 = x) : x = 0 := by
  obtain ⟨a, ha1, ha2⟩ := hx
  dsimp at ha2
  have h1 : -a = a := by
    apply ha2
    calc
      (-a) ^ 2 = a ^ 2 := by ring
      _ = x := ha1
  have h2 : a = 0 := by linarith
  calc
    x = a ^ 2 := by rw [ha1]
    _ = 0 ^ 2 := by rw [h2]
    _ = 0 := by norm_num
