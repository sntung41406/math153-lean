-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/05-logic/Lean/Module 5 - Conjunction disjunction distributivity example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (P Q R : Prop) : (P ∧ (Q ∨ R)) ↔ ((P ∧ Q) ∨ (P ∧ R)) := by
  constructor
  · intro h
    obtain ⟨hP, hQ | hR⟩ := h
    · left
      constructor
      · exact hP
      · exact hQ
    · right
      constructor
      · exact hP
      · exact hR
  · intro h
    obtain ⟨hP, hQ⟩ | ⟨hP, hR⟩ := h
    · constructor
      · exact hP
      · left
        exact hQ
    · constructor
      · exact hP
      · right
        exact hR
