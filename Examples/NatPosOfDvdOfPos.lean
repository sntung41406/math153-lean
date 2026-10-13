-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Nat.pos_of_dvd_of_pos.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {m : ℕ} (h : m ∣ 6) : 0 < m := Nat.pos_of_dvd_of_pos h (by norm_num)
