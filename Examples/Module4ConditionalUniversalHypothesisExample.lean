-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/04-proofs-with-structure-ii/Lean/Module 4 - Conditional universal hypothesis example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {a b : ℝ} (ha1 : a ^ 2 ≤ 2) (hb1 : b ^ 2 ≤ 2)
    (ha2 : ∀ y, y ^ 2 ≤ 2 → y ≤ a) (hb2 : ∀ y, y ^ 2 ≤ 2 → y ≤ b) :
    a = b := by
  apply le_antisymm
  · apply hb2
    exact ha1
  · apply ha2
    exact hb1

example {a b : ℝ} (ha1 : a ^ 2 ≤ 2) (hb1 : b ^ 2 ≤ 2)
    (ha2 : ∀ y, y ^ 2 ≤ 2 → y ≤ a) (hb2 : ∀ y, y ^ 2 ≤ 2 → y ≤ b) :
    a = b := by
  have h1 : a ≤ b := hb2 a ha1
  have h2 : b ≤ a := ha2 b hb1
  exact le_antisymm h1 h2
