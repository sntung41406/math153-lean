-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/induction.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (n : ℕ) : 2 ^ n ≥ 1 := by
  induction n with
  | zero => norm_num
  | succ k IH =>
    calc 2 ^ (k + 1) = 2 * 2 ^ k := by ring
      _ ≥ 2 * 1 := by gcongr
      _ ≥ 1 := by norm_num
