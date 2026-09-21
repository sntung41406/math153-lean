# `have`

**Meaning.** `have` proves an intermediate fact and gives it a name, so later steps can use it like any other hypothesis.

**Example.**
```lean
import Mathlib

example {a b : ℝ} (h1 : a - 5 * b = 4) (h2 : b + 2 = 3) : a = 9 := by
  have hb : b = 1 := by linarith
  linarith
```

**Use it when** a proof needs a fact partway through ("since ..., we have ..."), especially one you will use more than once. The fact can be proved by any tactic, including a whole `calc` chain: `have h : A ≤ C := by calc ...`.

**Reference.** [Lean 4 documentation — `have` and `let`](https://lean4.dev/tactics/core/have-let)
