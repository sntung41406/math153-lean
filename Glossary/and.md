# `∧` (and)

**Meaning.** `P ∧ Q` is the statement "`P` and `Q`": both parts hold.

**Example.**
```lean
import Mathlib

example : (2 : ℤ) + 2 = 4 ∧ (3 : ℤ) < 5 := by
  constructor
  · norm_num
  · norm_num
```

**Use it when** you need two facts at once. Prove it with `constructor`; take a hypothesis `h : P ∧ Q` apart with `obtain ⟨hp, hq⟩ := h`. Type `∧` as `\and`.

**Reference.** [Theorem Proving in Lean 4 — Propositions and Proofs](https://lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/)
