# `decide`

**Meaning.** `decide` proves a statement by computing whether it is true. In this course we use it for facts about specific numbers, such as a divisibility or a congruence between small integers. It fails on a statement about an unknown variable `x`, and it can be slow when the computation is large.

**Example.**
```lean
import Mathlib

example : ¬ (5 : ℤ) ∣ 12 := by decide
```

**Use it when** you want to check a numeric fact, such as a divisibility or a congruence between numbers. It gives no reason why the fact holds, so when the reason matters, write the proof yourself.

**Reference.** [Lean documentation — `decide`](https://leanprover-community.github.io/mathlib4_docs/Init/Tactics.html#Lean.Parser.Tactic.decide)
