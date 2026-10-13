-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/04-proofs-with-structure-ii/Lean/Module 4 - Ruling out a case example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {y : ℝ} (x : ℝ) (h : 0 < x * y) (hx : 0 ≤ x) : 0 < y := by
  obtain hpos | hneg := lt_or_ge 0 y
  · exact hpos
  · have H : x * y ≤ 0 := by
      calc
        x * y ≤ x * 0 := by gcongr
        _ = 0 := by ring
    linarith

example {y : ℝ} (x : ℝ) (h : 0 < x * y) (hx : 0 ≤ x) : 0 < y := by
  by_contra hy
  have hy' : y ≤ 0 := not_lt.mp hy
  have H : x * y ≤ 0 := by
    calc
      x * y ≤ x * 0 := by gcongr
      _ = 0 := by ring
  linarith
