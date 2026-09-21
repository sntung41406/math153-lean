# `≠` (not equal)

**Meaning.** `a ≠ b` is the statement "`a` is not equal to `b`" — that is, `a = b` is false.

**Example.**
```lean
import Mathlib

example : (2 : ℚ) / 3 ≠ 1 := by norm_num
```

**Use it when** you need to rule out an equality. For numbers, it is often easiest to prove a strict inequality first and then use `ne_of_lt` or `ne_of_gt`. Type `≠` as `\ne`.

**Reference.** [Lean documentation — `Ne`](https://leanprover-community.github.io/mathlib4_docs/Init/Core.html#Ne)
