-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Nat.pow_le_pow_left.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (n : ℕ) (h : n ≤ 1) : n ^ 2 ≤ 1 ^ 2 := Nat.pow_le_pow_left h 2
