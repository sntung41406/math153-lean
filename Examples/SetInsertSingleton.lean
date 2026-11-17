-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Set.insert-singleton.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (n : ℕ) (h : n ∈ ({2, 3} : Set ℕ)) : n ≤ 3 := by
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at h
  omega
