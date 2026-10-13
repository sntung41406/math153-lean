# `∀` (for all)

**Meaning.** `∀ x, P x` is the statement "for every `x`, `P x` holds". Type `∀` as `\forall`.

**Example.**
```lean
import Mathlib

example : ∀ x : ℝ, x ^ 2 + 1 > 0 := by
  intro x
  positivity

example (h : ∀ x : ℝ, x ^ 2 + 1 > 0) : (3 : ℝ) ^ 2 + 1 > 0 := h 3
```

**Use it when** a statement is about every value of a variable. To prove a `∀` goal, start with [`intro`](intro.md) `x` to take an arbitrary `x`. To use a hypothesis `h : ∀ x, P x`, give it a value: `h 3` is a proof of `P 3`. `∀ x ≥ N, P x` is short for `∀ x, x ≥ N → P x`.

**Reference.** [Theorem Proving in Lean 4 — Quantifiers and Equality](https://lean-lang.org/theorem_proving_in_lean4/Quantifiers-and-Equality/)
