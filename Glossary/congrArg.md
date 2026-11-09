# `congrArg`

**Meaning.** `congrArg f h : f a = f b` when `h : a = b`. Applying the same function to equal inputs gives equal outputs.

**Example.**
```lean
import Mathlib

example (a b : ℤ) (h : a = b) : a + 1 = b + 1 := congrArg (fun x ↦ x + 1) h
```

**Use it when** you have an equation and want to apply the same function to both sides. A common case: from an equation between pairs, `congrArg Prod.fst h` gives an equation between their first coordinates ([`Prod.fst` and `Prod.snd`](Prod.fst-snd.md)). Compare [`congrFun`](congrFun.md), which keeps the input and uses an equation between functions.

**Reference.** [Lean documentation — `congrArg`](https://leanprover-community.github.io/mathlib4_docs/Init/Prelude.html#congrArg)
