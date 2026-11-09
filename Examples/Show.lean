-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/show.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : (fun y : ℝ ↦ 2 * y) ∘ (fun y ↦ y + 1) = fun y ↦ 2 * y + 2 := by
  ext x
  show 2 * (x + 1) = 2 * x + 2
  ring
