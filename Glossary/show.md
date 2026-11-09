# `show`

**Meaning.** `show t` restates the goal as `t`. Lean accepts it only if `t` means the same thing as the current goal by definition, for example after unfolding notation. The goal itself does not change, only how it is written.

**Example.**
```lean
import Mathlib

example : (fun y : ℝ ↦ 2 * y) ∘ (fun y ↦ y + 1) = fun y ↦ 2 * y + 2 := by
  ext x
  show 2 * (x + 1) = 2 * x + 2
  ring
```

**Use it when** the goal is written in a form that is hard to read, such as `(g ∘ f) x` or membership in an image or a preimage, and you want to see what it means. Writing the goal out also documents the proof for a reader. If Lean rejects the `show`, the new statement is not the same as the goal by definition, and you need a real proof step, such as [`rw`](rw.md), instead. To tidy a goal without writing it out, use [`dsimp`](dsimp.md).

**Reference.** [Lean documentation — `show`](https://leanprover-community.github.io/mathlib4_docs/Init/Tactics.html#Lean.Parser.Tactic.show)
