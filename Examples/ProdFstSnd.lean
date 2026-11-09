-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Prod.fst-snd.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ((3, 5) : ℤ × ℤ).1 = 3 := rfl

example (a b : ℤ) (h : (a, b) = (2, 7)) : a = 2 := by
  have h1 := congrArg Prod.fst h
  dsimp only at h1
  exact h1
