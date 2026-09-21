# `left` and `right`

**Meaning.** `left` changes an "or" goal `P ∨ Q` to `P`; `right` changes it to `Q`. After that you prove only the side you chose.

**Example.**
```lean
import Mathlib

example {x : ℝ} (hx : x = 2) : x = 1 ∨ x = 2 := by
  right
  exact hx
```

**Use it when** the goal is an "or" statement and you know which alternative is true. Check first: choosing the false side leaves a goal that cannot be proved.

**Reference.** [Theorem Proving in Lean 4 — Tactics](https://lean-lang.org/theorem_proving_in_lean4/Tactics/)
