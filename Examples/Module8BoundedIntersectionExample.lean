-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Bounded intersection example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : {n : ℕ | 4 ≤ n} ∩ {n : ℕ | n ≤ 6} = {4, 5, 6} := by
  ext n
  simp only [Set.mem_inter_iff, Set.mem_ofPred_eq, Set.mem_insert_iff,
    Set.mem_singleton_iff]
  omega
