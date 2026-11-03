-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Nat.le_induction.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {n : ℕ} (hn : 3 ≤ n) : 2 * n ≥ 6 := by
  induction n, hn using Nat.le_induction with
  | base => norm_num
  | succ k hk IH => omega
