# `congrFun`

**Meaning.** `congrFun h a : u a = v a` when `h : u = v` is an equation between functions. Equal functions give equal outputs at every input.

**Example.**
```lean
import Mathlib

example (u v : ℝ → ℝ) (h : u = v) : u 0 = v 0 := congrFun h 0
```

**Use it when** you have an equation between functions and want it at one particular input. This is how to show two functions are *different*: assume they are equal, evaluate both sides at a well-chosen input with `congrFun`, and reach a false numerical equation. It is the opposite direction of [`ext`](ext.md). Compare [`congrArg`](congrArg.md), which keeps the function and uses an equation between inputs.

**Reference.** [Lean documentation — `congrFun`](https://leanprover-community.github.io/mathlib4_docs/Init/Prelude.html#congrFun)
