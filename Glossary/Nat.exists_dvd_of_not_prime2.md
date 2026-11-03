# `Nat.exists_dvd_of_not_prime2`

**Meaning.** The lemma `Nat.exists_dvd_of_not_prime2 : 2 ≤ n → ¬ n.Prime → ∃ m, m ∣ n ∧ 2 ≤ m ∧ m < n` — a number at least `2` that is not prime has a proper divisor.

**Example.**
```lean
import Mathlib

example : ∃ m, m ∣ 6 ∧ 2 ≤ m ∧ m < 6 :=
  Nat.exists_dvd_of_not_prime2 (by norm_num) (by norm_num)
```

**Use it when** you are in the "not prime" case of a proof and need a smaller divisor, for example to apply a strong inductive hypothesis.

**Reference.** [Mathlib documentation — `Nat.exists_dvd_of_not_prime2`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Nat/Prime/Basic.html#Nat.exists_dvd_of_not_prime2)
