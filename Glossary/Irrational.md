# `Irrational`

**Meaning.** `Irrational x` says that the real number `x` is not equal to any rational number. Its definition is a negation: it says `x` is not in the set of values `(q : ℝ)` for `q : ℚ`.

**Example.**
```lean
import Mathlib

example {x : ℝ} (h : Irrational x) (q : ℚ) : (q : ℝ) ≠ x := by
  intro hq
  exact h ⟨q, hq⟩
```

**Use it when** you state or use that a number is irrational. To prove `Irrational x`, [`rintro`](rintro.md) `⟨q, hq⟩` assumes a rational `q` with `hq : (q : ℝ) = x`, and the goal becomes `False`.

**Reference.** [Mathlib documentation — `Irrational`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/NumberTheory/Real/Irrational.html#Irrational)
