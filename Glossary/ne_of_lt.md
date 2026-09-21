# `ne_of_lt`

**Meaning.** The Mathlib lemma `ne_of_lt : a < b → a ≠ b` — a strictly smaller number is not equal to the larger one.

**Example.**
```lean
import Mathlib

example {x : ℚ} (h : x < 1) : x ≠ 1 := ne_of_lt h
```

**Use it when** the goal is `a ≠ b` and you can show `a < b`. `apply ne_of_lt` changes the goal to `a < b`.

**Reference.** [Mathlib documentation — `ne_of_lt`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Order/Defs/PartialOrder.html#ne_of_lt)
