-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Type.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {α : Type*} {P : α → Prop} (h : ∀ x : α, P x) (a : α) : P a := by
  exact h a
