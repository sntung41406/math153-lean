-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Set.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : (2 : ℕ) ∈ {n : ℕ | n < 5} := by
  show 2 < 5
  norm_num

example : {n : ℕ | n < 3} ⊆ {n : ℕ | n < 5} := by
  intro n hn
  rw [Set.mem_ofPred_eq] at hn ⊢
  omega
