# `Rat.mul_den_eq_num`

**Meaning.** The lemma `Rat.mul_den_eq_num q : q * q.den = q.num` — a rational number times its denominator is its numerator.

**Example.**
```lean
import Mathlib

example (q : ℚ) : q * q.den = q.num := Rat.mul_den_eq_num q
```

**Use it when** you want to replace a statement about a rational number by a statement about its [numerator and denominator](Rat.num-den.md), without dividing.

**Reference.** [Mathlib documentation — `Rat.mul_den_eq_num`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Rat.html#Rat.mul_den_eq_num)
