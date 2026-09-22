# `theorem`

**Meaning.** `theorem` names a proposition together with its proof, recording both permanently in the environment.

**Example.**
```lean
theorem easy : 2 + 2 = 4 := rfl
```

**Use it when** you want to state a proposition and prove it under a name you can cite from later proofs — unlike `def`, which can name a proposition without proving it, and `example`, which proves one without naming it.

**Reference.** [Theorem Proving in Lean 4 — Propositions and Proofs](https://lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/)
