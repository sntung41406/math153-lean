-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/07-functions/Lean/Module 7 - Bijectivity and inverses example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

example {X Y : Type*} {f : X → Y} {g : Y → X}
    (hL : LeftInverse g f) (hR : RightInverse g f) : Bijective f := by
  constructor
  · intro x1 x2 h
    calc x1 = g (f x1) := by rw [hL x1]
      _ = g (f x2) := by rw [h]
      _ = x2 := hL x2
  · intro y
    use g y
    exact hR y

example {X Y : Type*} {f : X → Y} (hf : Bijective f) :
    ∃ g : Y → X, LeftInverse g f ∧ RightInverse g f := by
  obtain ⟨hinj, hsurj⟩ := hf
  choose g hg using hsurj
  use g
  constructor
  · intro x
    exact hinj (hg (f x))
  · exact hg
