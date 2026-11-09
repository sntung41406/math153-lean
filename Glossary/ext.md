# `ext`

**Meaning.** `ext x` proves that two functions (or two sets) are equal by checking them one element at a time. For functions, the goal `u = v` becomes `u x = v x` for an arbitrary `x`. This is *function extensionality*: functions that agree at every input are equal. For sets, the goal `S = T` becomes `x ∈ S ↔ x ∈ T`.

**Example.**
```lean
import Mathlib

example : (fun x : ℝ ↦ x + x) = (fun x ↦ 2 * x) := by
  ext x
  ring
```

**Use it when** the goal is an equation between functions, such as `g ∘ f = h`, or between sets, such as an image or a preimage. After `ext x`, the goal is about numbers or membership, which ordinary tactics can handle. To go the other way, from an equation of functions to an equation at one input, use [`congrFun`](congrFun.md).

**Reference.** [Lean documentation — `ext`](https://leanprover-community.github.io/mathlib4_docs/Init/Ext.html#Lean.Elab.Tactic.Ext.ext)
