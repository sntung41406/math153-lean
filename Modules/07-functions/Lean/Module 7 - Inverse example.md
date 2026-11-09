# Module 7 - Inverse example

## Statement

Prove $p(x) = 2x-5$ and $p^{-1}(y) = \dfrac{y+5}{2}$ are inverse to each other, and conclude that $p$ is bijective.

## Code

```lean
import Mathlib

open Function

def p (x : ℝ) : ℝ := 2 * x - 5
noncomputable def pinv (y : ℝ) : ℝ := (y + 5) / 2

theorem pinv_left : LeftInverse pinv p := by
  intro x
  dsimp only [p, pinv]
  ring

theorem pinv_right : RightInverse pinv p := by
  intro y
  dsimp only [p, pinv]
  ring

example : Bijective p := ⟨pinv_left.injective, pinv_right.surjective⟩
```

## Walkthrough

- `noncomputable` is needed on `pinv` because it divides real numbers. Lean cannot run a computation on an exact real number, so any definition that computes with real division must be marked this way. It does not change what `pinv` means or how we prove things about it.
- [`LeftInverse pinv p`](../../../Glossary/Function.LeftInverse-RightInverse.md) means `∀ x, pinv (p x) = x`: applying `p` and then `pinv` returns the input. Read the arguments carefully: the *inverse* comes first, and the original function second.
- [`RightInverse pinv p`](../../../Glossary/Function.LeftInverse-RightInverse.md) means `∀ y, p (pinv y) = y`: applying `pinv` and then `p` returns the output.
- Both are pointwise statements, so each proof starts with `intro`. Then `dsimp only [p, pinv]` unfolds the definitions, and `ring` checks the two identities $\frac{(2x-5)+5}{2}=x$ and $2\cdot\frac{y+5}{2}-5=y$.
- The pointwise identities say the same as `pinv ∘ p = id` and `p ∘ pinv = id`, by function extensionality. Stating them pointwise saves the [`ext`](../../../Glossary/ext.md) step.
- **Which identity gives which property.** `pinv_left.injective` uses the left-inverse identity to prove that **`p`** is injective. `pinv_right.surjective` uses the right-inverse identity to prove that **`p`** is surjective. In both cases the property belongs to `p`, the second argument, not to `pinv`.
- The angle brackets `⟨_, _⟩` put the two halves together into `Bijective p`. The general version of this argument, written out by hand, is in [Module 7 - Bijectivity and inverses example](Module%207%20-%20Bijectivity%20and%20inverses%20example.md).

## Back-link

- [Module 7 – Functions](../07-Functions.md)
