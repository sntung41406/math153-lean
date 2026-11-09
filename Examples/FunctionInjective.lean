-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Function.Injective.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

example : Injective (fun x : ℝ ↦ x + 3) := by
  intro x1 x2 h
  dsimp only at h
  linarith
