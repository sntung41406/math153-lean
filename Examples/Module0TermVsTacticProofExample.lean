-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/00-preface/Lean/Module 0 - term vs tactic proof example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

-- Term-style proof: a direct proof term
theorem add_two_two_term : 2 + 2 = 4 := rfl

#check add_two_two_term

-- Tactic-style proof: interactive steps inside `by`
theorem add_two_two_tactic : 2 + 2 = 4 := by
  rfl
