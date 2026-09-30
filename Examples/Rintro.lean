-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/rintro.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ¬ (2 : ℤ) ∣ 7 := by
  rintro ⟨k, hk⟩
  have h1 : 3 < k := by linarith
  have h2 : k < 4 := by linarith
  omega
