# `linarith`

**Meaning.** `linarith` closes goals that follow from a linear combination of the hypotheses already in context.

**Example.**
```lean
import Mathlib

example (x y : ℤ) (h1 : x ≤ 2) (h2 : y ≤ 3) : x + y ≤ 5 := by linarith
```

**Use it when** the goal is a linear equality or inequality that follows automatically from what's already known — it can't reason about products of unknowns.

**Reference.** [Lean 4 documentation — `linarith`](https://lean4.dev/tactics/mathlib/linarith)
