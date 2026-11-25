-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Set.powerset.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : (∅ : Set ℕ) ∈ 𝒫 ({0, 1} : Set ℕ) := by
  rw [Set.mem_powerset_iff]
  intro x hx
  contradiction
