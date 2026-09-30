# `gcongr`

**Meaning.** `gcongr` proves a comparison between two expressions of the same shape by comparing the parts that differ. For `3 * a ≤ 3 * b`, the parts that differ are `a` and `b`, so it needs `a ≤ b`.

**Example.**
```lean
import Mathlib

example {a b : ℕ} (h : a ≤ b) : 3 * a ≤ 3 * b := by gcongr
```

**Use it when** both sides of an inequality look the same except in one place, and you know how that place compares. `gcongr` finds the needed fact among your hypotheses. If it cannot, it leaves that fact as a new goal.

**Reference.** [Mathlib documentation — `Mathlib.Tactic.GCongr`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Tactic/GCongr/Core.html)
