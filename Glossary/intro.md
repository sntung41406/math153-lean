# `intro`

**Meaning.** `intro` moves the first part of the goal into the context and gives it a name. For a goal `∀ x, P x` it introduces an arbitrary `x`. For a goal `P → Q` it assumes `P`. For a goal `¬ P` it assumes `P`, and the goal becomes `False`.

**Example.**
```lean
import Mathlib

example : ∀ x : ℝ, x > 0 → x ^ 2 > 0 := by
  intro x hx
  positivity
```

**Use it when** the goal starts with [`∀`](forall.md), [`→`](implies.md) or [`¬`](not.md). Several names can be given at once: above, `intro x hx` introduces the number `x` and then the assumption `hx : x > 0`. [`rintro`](rintro.md) does the same and also takes the assumption apart with a pattern.

**Reference.** [Lean documentation — `intro`](https://leanprover-community.github.io/mathlib4_docs/Init/Tactics.html#Lean.Parser.Tactic.intro)
