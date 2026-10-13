# `by_contra`

**Meaning.** `by_contra h` starts a proof by contradiction. If the goal is `P`, it adds the assumption `h : ¬ P` and changes the goal to `False`.

**Example.**
```lean
import Mathlib

example {x : ℝ} (h : x ^ 2 < 1) : x < 1 := by
  by_contra hx
  have hx' : 1 ≤ x := not_lt.mp hx
  nlinarith
```

**Use it when** the goal is a positive statement, you see no direct proof, and assuming the opposite gives you something to work with. Above, `hx : ¬x < 1` becomes `hx' : 1 ≤ x`, and then `x ^ 2 ≥ 1` contradicts `h`. For a goal that is already a negation [`¬ P`](not.md), use [`intro`](intro.md) instead.

**Reference.** [Mathlib documentation — `by_contra`](https://leanprover-community.github.io/mathlib4_docs/Batteries/Tactic/Init.html)
