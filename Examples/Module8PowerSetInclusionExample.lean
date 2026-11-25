-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Power set inclusion example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {α : Type*} (A B : Set α) : 𝒫 A ∪ 𝒫 B ⊆ 𝒫 (A ∪ B) := by
  intro S hS
  rw [Set.mem_powerset_iff]
  intro x hx
  obtain hA | hB := hS
  · rw [Set.mem_powerset_iff] at hA
    left
    exact hA hx
  · rw [Set.mem_powerset_iff] at hB
    right
    exact hB hx

example : ¬ 𝒫 ({0} ∪ {1} : Set ℕ) ⊆ 𝒫 {0} ∪ 𝒫 {1} := by
  intro h
  have h01 : ({0} ∪ {1} : Set ℕ) ∈ 𝒫 ({0} ∪ {1} : Set ℕ) := by
    rw [Set.mem_powerset_iff]
  obtain h0 | h1 := h h01
  · rw [Set.mem_powerset_iff] at h0
    have h10 : (1 : ℕ) ∈ ({0} : Set ℕ) := h0 (by simp)
    norm_num at h10
  · rw [Set.mem_powerset_iff] at h1
    have h01' : (0 : ℕ) ∈ ({1} : Set ℕ) := h1 (by simp)
    norm_num at h01'
