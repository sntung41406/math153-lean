# `eq_zero_or_eq_zero_of_mul_eq_zero`

**Meaning.** The Mathlib lemma `eq_zero_or_eq_zero_of_mul_eq_zero : a * b = 0 → a = 0 ∨ b = 0` — a product is zero only when one of its factors is zero.

**Example.**
```lean
import Mathlib

example {x : ℝ} (h : (x - 1) * (x - 2) = 0) : x - 1 = 0 ∨ x - 2 = 0 :=
  eq_zero_or_eq_zero_of_mul_eq_zero h
```

**Use it when** you have factored an expression equal to zero and want to split into cases: `obtain h | h := eq_zero_or_eq_zero_of_mul_eq_zero h1`.

**Reference.** [Mathlib documentation — `eq_zero_or_eq_zero_of_mul_eq_zero`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/GroupWithZero/Defs.html#NoZeroDivisors.eq_zero_or_eq_zero_of_mul_eq_zero)
