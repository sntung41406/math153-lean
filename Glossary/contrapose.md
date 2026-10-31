# `contrapose!`

**Meaning.** `contrapose! h` replaces the goal by its contrapositive. If the hypothesis is `h : P` and the goal is `Q`, it changes them to `h : ¬ Q` and goal `¬ P`. The `!` also runs [`push Not`](push-not.md) on the new hypothesis and goal, so negations are moved inward and negated inequalities are flipped.

**Example.**
```lean
import Mathlib

example {x : ℝ} (h : x ^ 2 < 4) : x < 2 := by
  contrapose! h
  nlinarith
```

**Use it when** the contrapositive is easier to prove than the original implication. In the example, `contrapose! h` turns `h : x ^ 2 < 4` and goal `x < 2` into `h : 2 ≤ x` and goal `4 ≤ x ^ 2`, which [`nlinarith`](nlinarith.md) proves.

**Reference.** [Mathematics in Lean — 3.3 Negation](https://leanprover-community.github.io/mathematics_in_lean/C03_Logic.html#negation)
