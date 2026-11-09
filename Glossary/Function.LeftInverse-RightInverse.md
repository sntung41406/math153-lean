# `Function.LeftInverse` and `Function.RightInverse`

**Meaning.** `LeftInverse g f` means `∀ x, g (f x) = x`: applying `f` and then `g` returns the input. `RightInverse g f` means `∀ y, f (g y) = y`: applying `g` and then `f` returns the output. In both, the inverse `g` is written **first** and the original function `f` second.

**Example.**
```lean
import Mathlib

open Function

example : LeftInverse (fun y : ℤ ↦ y - 1) (fun x ↦ x + 1) := by
  intro x
  dsimp only
  ring

example : RightInverse (fun y : ℤ ↦ y - 1) (fun x ↦ x + 1) := by
  intro y
  dsimp only
  ring
```

**Use it when** a statement is about undoing a function. Both are pointwise, so a proof starts with [`intro`](intro.md). A left inverse makes **`f`** injective, and a right inverse makes **`f`** surjective: if `hL : LeftInverse g f` and `hR : RightInverse g f`, then `hL.injective : Injective f` and `hR.surjective : Surjective f`. Together, `⟨hL.injective, hR.surjective⟩ : Bijective f`.

**Reference.** [Lean documentation — `Function.LeftInverse`](https://leanprover-community.github.io/mathlib4_docs/Init/Data/Function.html#Function.LeftInverse) and [`Function.RightInverse`](https://leanprover-community.github.io/mathlib4_docs/Init/Data/Function.html#Function.RightInverse)
