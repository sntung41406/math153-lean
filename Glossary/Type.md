# `Type*`

**Meaning.** `{α : Type*}` says that `α` is a type, and it can be any type: `ℕ`, `ℤ`, `ℝ`, and so on. A statement with `{α : Type*}` is a statement about *every* domain, in the same way that `(P : Prop)` gives a statement about every proposition. The `*` is a technical detail that lets `α` be a type of any size; read `Type*` as "any type". The curly braces mean that you do not write `α` when you use the statement, because Lean works it out from the other inputs.

**Example.**
```lean
import Mathlib

example {α : Type*} {P : α → Prop} (h : ∀ x : α, P x) (a : α) : P a := by
  exact h a
```

**Use it when** you want to state a rule about quantifiers that does not depend on the domain, as in the logic examples of Module 5. The proof may not use any special fact about `α`, such as its arithmetic, so the same proof works for every domain.

**Reference.** [Theorem Proving in Lean 4 — Dependent Type Theory](https://lean-lang.org/theorem_proving_in_lean4/Dependent-Type-Theory/)
