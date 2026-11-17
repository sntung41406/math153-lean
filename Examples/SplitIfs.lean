-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/split_ifs.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (n : ℕ) : (if n % 2 = 0 then n else n + 1) % 2 = 0 := by
  split_ifs <;> omega
