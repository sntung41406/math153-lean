-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/06-induction/Lean/Module 6 - Square root of two by descent.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

theorem even_of_even_sq {a : ℤ} (h : Even (a ^ 2)) : Even a := by
  obtain ha | ha := Int.even_or_odd a
  · exact ha
  · obtain ⟨k, hk⟩ := ha
    obtain ⟨m, hm⟩ := h
    have h1 : a ^ 2 = 2 * (2 * k ^ 2 + 2 * k) + 1 := by
      rw [hk]
      ring
    omega

theorem no_pair (n : ℕ) : ∀ a b : ℤ, b.natAbs = n → b ≠ 0 → a ^ 2 ≠ 2 * b ^ 2 := by
  induction n using Nat.strong_induction_on with
  | _ n IH =>
    intro a b hbn hb h2
    have ha : Even a := by
      apply even_of_even_sq
      use b ^ 2
      rw [h2]
      ring
    obtain ⟨c, hc⟩ := ha
    have hbeven : Even b := by
      apply even_of_even_sq
      use c ^ 2
      rw [hc] at h2
      linarith
    obtain ⟨d, hd⟩ := hbeven
    have hcd : c ^ 2 = 2 * d ^ 2 := by
      rw [hc, hd] at h2
      linarith
    have hd0 : d ≠ 0 := by omega
    have hlt : d.natAbs < n := by omega
    exact IH d.natAbs hlt c d rfl hd0 hcd

example : Irrational (√2) := by
  rintro ⟨q, hq⟩
  have hq2 : (q : ℝ) ^ 2 = 2 := by
    rw [hq]
    exact Real.sq_sqrt (by norm_num)
  have hq3 : q ^ 2 = 2 := by exact_mod_cast hq2
  have hmul : q * q.den = q.num := Rat.mul_den_eq_num q
  have hkey : (q.num : ℚ) ^ 2 = 2 * (q.den : ℚ) ^ 2 := by
    rw [← hmul, mul_pow, hq3]
  have hint : q.num ^ 2 = 2 * (q.den : ℤ) ^ 2 := by exact_mod_cast hkey
  have hden : (q.den : ℤ) ≠ 0 := by exact_mod_cast q.den_nz
  exact no_pair _ q.num q.den rfl hden hint
