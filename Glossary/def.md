# `def`

**Meaning.** `def` declares a new named constant in the environment — a mathematical object, a function, or a proposition — giving it a type and a value you can refer to by that name afterward.

**Example.**
```lean
def MyStatement : Prop := 2 + 2 = 4
```

**Use it when** you want to name something for reuse later. Naming a proposition with `def` only states the claim; it does not prove it — a `theorem` (or, for something not reused by name, an `example`) supplies the proof.

**Reference.** [Theorem Proving in Lean 4 — Dependent Type Theory](https://lean-lang.org/theorem_proving_in_lean4/Dependent-Type-Theory/)
