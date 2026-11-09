-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/07-functions/Lean/Module 7 - Functions into a product example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

def q (m : ℤ) : ℤ × ℤ := (m + 1, 2 - m)

example : Injective q := by
  intro m n h
  have h1 : (q m).1 = (q n).1 := congrArg Prod.fst h
  dsimp only [q] at h1
  linarith

example : ¬ Surjective q := by
  intro h
  obtain ⟨m, hm⟩ := h (0, 1)
  have h1 : (q m).1 = 0 := congrArg Prod.fst hm
  have h2 : (q m).2 = 1 := congrArg Prod.snd hm
  dsimp only [q] at h1 h2
  omega
