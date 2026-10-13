# `∃!` (there exists a unique)

**Meaning.** `∃! x, P x` is the statement "there is exactly one `x` such that `P x`". It is short for: there is an `x` with `P x`, and every `y` with `P y` equals `x`. Type `∃!` as `\exists!`.

**Example.**
```lean
import Mathlib

example : ∃! x : ℝ, 2 * x = 6 := by
  use 3
  dsimp
  constructor
  · norm_num
  · intro y hy
    linarith
```

**Use it when** a statement claims existence and uniqueness together. To prove it, [`use`](use.md) a witness, tidy the goal with [`dsimp`](dsimp.md), and split it with [`constructor`](constructor.md). To use a hypothesis `h : ∃! x, P x`, write `obtain ⟨x, hx, huniq⟩ := h`: then `hx : P x`, and `huniq` says every `y` with `P y` equals `x`. Compare with [`∃`](exists.md), which claims at least one.

**Reference.** [Mathlib documentation — `ExistsUnique`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Logic/ExistsUnique.html#ExistsUnique)
