# `use`

**Meaning.** `use` supplies a witness for a "there exists" goal. The goal becomes: show the property holds for that witness.

**Example.**
```lean
import Mathlib

example (x : ℝ) : ∃ y : ℝ, y > x := by
  use x + 1
  linarith
```

**Use it when** the goal starts with `∃` and you know (or can guess) a value that works. The witness may depend on variables in the statement, like `x + 1` above.

**Reference.** [Mathlib documentation — `Mathlib.Tactic.Use`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Tactic/Use.html)
