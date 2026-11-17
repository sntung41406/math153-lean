-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Nat.odd_iff.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ¬ Odd (10 : ℕ) := by
  rw [Nat.odd_iff]
  norm_num
