# `simp`

**Meaning.** `simp` simplifies the goal using a large list of standard facts, such as `x * 0 = 0` and `x + 0 = x`. `simp at h` simplifies the hypothesis `h` instead. If `h` becomes `False`, the goal is closed.

**Example.**
```lean
import Mathlib

example {x : ℕ} (h : 0 < x * 0) : False := by
  simp at h
```

**Use it when** a routine simplification is all that remains. Here `x * 0` becomes `0`, then `0 < 0` becomes `False`. Avoid `simp` for a main step you want the reader to see: it does not say which facts it used.

**Reference.** [Lean documentation — `simp`](https://leanprover-community.github.io/mathlib4_docs/Init/Tactics.html#Lean.Parser.Tactic.simp)
