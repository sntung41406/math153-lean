# Module 7 - Injective example

## Statement

Prove $q(x) = x+3$ is injective on $\mathbb{R}$.

## Code

```lean
import Mathlib

open Function

def q (x : ℝ) : ℝ := x + 3

example : Injective q := by
  intro x1 x2 h
  dsimp only [q] at h
  linarith
```

## Walkthrough

- [`Function.Injective`](../../../Glossary/Function.Injective.md) `q` unfolds to `∀ x1 x2, q x1 = q x2 → x1 = x2`, so `intro x1 x2 h` introduces two arbitrary inputs and the hypothesis `h : q x1 = q x2`.
- `dsimp only [q] at h` unfolds `q`'s definition inside `h`, turning it into `x1 + 3 = x2 + 3`.
- `linarith` closes the goal `x1 = x2` directly from that linear equation.

## Back-link

- [Module 7 – Functions](../07-Functions.md)
