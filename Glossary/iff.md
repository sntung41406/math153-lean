# `↔` (if and only if)

**Meaning.** `P ↔ Q` is the statement "`P` if and only if `Q`": both `P → Q` and `Q → P` hold. Type `↔` as `\iff`.

**Example.**
```lean
import Mathlib

example {x : ℝ} : 2 * x = 6 ↔ x = 3 := by
  constructor
  · intro h
    linarith
  · intro h
    linarith

example {x : ℝ} (h : 2 * x = 6 ↔ x = 3) (hx : x = 3) : 2 * x = 6 := h.mpr hx
```

**Use it when** two statements are equivalent. Prove it with [`constructor`](constructor.md), which gives one goal for each direction. If `h : P ↔ Q`, then `h.mp` is the direction `P → Q` (left to right) and `h.mpr` is the direction `Q → P` (right to left). [`rw`](rw.md) `[h]` replaces the statement `P` by `Q` in the goal.

**Reference.** [Theorem Proving in Lean 4 — Propositions and Proofs](https://lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/)
