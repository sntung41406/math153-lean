# `∃` (there exists)

**Meaning.** `∃ x, P x` is the statement "there exists `x` such that `P x`": at least one value makes `P` true.

**Example.**
```lean
import Mathlib

example : ∃ n : ℤ, 12 * n = 84 := by
  use 7
  norm_num
```

**Use it when** a statement asks for some value with a property. Prove it with `use` and a witness; take a hypothesis `h : ∃ x, P x` apart with `obtain ⟨x, hx⟩ := h`. Type `∃` as `\exists`.

**Reference.** [Theorem Proving in Lean 4 — Quantifiers and Equality](https://lean-lang.org/theorem_proving_in_lean4/Quantifiers-and-Equality/)
