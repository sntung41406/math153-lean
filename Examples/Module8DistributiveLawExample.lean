-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Distributive law example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {α : Type*} (A B C : Set α) : A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  ext x
  simp only [Set.mem_inter_iff, Set.mem_union]
  constructor
  · rintro ⟨hA, hB | hC⟩
    · left
      exact ⟨hA, hB⟩
    · right
      exact ⟨hA, hC⟩
  · rintro (⟨hA, hB⟩ | ⟨hA, hC⟩)
    · constructor
      · exact hA
      · left
        exact hB
    · constructor
      · exact hA
      · right
        exact hC
