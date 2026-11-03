# `push_cast`

**Meaning.** `push_cast` moves number-system conversions (*casts*) inward. For example, it rewrites the rational number `((k + 1 : ℕ) : ℚ)` as `(k : ℚ) + 1`.

**Example.**
```lean
import Mathlib

example (k : ℕ) : ((k + 1 : ℕ) : ℚ) = (k : ℚ) + 1 := by
  push_cast
  rfl
```

**Use it when** a goal mixes a natural number with arithmetic in `ℚ`, `ℝ`, or `ℤ`, and [`ring`](ring.md) cannot finish because a cast covers a sum or a product.

**Reference.** [Lean documentation — `push_cast`](https://leanprover-community.github.io/mathlib4_docs/Init/Tactics.html)
