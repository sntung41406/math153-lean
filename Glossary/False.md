# `False`

**Meaning.** `False` is the statement that is never true. A goal `False` asks you to show that the current hypotheses are impossible. A hypothesis `False` closes any goal.

**Example.**
```lean
import Mathlib

example {x : ℝ} (h1 : x < 1) (h2 : x > 2) : False := by
  linarith
```

**Use it when** you read the Infoview during a proof by contradiction. After [`intro`](intro.md) on a goal [`¬ P`](not.md), or after [`by_contra`](by_contra.md), the goal is `False`. Close it by showing that two hypotheses disagree, for example with [`linarith`](linarith.md), `norm_num at h`, or [`contradiction`](contradiction.md).

**Reference.** [Lean documentation — `False`](https://leanprover-community.github.io/mathlib4_docs/Init/Prelude.html#False)
