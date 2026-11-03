-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Irrational.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℝ} (h : Irrational x) (q : ℚ) : (q : ℝ) ≠ x := by
  intro hq
  exact h ⟨q, hq⟩
