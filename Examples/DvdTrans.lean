-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/dvd_trans.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {a b c : ℕ} (h1 : a ∣ b) (h2 : b ∣ c) : a ∣ c := dvd_trans h1 h2
