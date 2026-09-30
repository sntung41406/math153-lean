-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Int.ModEq.add.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {a b c d : ℤ} (h1 : a ≡ b [ZMOD 7]) (h2 : c ≡ d [ZMOD 7]) :
    a + c ≡ b + d [ZMOD 7] :=
  Int.ModEq.add h1 h2
