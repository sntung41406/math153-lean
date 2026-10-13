# `constructor`

**Meaning.** `constructor` splits an "and" goal `P ∧ Q` into two separate goals, `P` and `Q`. It also splits an "if and only if" goal `P ↔ Q` into the two goals `P → Q` and `Q → P`.

**Example.**
```lean
import Mathlib

example {a b : ℝ} (ha : a = 9) (hb : b = 1) : a = 9 ∧ b = 1 := by
  constructor
  · exact ha
  · exact hb

example {x : ℝ} : x + 1 = 3 ↔ x = 2 := by
  constructor
  · intro h
    linarith
  · intro h
    linarith
```

**Use it when** the goal is an "and" statement or an [`↔`](iff.md) statement and you want to prove each part on its own. Both goals must be closed. A unique-existence goal [`∃!`](exists-unique.md) becomes an "and" after `use` and [`dsimp`](dsimp.md), so `constructor` splits it into existence and uniqueness.

**Reference.** [Theorem Proving in Lean 4 — Tactics](https://lean-lang.org/theorem_proving_in_lean4/Tactics/)
