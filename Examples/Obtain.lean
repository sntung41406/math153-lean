-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/obtain.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x y : ℤ} (h : x = 1 ∧ y = 2) : x + y = 3 := by
  obtain ⟨hx, hy⟩ := h
  rw [hx, hy]
  norm_num

example {x : ℝ} (h : x = 1 ∨ x = -1) : x ^ 2 = 1 := by
  obtain hx | hx := h
  · rw [hx]
    norm_num
  · rw [hx]
    norm_num
