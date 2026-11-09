-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/choose.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (h : ∀ n : ℕ, ∃ m : ℕ, n < m) : ∃ s : ℕ → ℕ, ∀ n, n < s n := by
  choose s hs using h
  use s
