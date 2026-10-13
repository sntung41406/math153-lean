# `contradiction`

**Meaning.** `contradiction` closes the goal when the context contains a statement together with its negation: `h : P` and `h' : ¬ P`. It also closes the goal when a hypothesis is `False`. It can recognise false closed numerical statements over the integers or rationals, such as `H : (7 : ℤ) < 3` or `H : (7 : ℚ) < 3`, without a separate proof of their negation. For the real-number hypothesis `H : (7 : ℝ) < 3`, use [`norm_num`](norm_num.md) `at H` instead; `contradiction` alone does not close that goal.

**Example.**
```lean
import Mathlib

example {x : ℝ} (h : x > 0) (h' : ¬ x > 0) : x = 5 := by
  contradiction
```

**Use it when** the context contains directly incompatible facts or an impossibility the tactic can recognise directly. The goal can be anything, because from impossible hypotheses every statement follows. If the two hypotheses disagree only after some arithmetic, such as `x < 1` and `x > 2`, use [`linarith`](linarith.md) instead.

**Reference.** [Lean documentation — `contradiction`](https://leanprover-community.github.io/mathlib4_docs/Init/Tactics.html#Lean.Parser.Tactic.contradiction)
