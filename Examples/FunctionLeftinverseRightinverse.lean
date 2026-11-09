-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Function.LeftInverse-RightInverse.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

example : LeftInverse (fun y : ℤ ↦ y - 1) (fun x ↦ x + 1) := by
  intro x
  dsimp only
  ring

example : RightInverse (fun y : ℤ ↦ y - 1) (fun x ↦ x + 1) := by
  intro y
  dsimp only
  ring
