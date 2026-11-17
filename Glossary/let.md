# `let`

**Meaning.** Inside a proof, `let x : T := value` gives a name to a value, such as a number, a function, or a set. Unlike [`have`](have.md), which forgets *how* a fact was proved, `let` remembers the value: Lean can unfold `x` back to `value` whenever it needs to.

**Example.**
```lean
import Mathlib

example : ∃ s : Set ℕ, 3 ∈ s := by
  let s : Set ℕ := {n | n < 5}
  use s
  show 3 < 5
  norm_num
```

**Use it when** a proof builds a specific object, such as the diagonal set in Cantor's theorem, and refers to it several times. Because Lean remembers the value, a membership `x ∈ s` can be unfolded to the property that defines `s`.

**Reference.** [Lean 4 documentation — `have` and `let`](https://lean4.dev/tactics/core/have-let)
