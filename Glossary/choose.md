# `choose`

**Meaning.** From a hypothesis `h : ∀ y, ∃ x, P y x`, the tactic `choose g hg using h` builds a function `g` that picks one witness for every `y`, and a proof `hg : ∀ y, P y (g y)`.

**Example.**
```lean
import Mathlib

example (h : ∀ n : ℕ, ∃ m : ℕ, n < m) : ∃ s : ℕ → ℕ, ∀ n, n < s n := by
  choose s hs using h
  use s
```

**Use it when** you need a *function* made of witnesses, for example a right inverse of a surjective function: from `∀ y, ∃ x, f x = y`, `choose` gives `g` with `∀ y, f (g y) = y`. This `g` need not undo `f` in the other direction; for `g (f x) = x` you also need `f` to be injective. The function `g` is built by choosing, not by a formula, so Lean cannot compute its values. Inside a proof this does not matter. A named [`def`](def.md) built this way must be marked `noncomputable`.

**Reference.** [Mathlib documentation — `Mathlib.Tactic.Choose`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Tactic/Choose.html)
