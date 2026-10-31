# `Prop`

**Meaning.** `Prop` is the type of propositions: statements that are true or false. Writing `P : Prop` only says that `P` is a statement; it does not say that `P` is true. Writing `h : P` says that `h` is a proof of `P`, so `P` is true. False statements are propositions too: `2 + 2 = 5` and [`False`](False.md) have type `Prop`, but they have no proof. Statements such as `2 + 2 = 4`, `x < 5`, and `Even n` all have type `Prop`, and so do the compound statements built from them with `∧`, `∨`, `¬`, `→`, `↔`, `∀`, and `∃`.

**Example.**
```lean
import Mathlib

#check (2 + 2 = 4 : Prop)

example (P Q : Prop) (hP : P) (hQ : Q) : P ∧ Q := by
  constructor
  · exact hP
  · exact hQ
```

**Use it when** you want to state a fact about *every* proposition, as in the logic examples of Module 5. `example (P Q : Prop) …` takes two arbitrary statements, and the proof may use only the hypotheses, not what `P` and `Q` say.

**Reference.** [Theorem Proving in Lean 4 — Propositions and Proofs](https://lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/)
