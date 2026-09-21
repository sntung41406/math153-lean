# `le_antisymm`

**Meaning.** The Mathlib lemma `le_antisymm : a ≤ b → b ≤ a → a = b` — if each number is at most the other, they are equal.

**Example.**
```lean
import Mathlib

example {x : ℝ} (h1 : x ≤ 3) (h2 : 3 ≤ x) : x = 3 := le_antisymm h1 h2
```

**Use it when** an equality is hard to prove directly but each inequality is easy. `apply le_antisymm` turns the goal `a = b` into two goals, `a ≤ b` and `b ≤ a`.

**Reference.** [Mathlib documentation — `le_antisymm`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Order/Defs/PartialOrder.html#le_antisymm)
