-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/07-functions/Lean/Module 7 - Surjective example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

def s (a : ℚ) : ℚ := 3 * a + 2

example : Surjective s := by
  intro y
  use (y - 2) / 3
  dsimp only [s]
  ring
