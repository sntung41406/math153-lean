# `Function.Bijective`

**Meaning.** `Bijective f` says that `f` is both injective and surjective. It is defined as `Injective f ∧ Surjective f`, so every output is hit exactly once. With `open Function`, you can write `Bijective f` in place of `Function.Bijective f`.

**Example.**
```lean
import Mathlib

open Function

example : Bijective (fun x : ℝ ↦ x + 3) := by
  constructor
  · intro x1 x2 h
    dsimp only at h
    linarith
  · intro y
    use y - 3
    dsimp only
    ring
```

**Use it when** a statement says a function is a bijection. Since it is an `∧`, [`constructor`](constructor.md) splits the goal into the [injective](Function.Injective.md) half and the [surjective](Function.Surjective.md) half, and [`obtain`](obtain.md) `⟨hinj, hsurj⟩ := h` splits a hypothesis. A function with a left inverse and a right inverse is bijective ([`Function.LeftInverse` and `Function.RightInverse`](Function.LeftInverse-RightInverse.md)).

**Reference.** [Mathlib documentation — `Function.Bijective`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Logic/Function/Defs.html#Function.Bijective)
