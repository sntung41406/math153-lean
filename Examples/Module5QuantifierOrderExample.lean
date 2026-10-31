-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/05-logic/Lean/Module 5 - Quantifier order example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {α β : Type*} {P : α → β → Prop} (h : ∃ x : α, ∀ y : β, P x y) :
    ∀ y : β, ∃ x : α, P x y := by
  obtain ⟨x, hx⟩ := h
  intro y
  exact ⟨x, hx y⟩
