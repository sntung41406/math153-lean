-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Prop.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

#check (2 + 2 = 4 : Prop)

example (P Q : Prop) (hP : P) (hQ : Q) : P ∧ Q := by
  constructor
  · exact hP
  · exact hQ
