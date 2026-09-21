# `exact`

**Meaning.** `exact` closes the goal with a proof that already matches it exactly — a hypothesis, or a lemma with all its inputs filled in.

**Example.**
```lean
import Mathlib

example {a : ℝ} (h1 : 1 ^ 2 ≤ a ^ 2) (h2 : 0 ≤ a) : 1 ≤ a := by
  exact le_of_pow_le_pow_left₀ (by norm_num) h2 h1

example {a : ℝ} (h : a = 2) : a = 2 := h
```

**Use it when** you already have a complete proof of the goal. Writing `by exact h` and writing `h` directly after `:=` (as in the second example, or a `calc` step `_ = 0 := h1`) give Lean the same proof; the first is inside tactic mode, the second is not.

**Reference.** [Lean 4 documentation — `exact` and `apply`](https://lean4.dev/tactics/core/exact-apply)
