# `Function.Injective`

**Meaning.** `Injective f` says that `f` never sends two different inputs to the same output. It is defined as `∀ a₁ a₂, f a₁ = f a₂ → a₁ = a₂`. With `open Function`, you can write `Injective f` in place of `Function.Injective f`.

**Example.**
```lean
import Mathlib

open Function

example : Injective (fun x : ℝ ↦ x + 3) := by
  intro x1 x2 h
  dsimp only at h
  linarith
```

**Use it when** a statement says a function is one-to-one. To prove `Injective f`, [`intro`](intro.md) two inputs and the hypothesis that their outputs are equal, then prove the inputs are equal. To disprove it, assume `h : Injective f`, apply `h` to an equation between the outputs of two different inputs, and reach a false equation. Compare [`Function.Surjective`](Function.Surjective.md) and [`Function.Bijective`](Function.Bijective.md).

**Reference.** [Lean documentation — `Function.Injective`](https://leanprover-community.github.io/mathlib4_docs/Init/Data/Function.html#Function.Injective)
