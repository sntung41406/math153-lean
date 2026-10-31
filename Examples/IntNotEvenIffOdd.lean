-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Int.not_even_iff_odd.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {n : ℤ} (h : ¬ Even n) : Odd n := by
  rw [Int.not_even_iff_odd] at h
  exact h
