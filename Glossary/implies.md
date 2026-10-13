# `→` (implies)

**Meaning.** `P → Q` is the statement "if `P` then `Q`". `P` is called the antecedent and `Q` the conclusion. Type `→` as `\to`.

**Example.**
```lean
import Mathlib

example {x : ℝ} : x > 2 → x ^ 2 > 4 := by
  intro h
  nlinarith

example {x : ℝ} (h : x > 2 → x ^ 2 > 4) (hx : x > 2) : x ^ 2 > 4 := h hx
```

**Use it when** a conclusion holds only under a condition. To prove `P → Q`, start with [`intro`](intro.md) `h` to assume `P`, then prove `Q`. To use a hypothesis `h : P → Q`, give it a proof of `P`: if `hp : P`, then `h hp` is a proof of `Q`. With [`apply`](apply.md) `h`, a goal `Q` becomes the goal `P`.

**Reference.** [Theorem Proving in Lean 4 — Propositions and Proofs](https://lean-lang.org/theorem_proving_in_lean4/Propositions-and-Proofs/)
