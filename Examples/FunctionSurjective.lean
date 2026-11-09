-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Function.Surjective.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

example : Surjective (fun x : ℝ ↦ x + 3) := by
  intro y
  use y - 3
  dsimp only
  ring
