# Module 4 - Universal statement example

## Statement

Prove a "for all" goal by introducing an arbitrary element with `intro`.

## Code

```lean
import Mathlib

example : ∃ b : ℝ, ∀ x : ℝ, b ≤ x ^ 2 - 2 * x := by
  use -1
  intro x
  nlinarith [sq_nonneg (x - 1)]
```

## Walkthrough

- After `use -1`, the remaining goal is `∀ x : ℝ, -1 ≤ x ^ 2 - 2 * x` — a "for all" statement ([`∀`](../../../Glossary/forall.md)).
- [`intro`](../../../Glossary/intro.md) `x` introduces a single, arbitrary real number `x` into the context. Crucially, nothing is assumed about `x` beyond it being real, so whatever we prove about it holds for every real number.
- `nlinarith [sq_nonneg (x - 1)]` closes the inequality using the fact $(x-1)^2\ge 0$, which expands to exactly $x^2-2x\ge -1$.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
