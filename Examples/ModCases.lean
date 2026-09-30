-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/mod_cases.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (x : ℤ) : x ^ 2 ≡ 0 [ZMOD 3] ∨ x ^ 2 ≡ 1 [ZMOD 3] := by
  mod_cases hx : x % 3
  · left
    calc
      x ^ 2 ≡ 0 ^ 2 [ZMOD 3] := by rel [hx]
      _ = 0                  := by norm_num
  · right
    calc
      x ^ 2 ≡ 1 ^ 2 [ZMOD 3] := by rel [hx]
      _ = 1                  := by norm_num
  · right
    calc
      x ^ 2 ≡ 2 ^ 2 [ZMOD 3] := by rel [hx]
      _ = 1 + 3 * 1          := by norm_num
      _ ≡ 1 [ZMOD 3]         := by decide
