-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/04-proofs-with-structure-ii/Lean/Module 4 - Coprime core of the sqrt 2 argument.md by scripts/extract_lean_examples.py.
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

example : ¬ ∃ a b : ℤ, IsCoprime a b ∧ a ^ 2 = 2 * b ^ 2 := by
  intro h
  obtain ⟨a, b, hab, h2⟩ := h
  have ha : Even a := by
    apply even_of_even_sq
    use b ^ 2
    rw [h2]
    ring
  obtain ⟨c, hc⟩ := ha
  have hb : Even b := by
    apply even_of_even_sq
    use c ^ 2
    rw [hc] at h2
    linarith
  obtain ⟨d, hd⟩ := hb
  obtain ⟨u, v, huv⟩ := hab
  have h3 : 2 * (u * c + v * d) = 1 := by
    rw [← huv, hc, hd]
    ring
  omega
