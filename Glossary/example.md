# `example`

**Meaning.** `example` states a proposition and proves it, like `theorem`, but without naming it or storing it for later reuse — Lean only checks that the proof matches the stated type.

**Example.**
```lean
example : 2 + 2 = 4 := rfl
```

**Use it when** a proof stands on its own and nothing later needs to cite it by name — the common case for a worked illustration or an exercise.

**Reference.** [Theorem Proving in Lean 4 — Propositions and Proofs](https://lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/)
