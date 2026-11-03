-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Nat.exists_dvd_of_not_prime2.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ∃ m, m ∣ 6 ∧ 2 ≤ m ∧ m < 6 :=
  Nat.exists_dvd_of_not_prime2 (by norm_num) (by norm_num)
