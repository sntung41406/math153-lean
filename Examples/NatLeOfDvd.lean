-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Nat.le_of_dvd.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {m : ℕ} (h : m ∣ 6) : m ≤ 6 := Nat.le_of_dvd (by norm_num) h
