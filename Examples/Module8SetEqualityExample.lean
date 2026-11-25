-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/08-sets/Lean/Module 8 - Set equality example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : {x : ℤ | Odd x} = {a : ℤ | ∃ k, a = 2 * k - 1} := by
  ext x
  constructor
  · rintro ⟨l, hl⟩
    exact ⟨l + 1, by rw [hl]; ring⟩
  · rintro ⟨k, hk⟩
    exact ⟨k - 1, by rw [hk]; ring⟩
