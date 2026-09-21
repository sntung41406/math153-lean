# `lt_or_ge`

**Meaning.** The Mathlib lemma `lt_or_ge a b : a < b ∨ a ≥ b` — any two numbers are either strictly ordered one way or not.

**Example.**
```lean
import Mathlib

example (n : ℕ) : n < 2 ∨ n ≥ 2 := lt_or_ge n 2
```

**Use it when** you want to split a proof into two cases by comparing a variable with a fixed number: `obtain h | h := lt_or_ge n 2`.

**Reference.** [Mathlib documentation — `lt_or_ge`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Order/Defs/LinearOrder.html#lt_or_ge)
