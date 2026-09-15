-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/01-proofs-by-calculation/Lean/Module 1 - linarith shortcut.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {a b : ℤ} (ha : a - 2 * b = 1) : a = 2 * b + 1 := by
  linarith

example {m n : ℝ} (h1 : m ≤ 8 - n) : 10 > m + n := by
  linarith

example {w : ℚ} (h1 : 3 * w + 1 = 4) : w = 1 := by
  linarith

-- linarith can't verify this one — it's genuinely nonlinear (x * x and y * y are
-- opaque atoms to linarith, even though x = y makes them obviously equal)
example {x y : ℝ} (h : x = y) : x * x = y * y := by
  rw [h]
