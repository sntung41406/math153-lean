-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/05-logic/Lean/Module 5 - Negation rules by hand example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {α : Type*} (P : α → Prop) : ¬ (∃ x, P x) ↔ ∀ x, ¬ P x := by
  constructor
  · intro h x hx
    have hex : ∃ x, P x := ⟨x, hx⟩
    contradiction
  · intro h hex
    obtain ⟨x, hx⟩ := hex
    have hnx : ¬ P x := h x
    contradiction

example (P Q : Prop) : ¬ (P ∨ Q) ↔ (¬ P ∧ ¬ Q) := by
  constructor
  · intro h
    constructor
    · intro hP
      have hPQ : P ∨ Q := by
        left
        exact hP
      contradiction
    · intro hQ
      have hPQ : P ∨ Q := by
        right
        exact hQ
      contradiction
  · intro h hPQ
    obtain ⟨hnP, hnQ⟩ := h
    obtain hP | hQ := hPQ
    · contradiction
    · contradiction

example (P Q : Prop) : ¬ (P ∧ Q) ↔ (¬ P ∨ ¬ Q) := by
  constructor
  · intro h
    by_cases hP : P
    · right
      intro hQ
      have hPQ : P ∧ Q := by
        constructor
        · exact hP
        · exact hQ
      contradiction
    · left
      exact hP
  · intro h hPQ
    obtain ⟨hP, hQ⟩ := hPQ
    obtain hnP | hnQ := h
    · contradiction
    · contradiction

example (P Q : Prop) : ¬ (P → Q) ↔ (P ∧ ¬ Q) := by
  constructor
  · intro h
    by_cases hP : P
    · constructor
      · exact hP
      · intro hQ
        have hPQ : P → Q := by
          intro _
          exact hQ
        contradiction
    · have hPQ : P → Q := by
        intro hP'
        contradiction
      contradiction
  · intro h hPQ
    obtain ⟨hP, hnQ⟩ := h
    have hQ : Q := hPQ hP
    contradiction
