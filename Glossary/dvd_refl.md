# `dvd_refl`

**Meaning.** The lemma `dvd_refl a : a ∣ a` — every number divides itself.

**Example.**
```lean
import Mathlib

example (n : ℕ) : n ∣ n := dvd_refl n
```

**Use it when** a number is its own divisor in the goal, for example when a prime `n` is its own prime factor.

**Reference.** [Mathlib documentation — `dvd_refl`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Divisibility/Basic.html#dvd_refl)
