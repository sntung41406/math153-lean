# `Nat.prime_def`

**Meaning.** The Mathlib lemma `Nat.prime_def : Nat.Prime p ↔ 2 ≤ p ∧ ∀ m, m ∣ p → m = 1 ∨ m = p` — a natural number is prime exactly when it is at least `2` and its only divisors are `1` and itself.

**Example.**
```lean
import Mathlib

example {p : ℕ} (hp : Nat.Prime p) : 2 ≤ p := by
  rw [Nat.prime_def] at hp
  obtain ⟨h2, hdiv⟩ := hp
  exact h2
```

**Use it when** you want to prove or use [`Nat.Prime`](Nat.Prime.md) through the definition you know from paper. It is an [`↔`](iff.md), so `rw [Nat.prime_def]` replaces `Nat.Prime p` by the right-hand side, in the goal or (with `at`) in a hypothesis.

**Reference.** [Mathlib documentation — `Nat.prime_def`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Nat/Prime/Defs.html#Nat.prime_def)
