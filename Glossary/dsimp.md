# `dsimp`

**Meaning.** `dsimp` tidies the goal by unfolding notation and carrying out substitutions that hold by definition. It does not change what the goal means, only how it is displayed. `dsimp at h` tidies the hypothesis `h`.

**Example.**
```lean
import Mathlib

example : ∃! x : ℝ, x + 1 = 3 := by
  use 2
  dsimp
  constructor
  · norm_num
  · intro y hy
    linarith
```

**Use it when** the Infoview shows a goal or hypothesis in a raw form, such as `(fun x => x + 1 = 3) 2`. This happens after `use` on an [`∃!`](exists-unique.md) goal and after `obtain` on an `∃!` hypothesis. Above, `dsimp` turns the goal into `2 + 1 = 3 ∧ ∀ (y : ℝ), y + 1 = 3 → y = 2`.

**Reference.** [Lean documentation — `dsimp`](https://leanprover-community.github.io/mathlib4_docs/Init/Tactics.html#Lean.Parser.Tactic.dsimp)
