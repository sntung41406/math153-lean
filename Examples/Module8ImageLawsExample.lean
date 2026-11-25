-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Image laws example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {α β : Type*} (f : α → β) (S T : Set α) :
    f '' (S ∪ T) = f '' S ∪ f '' T := by
  ext y
  constructor
  · rintro ⟨x, hx | hx, rfl⟩
    · left
      exact ⟨x, hx, rfl⟩
    · right
      exact ⟨x, hx, rfl⟩
  · rintro (⟨x, hx, rfl⟩ | ⟨x, hx, rfl⟩)
    · use x
      constructor
      · left
        exact hx
      · rfl
    · use x
      constructor
      · right
        exact hx
      · rfl

example {α β : Type*} (f : α → β) (S T : Set α) :
    f '' (S ∩ T) ⊆ f '' S ∩ f '' T := by
  rintro y ⟨x, ⟨hS, hT⟩, rfl⟩
  exact ⟨⟨x, hS, rfl⟩, ⟨x, hT, rfl⟩⟩

example : ¬ (fun x : ℝ ↦ x ^ 2) '' {-1} ∩ (fun x : ℝ ↦ x ^ 2) '' {1} ⊆
    (fun x : ℝ ↦ x ^ 2) '' ({-1} ∩ {1}) := by
  intro h
  have h1 : (1 : ℝ) ∈ (fun x : ℝ ↦ x ^ 2) '' {-1} ∩ (fun x : ℝ ↦ x ^ 2) '' {1} := by
    constructor
    · use -1
      norm_num
    · use 1
      norm_num
  obtain ⟨x, ⟨hx1, hx2⟩, -⟩ := h h1
  rw [Set.mem_singleton_iff] at hx1 hx2
  rw [hx1] at hx2
  norm_num at hx2
