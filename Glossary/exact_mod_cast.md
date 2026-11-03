# `exact_mod_cast`

**Meaning.** `exact_mod_cast h` closes the goal with `h` when the two statements differ only by casts between number systems. For example, it can turn a statement about `(a : ℝ)` into the same statement about `a : ℕ`.

**Example.**
```lean
import Mathlib

example {a b : ℕ} (h : (a : ℝ) = b) : a = b := by
  exact_mod_cast h
```

**Use it when** you have proved a fact in a larger number system and need it in a smaller one, or the reverse.

**Reference.** [Lean documentation — `exact_mod_cast`](https://leanprover-community.github.io/mathlib4_docs/Init/Tactics.html)
