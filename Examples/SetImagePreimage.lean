-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Set.image-preimage.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : (3 : ℝ) ∈ (fun x : ℝ ↦ x + 1) '' {2} := by
  use 2
  norm_num

example : (2 : ℝ) ∈ (fun x : ℝ ↦ x + 1) ⁻¹' {3} := by
  show (2 : ℝ) + 1 = 3
  norm_num
