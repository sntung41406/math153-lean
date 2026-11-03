# `Rat.den_nz`

**Meaning.** `q.den_nz : q.den ≠ 0` — the denominator of a rational number is not zero.

**Example.**
```lean
import Mathlib

example (q : ℚ) : q.den ≠ 0 := q.den_nz
```

**Use it when** a step needs a nonzero denominator. Use [`exact_mod_cast`](exact_mod_cast.md) to move it to `ℤ` or `ℚ`.

**Reference.** [Lean documentation — `Rat`](https://leanprover-community.github.io/mathlib4_docs/Init/Data/Rat/Basic.html#Rat)
