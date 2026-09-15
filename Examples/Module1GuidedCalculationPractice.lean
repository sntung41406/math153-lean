-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/01-proofs-by-calculation/Lean/Module 1 - Guided calculation practice.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {r s : ℤ} (h1 : r + 2 * s = -1) (h2 : s = 3) : r = -7 := by
  calc
    r = (r + 2 * s) - 2 * s := by ring
    _ = -1 - 2 * s          := by rw [h1]
    _ = -1 - 2 * 3          := by rw [h2]
    _ = -7                  := by norm_num
