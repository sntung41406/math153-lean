# `Nat.pow_le_pow_left`

**Meaning.** The lemma `Nat.pow_le_pow_left : a ≤ b → ∀ k, a ^ k ≤ b ^ k` — for natural numbers, raising both sides of `≤` to the same power keeps the inequality.

**Example.**
```lean
import Mathlib

example (n : ℕ) (h : n ≤ 1) : n ^ 2 ≤ 1 ^ 2 := Nat.pow_le_pow_left h 2
```

**Use it when** you are comparing powers of natural numbers and already know how their bases compare.

**Reference.** [Lean documentation — `Nat.pow_le_pow_left`](https://leanprover-community.github.io/mathlib4_docs/Init/Data/Nat/Basic.html#Nat.pow_le_pow_left)
