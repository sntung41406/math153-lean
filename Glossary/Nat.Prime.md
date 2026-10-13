# `Nat.Prime`

**Meaning.** `Nat.Prime p` says the natural number `p` is prime: `p ≥ 2`, and the only natural numbers dividing `p` are `1` and `p`.

**Example.**
```lean
import Mathlib

example : Nat.Prime 7 := by norm_num

example : ¬ Nat.Prime 6 := by norm_num
```

**Use it when** a statement is about prime numbers. For a specific number, [`norm_num`](norm_num.md) decides whether it is prime. To work from the definition by hand, rewrite with [`Nat.prime_def`](Nat.prime_def.md) first: Mathlib's internal definition is stated differently.

**Reference.** [Mathlib documentation — `Nat.Prime`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Nat/Prime/Defs.html#Nat.Prime)
