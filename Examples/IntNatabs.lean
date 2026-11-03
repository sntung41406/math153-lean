-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Int.natAbs.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example : (-5 : ℤ).natAbs = 5 := rfl

example {b d : ℤ} (hb : b ≠ 0) (hd : b = d + d) : d.natAbs < b.natAbs := by
  omega
