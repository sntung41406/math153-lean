# `∨` (or)

**Meaning.** `P ∨ Q` is the statement "`P` or `Q`": at least one part holds (possibly both).

**Example.**
```lean
import Mathlib

example {x : ℝ} (hx : x = 2) : x = 1 ∨ x = 2 := by
  right
  exact hx
```

**Use it when** only one of several alternatives needs to hold. Prove it with `left` or `right`; use a hypothesis `h : P ∨ Q` by case-splitting with `obtain hp | hq := h`. Type `∨` as `\or`.

**Reference.** [Theorem Proving in Lean 4 — Propositions and Proofs](https://lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/)
