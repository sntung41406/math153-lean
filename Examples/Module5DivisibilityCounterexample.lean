-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/05-logic/Lean/Module 5 - Divisibility counterexample.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ¬ (∀ a b c : ℕ, a ∣ b * c → a ∣ b ∨ a ∣ c) := by
  push Not
  use 4, 2, 2
  decide
