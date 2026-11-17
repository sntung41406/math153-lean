# `Nat.odd_iff`

**Meaning.** The Mathlib lemma `Nat.odd_iff : Odd n ↔ n % 2 = 1` for a natural number `n`. It turns the existential definition of [`Odd`](Odd.md) into a remainder that can be computed.

**Example.**
```lean
import Mathlib

example : ¬ Odd (10 : ℕ) := by
  rw [Nat.odd_iff]
  norm_num
```

**Use it when** you need to check whether a specific natural number is odd, especially to prove that it is *not*: [`rw`](rw.md) `[Nat.odd_iff]`, then [`norm_num`](norm_num.md) computes the remainder.

**Reference.** [Mathlib documentation — `Nat.odd_iff`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Parity.html#Nat.odd_iff)
