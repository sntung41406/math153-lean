-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/06-induction/Lean/Module 6 - Strong induction example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

theorem exists_prime_factor (n : ℕ) : 2 ≤ n → ∃ p, p.Prime ∧ p ∣ n := by
  induction n using Nat.strong_induction_on with
  | _ n IH =>
    intro hn
    by_cases hp : n.Prime
    · exact ⟨n, hp, dvd_refl n⟩
    · obtain ⟨m, hmdvd, hm2, hmn⟩ := Nat.exists_dvd_of_not_prime2 hn hp
      obtain ⟨p, hp_prime, hp_dvd⟩ := IH m hmn hm2
      exact ⟨p, hp_prime, dvd_trans hp_dvd hmdvd⟩

theorem exists_prime_factor' : ∀ n, 2 ≤ n → ∃ p, p.Prime ∧ p ∣ n
  | n, hn => by
      by_cases hp : n.Prime
      · exact ⟨n, hp, dvd_refl n⟩
      · obtain ⟨m, hmdvd, hm2, hmn⟩ := Nat.exists_dvd_of_not_prime2 hn hp
        obtain ⟨p, hp_prime, hp_dvd⟩ := exists_prime_factor' m hm2
        exact ⟨p, hp_prime, dvd_trans hp_dvd hmdvd⟩
