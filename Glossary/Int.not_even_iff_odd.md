# `Int.not_even_iff_odd`

**Meaning.** The Mathlib lemma `Int.not_even_iff_odd : ¬Even n ↔ Odd n` for integers — an integer is not even exactly when it is odd.

**Example.**
```lean
import Mathlib

example {n : ℤ} (h : ¬ Even n) : Odd n := by
  rw [Int.not_even_iff_odd] at h
  exact h
```

**Use it when** a negation such as `¬Even n` appears, for example after [`contrapose!`](contrapose.md), and you want the positive form [`Odd`](Odd.md) `n`, which gives a witness `k` with `n = 2 * k + 1`. Rewrite with it using [`rw`](rw.md), in a hypothesis with `at h`, or in the goal.

**Reference.** [Mathlib documentation — `Int.not_even_iff_odd`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Int/Parity.html#Int.not_even_iff_odd)
