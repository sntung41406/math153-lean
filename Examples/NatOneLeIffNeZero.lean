-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Nat.one_le_iff_ne_zero.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {k : ℕ} (hk : k ≠ 0) : 1 ≤ k := Nat.one_le_iff_ne_zero.mpr hk
