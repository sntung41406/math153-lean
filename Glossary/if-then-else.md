# `if … then … else`

**Meaning.** `if c then a else b` has the value `a` when the proposition `c` is true and `b` when it is false. Lean must be able to decide `c`, which it can for comparisons and equations between numbers, such as `n % 2 = 0` or `0 ≤ z`. Inside a [`def`](def.md), it defines a function by cases.

**Example.**
```lean
import Mathlib

def sgn (z : ℤ) : ℤ := if 0 ≤ z then 1 else -1

example : sgn (-3) = -1 := by
  norm_num [sgn]
```

**Use it when** a function has a different formula for different inputs, as in a piecewise definition on paper. To prove something about such a function for a general input, unfold it with [`dsimp only`](dsimp.md) and then split the cases with [`split_ifs`](split_ifs.md).

**Reference.** [Lean documentation — `ite`](https://leanprover-community.github.io/mathlib4_docs/Init/Prelude.html#ite)
