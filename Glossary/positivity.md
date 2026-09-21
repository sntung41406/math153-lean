# `positivity`

**Meaning.** `positivity` proves goals of the form `0 ≤ e`, `0 < e` or `e ≠ 0` by looking at the *form* of the expression `e` — for example, a square is nonnegative, and a sum of a nonnegative and a positive term is positive.

**Example.**
```lean
import Mathlib

example (b : ℚ) : 0 < b ^ 2 + 1 := by positivity
```

**Use it when** the reason a quantity is positive or nonnegative can be read off its shape. It is not meant for facts that depend on your hypotheses; for those, prove the side condition directly (for example with `linarith`).

**Reference.** [Mathlib documentation — `Mathlib.Tactic.Positivity.Core`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Tactic/Positivity/Core.html)
