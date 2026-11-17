-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Complement example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : {n : ℤ | Even n}ᶜ = {n : ℤ | Odd n} := by
  ext n
  simp only [Set.mem_compl_iff, Set.mem_ofPred_eq, Int.not_even_iff_odd]
