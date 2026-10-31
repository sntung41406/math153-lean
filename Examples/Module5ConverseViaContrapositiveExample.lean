-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/05-logic/Lean/Module 5 - Converse via contrapositive example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {n : ℤ} (h : Even (n ^ 2)) : Even n := by
  contrapose! h
  rw [Int.not_even_iff_odd] at h ⊢
  obtain ⟨k, hk⟩ := h
  use 2 * k ^ 2 + 2 * k
  rw [hk]
  ring
