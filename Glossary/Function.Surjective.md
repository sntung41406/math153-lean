# `Function.Surjective`

**Meaning.** `Surjective f` says that every possible output of `f` is hit. It is defined as `∀ b, ∃ a, f a = b`. With `open Function`, you can write `Surjective f` in place of `Function.Surjective f`.

**Example.**
```lean
import Mathlib

open Function

example : Surjective (fun x : ℝ ↦ x + 3) := by
  intro y
  use y - 3
  dsimp only
  ring
```

**Use it when** a statement says a function is onto. To prove `Surjective f`, [`intro`](intro.md) a target `y`, then [`use`](use.md) a witness and check that `f` sends it to `y`. To disprove it, assume `h : Surjective f`, apply `h` to a target with no preimage, and take the result apart with [`obtain`](obtain.md). Compare [`Function.Injective`](Function.Injective.md) and [`Function.Bijective`](Function.Bijective.md).

**Reference.** [Lean documentation — `Function.Surjective`](https://leanprover-community.github.io/mathlib4_docs/Init/Data/Function.html#Function.Surjective)
