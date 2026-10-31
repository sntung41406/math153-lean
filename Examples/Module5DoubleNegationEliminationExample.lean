-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/05-logic/Lean/Module 5 - Double negation elimination example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {P : Prop} (h : ¬¬P) : P := by
  by_cases hP : P
  · exact hP
  · contradiction
