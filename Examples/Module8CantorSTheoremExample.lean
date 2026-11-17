-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Cantor's theorem example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

theorem no_surjection_to_powerset {X : Type*} :
    ¬ ∃ f : X → Set X, Surjective f := by
  intro h
  obtain ⟨f, hf⟩ := h
  let s : Set X := {x | x ∉ f x}
  obtain ⟨x, hx⟩ := hf s
  by_cases hxs : x ∈ s
  · have hfx : x ∉ f x := hxs
    rw [hx] at hfx
    contradiction
  · have hfx : ¬ x ∉ f x := hxs
    rw [hx] at hfx
    contradiction

example {X : Type*} : ¬ ∃ f : X → Set X, Bijective f := by
  intro h
  obtain ⟨f, hf⟩ := h
  exact no_surjection_to_powerset ⟨f, hf.2⟩

example {X : Type*} : Injective (fun x : X ↦ ({x} : Set X)) := by
  intro x1 x2 h
  dsimp only at h
  have hx : x1 ∈ ({x2} : Set X) := by
    rw [← h]
    exact Set.mem_singleton x1
  rw [Set.mem_singleton_iff] at hx
  exact hx
