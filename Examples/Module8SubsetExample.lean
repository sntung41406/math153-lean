-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Subset example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : {a : ℕ | 4 ∣ a} ⊆ {b : ℕ | 2 ∣ b} := by
  intro a ha
  obtain ⟨k, hk⟩ := ha
  use 2 * k
  rw [hk]
  ring

example : ¬ {b : ℕ | 2 ∣ b} ⊆ {a : ℕ | 4 ∣ a} := by
  intro h
  have h6 : 6 ∈ {a : ℕ | 4 ∣ a} := h (by norm_num)
  norm_num at h6
