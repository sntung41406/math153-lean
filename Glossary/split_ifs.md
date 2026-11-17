# `split_ifs`

**Meaning.** `split_ifs` finds every [`if c then a else b`](if-then-else.md) in the goal and splits the proof into one case for each choice of branch. In each case, the condition `c` or its negation `¬ c` becomes a new hypothesis, and the `if` is replaced by the chosen branch. When the goal contains two `if`s, there can be up to four cases.

**Example.**
```lean
import Mathlib

example (n : ℕ) : (if n % 2 = 0 then n else n + 1) % 2 = 0 := by
  split_ifs <;> omega
```

**Use it when** a goal mentions a function defined with `if … then … else` at a general input, so Lean cannot pick the branch by computing. Unfold the definition first, for example with [`dsimp only`](dsimp.md). `split_ifs <;> tac` runs the tactic `tac` on every case; [`omega`](omega.md) is a good choice when the conditions and branches are arithmetic. Some cases may be impossible, with contradictory conditions; the finishing tactic closes them from those hypotheses.

**Reference.** [Mathlib documentation — `split_ifs`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Tactic/SplitIfs.html#Mathlib.Tactic.splitIfs)
