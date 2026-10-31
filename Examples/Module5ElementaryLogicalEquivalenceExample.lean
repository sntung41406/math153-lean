-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/05-logic/Lean/Module 5 - Elementary logical equivalence example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (P : Prop) : (P ∨ P) ↔ P := by
  constructor
  · intro h
    obtain h1 | h2 := h
    · exact h1
    · exact h2
  · intro h
    left
    exact h
