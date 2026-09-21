# `ring`

**Meaning.** `ring` proves equalities that hold in any commutative ring by normalizing both sides.

**Example.**
```lean
import Mathlib

example (a b : ℤ) : (a + b) ^ 2 = a ^ 2 + 2 * a * b + b ^ 2 := by ring
```

**Use it when** verifying a purely algebraic rearrangement you've already worked out on paper — it checks the rearrangement, it doesn't find it for you.

**Reference.** [Lean 4 documentation — `ring`](https://lean4.dev/tactics/mathlib/ring)
