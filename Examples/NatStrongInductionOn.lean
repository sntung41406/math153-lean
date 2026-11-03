-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Nat.strong_induction_on.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (n : ℕ) : 2 ∣ n ∨ 2 ∣ n + 1 := by
  induction n using Nat.strong_induction_on with
  | _ n IH =>
    by_cases h : n < 2
    · omega
    · have := IH (n - 2) (by omega)
      omega
