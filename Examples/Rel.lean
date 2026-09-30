-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/rel.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℤ} (hx : x ≡ 1 [ZMOD 4]) : x ^ 2 + x ≡ 2 [ZMOD 4] :=
  calc
    x ^ 2 + x ≡ 1 ^ 2 + 1 [ZMOD 4] := by rel [hx]
    _ = 2                          := by norm_num
