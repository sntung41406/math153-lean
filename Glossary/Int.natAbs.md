# `Int.natAbs`

**Meaning.** `b.natAbs` is the absolute value of the integer `b`, as a natural number.

**Example.**
```lean
import Mathlib

example : (-5 : ℤ).natAbs = 5 := rfl

example {b d : ℤ} (hb : b ≠ 0) (hd : b = d + d) : d.natAbs < b.natAbs := by
  omega
```

**Use it when** you need a natural-number measure of an integer, for example for strong induction. [`omega`](omega.md) understands `natAbs`.

**Reference.** [Lean documentation — `Int.natAbs`](https://leanprover-community.github.io/mathlib4_docs/Init/Data/Int/Basic.html#Int.natAbs)
