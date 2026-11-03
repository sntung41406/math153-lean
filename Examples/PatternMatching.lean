-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/pattern-matching.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

def f : ℕ → ℕ
  | 0 => 1
  | n + 1 => 2 * f n

theorem f_pos : ∀ n, 0 < f n
  | 0 => by
      rw [f]
      norm_num
  | n + 1 => by
      have IH := f_pos n
      rw [f]
      omega
