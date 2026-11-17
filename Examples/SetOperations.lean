-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/set-operations.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {α : Type*} (A B : Set α) : A ∩ B ⊆ A ∪ B := by
  intro x hx
  rw [Set.mem_inter_iff] at hx
  rw [Set.mem_union]
  left
  exact hx.1
