-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/03-parity-divisibility-number-theory/Lean/Module 3 - Divisibility bound example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {a b : ℕ} (hb : 0 < b) (hab : a ∣ b) : a ≤ b := by
  obtain ⟨k, hk⟩ := hab
  have H1 : 0 < a * k := by rw [← hk]; exact hb
  have hk0 : k ≠ 0 := by rintro rfl; simp at H1
  have H : 1 ≤ k := Nat.one_le_iff_ne_zero.mpr hk0
  calc
    a = a * 1 := by ring
    _ ≤ a * k := by gcongr
    _ = b     := by rw [hk]
