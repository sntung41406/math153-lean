-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Preimage laws example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {α β : Type*} (f : α → β) (S T : Set β) :
    f ⁻¹' (S ∪ T) = f ⁻¹' S ∪ f ⁻¹' T := by
  ext x
  simp only [Set.mem_preimage, Set.mem_union]

example {α β : Type*} (f : α → β) (S T : Set β) :
    f ⁻¹' (S ∩ T) = f ⁻¹' S ∩ f ⁻¹' T := by
  ext x
  simp only [Set.mem_preimage, Set.mem_inter_iff]
