# Module 6 - Strong induction example

## Statement

Prove that every natural number $n \ge 2$ has a prime factor.

## Explicit strong induction

### Code

```lean
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
```

### Walkthrough

- `induction n using` [`Nat.strong_induction_on`](../../../Glossary/Nat.strong_induction_on.md) sets up strong induction. The statement $P(n)$ is `2 ≤ n → ∃ p, p.Prime ∧ p ∣ n`.
- The line `| _ n IH =>` shows the hypothesis explicitly. Here `IH : ∀ m < n, 2 ≤ m → ∃ p, p.Prime ∧ p ∣ m`. It says that $P(m)$ holds for every $m<n$.
- [`by_cases`](../../../Glossary/by_cases.md) `hp : n.Prime` splits into two cases: either `n` is itself prime, or it isn't.
- If `n` is [prime](../../../Glossary/Nat.Prime.md), `n` is its own prime factor: `⟨n, hp, dvd_refl n⟩`, where [`dvd_refl`](../../../Glossary/dvd_refl.md) `n` proves `n ∣ n`.
- If not, [`Nat.exists_dvd_of_not_prime2`](../../../Glossary/Nat.exists_dvd_of_not_prime2.md) `hn hp` produces a proper divisor `m` of `n`, with `hm2 : 2 ≤ m` and `hmn : m < n`.
- `IH m hmn hm2` uses the hypothesis at this `m`. It needs `m < n` to be allowed, and `2 ≤ m` for the conclusion. It returns a prime `p` dividing `m`.
- Since `p ∣ m` and `m ∣ n`, [`dvd_trans`](../../../Glossary/dvd_trans.md) gives `p ∣ n`.
- A proper divisor of a composite number can be much smaller than `n - 1`. This is why the proof needs the hypothesis at every smaller number, not only at `n - 1`.

## The same proof as a recursive theorem

### Code

```lean
theorem exists_prime_factor' : ∀ n, 2 ≤ n → ∃ p, p.Prime ∧ p ∣ n
  | n, hn => by
      by_cases hp : n.Prime
      · exact ⟨n, hp, dvd_refl n⟩
      · obtain ⟨m, hmdvd, hm2, hmn⟩ := Nat.exists_dvd_of_not_prime2 hn hp
        obtain ⟨p, hp_prime, hp_dvd⟩ := exists_prime_factor' m hm2
        exact ⟨p, hp_prime, dvd_trans hp_dvd hmdvd⟩
```

### Walkthrough

- The proof steps are the same. The difference is where the hypothesis comes from: `exists_prime_factor' m hm2` is a recursive use of the theorem being proved, in place of `IH m hmn hm2`.
- A recursive use is allowed only at a smaller number. Lean finds `hmn : m < n` in the context and accepts the recursion. So this recursive use is the strong inductive hypothesis, written in a shorter way.

## Back-link

- [Module 6 – Induction](../06-Induction.md)
