# `constructor`

**Meaning.** `constructor` splits an "and" goal `P ∧ Q` into two separate goals, `P` and `Q`.

**Example.**
```lean
import Mathlib

example {a b : ℝ} (ha : a = 9) (hb : b = 1) : a = 9 ∧ b = 1 := by
  constructor
  · exact ha
  · exact hb
```

**Use it when** the goal is an "and" statement and you want to prove each part on its own. Both goals must be closed.

**Reference.** [Theorem Proving in Lean 4 — Tactics](https://lean-lang.org/theorem_proving_in_lean4/Tactics/)
