-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/04-proofs-with-structure-ii/Lean/Module 4 - Refuting a universal statement example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ¬ (∀ x : ℝ, x ^ 2 ≥ x) := by
  intro h
  have h1 : ((1 : ℝ) / 2) ^ 2 ≥ 1 / 2 := h (1 / 2)
  norm_num at h1
