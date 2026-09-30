-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/03-parity-divisibility-number-theory/Lean/Module 3 - Non-divisibility example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : ¬ (5 : ℤ) ∣ 12 := by
  rintro ⟨k, hk⟩
  have h1 : 2 < k := by linarith
  have h2 : k < 3 := by linarith
  omega
