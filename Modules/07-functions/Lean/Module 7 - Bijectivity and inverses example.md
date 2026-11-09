# Module 7 - Bijectivity and inverses example

## Statement

For any function $f : X \to Y$: if $f$ has a left inverse and a right inverse $g$, then $f$ is bijective; and if $f$ is bijective, then it has a function $g$ that is both a left and a right inverse.

## Code

```lean
import Mathlib

open Function

example {X Y : Type*} {f : X → Y} {g : Y → X}
    (hL : LeftInverse g f) (hR : RightInverse g f) : Bijective f := by
  constructor
  · intro x1 x2 h
    calc x1 = g (f x1) := by rw [hL x1]
      _ = g (f x2) := by rw [h]
      _ = x2 := hL x2
  · intro y
    use g y
    exact hR y

example {X Y : Type*} {f : X → Y} (hf : Bijective f) :
    ∃ g : Y → X, LeftInverse g f ∧ RightInverse g f := by
  obtain ⟨hinj, hsurj⟩ := hf
  choose g hg using hsurj
  use g
  constructor
  · intro x
    exact hinj (hg (f x))
  · exact hg
```

## Walkthrough

- `{X Y : Type*}` makes the statements hold for any two types, not one particular example. Recall that [`LeftInverse g f`](../../../Glossary/Function.LeftInverse-RightInverse.md) means `∀ x, g (f x) = x` and `RightInverse g f` means `∀ y, f (g y) = y`.

**From an inverse to bijectivity.**

- `constructor` splits `Bijective f` into the injective and the surjective halves.
- **Injective half.** Given `h : f x1 = f x2`, the [`calc`](../../../Glossary/calc.md) chain follows the hand proof: $x_1 = g(f(x_1)) = g(f(x_2)) = x_2$. The first step rewrites with `hL x1 : g (f x1) = x1`, the second with `h`, and the third is `hL x2` itself. Only the left-inverse identity is used.
- **Surjective half.** Given `y`, the witness is `g y`, and `hR y : f (g y) = y` is exactly what is needed. Only the right-inverse identity is used.
- Mathlib has both facts under the names `LeftInverse.injective` and `RightInverse.surjective`, which [Module 7 - Inverse example](Module%207%20-%20Inverse%20example.md) uses.

**From bijectivity to an inverse.**

- [`obtain`](../../../Glossary/obtain.md) splits `hf` into `hinj : Injective f` and `hsurj : Surjective f`.
- [`choose`](../../../Glossary/choose.md) `g hg using hsurj` is where the inverse is built. `hsurj` says `∀ y, ∃ x, f x = y`. `choose` selects one such `x` for every `y` and collects the choices into a function `g : Y → X`, with `hg : ∀ y, f (g y) = y`. This is exactly `RightInverse g f`, and it uses only surjectivity.
- [`use`](../../../Glossary/use.md) `g` offers this function as the witness, and `constructor` splits the two identities.
- **Left inverse.** For `x`, `hg (f x)` says `f (g (f x)) = f x`: both `g (f x)` and `x` are sent to `f x`. Injectivity `hinj` turns this into `g (f x) = x`. This is the step that uses injectivity: `g` picked *some* preimage of `f x`, and injectivity says it must be `x`.
- **Right inverse.** `exact hg`, from the `choose` step.
- `g` exists only inside this proof, so no `noncomputable` is needed. A separately named definition built by choice, such as `def inv (f : X → Y) (hf : Bijective f) : Y → X`, would need `noncomputable`, for a different reason than `pinv` in the Inverse example: `choose` says *that* a preimage exists, but gives Lean no way to compute it. The reason for `pinv` is real division.

## Back-link

- [Module 7 – Functions](../07-Functions.md)
