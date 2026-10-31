# `by_cases`

**Meaning.** `by_cases h : P` splits the proof into two cases, using the law of excluded middle: in the first case you have `h : P`, and in the second case you have `h : ¬ P`. Both cases have the same goal, and both must be closed. `P` can be any proposition; no proof that `P` is true or false is needed.

**Example.**
```lean
import Mathlib

example (P Q : Prop) (h1 : P → Q) (h2 : ¬ P → Q) : Q := by
  by_cases hP : P
  · exact h1 hP
  · exact h2 hP
```

**Use it when** the proof naturally goes "either `P` is true or it is not", and the hypotheses do not already give you an `∨` to take apart with [`obtain`](obtain.md). It is the key step in proving `¬¬P → P` and one direction of De Morgan's law `¬ (P ∧ Q) → ¬ P ∨ ¬ Q`.

**Reference.** [Mathematics in Lean — 3.3 Negation](https://leanprover-community.github.io/mathematics_in_lean/C03_Logic.html#negation)
