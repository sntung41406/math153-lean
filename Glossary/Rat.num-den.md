# `Rat.num` and `Rat.den`

**Meaning.** A rational number `q : ℚ` is stored in lowest terms. `q.num : ℤ` is its numerator and `q.den : ℕ` is its positive denominator.

**Example.**
```lean
import Mathlib

#eval (6 / 8 : ℚ).num -- infoview displays `3`
#eval (6 / 8 : ℚ).den -- infoview displays `4`
```

**Use it when** you need to pass from a rational number to a pair of integers. See [`Rat.mul_den_eq_num`](Rat.mul_den_eq_num.md) and [`Rat.den_nz`](Rat.den_nz.md).

**Reference.** [Lean documentation — `Rat`](https://leanprover-community.github.io/mathlib4_docs/Init/Data/Rat/Basic.html#Rat)
