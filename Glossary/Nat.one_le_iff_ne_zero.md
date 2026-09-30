# `Nat.one_le_iff_ne_zero`

**Meaning.** The lemma `Nat.one_le_iff_ne_zero : 1 ≤ n ↔ n ≠ 0` for natural numbers — a natural number is at least `1` exactly when it is not `0`.

**Example.**
```lean
import Mathlib

example {k : ℕ} (hk : k ≠ 0) : 1 ≤ k := Nat.one_le_iff_ne_zero.mpr hk
```

**Use it when** you know `n ≠ 0` and need `1 ≤ n` (use `.mpr`), or the other way round (use `.mp`). An `↔` statement can be used in either direction: `.mp` goes left to right, `.mpr` right to left. [`omega`](omega.md) proves the same step without naming the lemma.

**Reference.** [Lean documentation — `Nat.one_le_iff_ne_zero`](https://leanprover-community.github.io/mathlib4_docs/Init/Data/Nat/Lemmas.html#Nat.one_le_iff_ne_zero)
