-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/ext.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : (fun x : ℝ ↦ x + x) = (fun x ↦ 2 * x) := by
  ext x
  ring
