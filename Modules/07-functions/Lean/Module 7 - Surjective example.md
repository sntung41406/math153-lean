# Module 7 - Surjective example

## Statement

Prove $s(a) = 3a+2$ is surjective on $\mathbb{Q}$.

## Code

```lean
import Mathlib

open Function

def s (a : ℚ) : ℚ := 3 * a + 2

example : Surjective s := by
  intro y
  use (y - 2) / 3
  dsimp only [s]
  ring
```

## Walkthrough

- [`Function.Surjective`](../../../Glossary/Function.Surjective.md) `s` unfolds to `∀ y, ∃ x, s x = y`, so `intro y` fixes an arbitrary target `y` and leaves the goal `∃ x, s x = y`.
- `use (y - 2) / 3` commits to that value as the witness, reducing the goal to `s ((y - 2) / 3) = y`.
- `dsimp only [s]` unfolds `s`'s definition to `3 * ((y - 2) / 3) + 2 = y`, and `ring` verifies the algebraic identity.

## Back-link

- [Module 7 – Functions](../07-Functions.md)
