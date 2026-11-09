# `Prod.fst` and `Prod.snd`

**Meaning.** `A × B` is the type of ordered pairs `(a, b)` with `a : A` and `b : B`. The projections read off the coordinates: `Prod.fst (a, b) = a` and `Prod.snd (a, b) = b`. For a pair `x`, they are usually written `x.1` and `x.2`. Type `×` as `\x`.

**Example.**
```lean
import Mathlib

example : ((3, 5) : ℤ × ℤ).1 = 3 := rfl

example (a b : ℤ) (h : (a, b) = (2, 7)) : a = 2 := by
  have h1 := congrArg Prod.fst h
  dsimp only at h1
  exact h1
```

**Use it when** you study a function whose outputs are pairs. Two pairs are equal exactly when both coordinates are equal, so from an equation between pairs, apply a projection to both sides with [`congrArg`](congrArg.md) to get an equation between coordinates. Then [`dsimp`](dsimp.md) reads off the coordinate.

**Reference.** [Lean documentation — `Prod`](https://leanprover-community.github.io/mathlib4_docs/Init/Prelude.html#Prod)
