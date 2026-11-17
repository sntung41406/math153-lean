-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/let.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ∃ s : Set ℕ, 3 ∈ s := by
  let s : Set ℕ := {n | n < 5}
  use s
  show 3 < 5
  norm_num
