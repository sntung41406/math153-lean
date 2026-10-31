-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/by_cases.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (P Q : Prop) (h1 : P → Q) (h2 : ¬ P → Q) : Q := by
  by_cases hP : P
  · exact h1 hP
  · exact h2 hP
