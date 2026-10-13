-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/interval_cases.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {n : ℕ} (h1 : 1 ≤ n) (h2 : n ≤ 3) : n ^ 2 ≤ 9 := by
  interval_cases n
  · norm_num
  · norm_num
  · norm_num
