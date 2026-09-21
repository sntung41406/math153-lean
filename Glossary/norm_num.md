# `norm_num`

**Meaning.** `norm_num` normalizes and closes goals that are true by direct numeric computation.

**Example.**
```lean
import Mathlib

example : 2 + 2 = 4 := by norm_num
```

**Use it when** the remaining goal is a concrete arithmetic fact with no variables left.

**Reference.** [Mathlib documentation — `Mathlib.Tactic.NormNum`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Tactic/NormNum.html)
