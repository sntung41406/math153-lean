# Module 1 - Linear and nonlinear automation

## Statement

Compare two nonnegativity steps: one that becomes linear once a square fact is supplied, so `linarith` suffices, and one that genuinely needs `nlinarith` because the proof multiplies two hypotheses together.

## Code

```lean
import Mathlib

example {m n : ℤ} (h : m ^ 2 + n ≤ 2) : n ≤ 2 := by
  calc
    n ≤ m ^ 2 + n := by linarith [sq_nonneg m]
    _ ≤ 2         := by linarith

example {x y : ℝ} (hx : 0 ≤ x) (hy : 0 ≤ y) : 0 ≤ x * y := by
  nlinarith
```

## Walkthrough

- The mathematical idea of the first example: since $m^2 \ge 0$, adding $m^2$ to $n$ can only make it bigger (or equal), so $n \le m^2 + n \le 2$.
- `sq_nonneg m : 0 ≤ m ^ 2` is the Mathlib lemma stating any square is nonnegative. Once it is supplied, `m ^ 2` only ever appears as a single opaque term, so the step is linear and `linarith [sq_nonneg m]` closes it. The second step substitutes `h`, which is also linear.
- The second example is genuinely nonlinear: $0 \le xy$ follows by multiplying the two facts $0 \le x$ and $0 \le y$. `linarith` cannot do this, since it never multiplies hypotheses together. `nlinarith` also tries products of pairs of hypotheses, and this product is exactly what the proof needs.

## Back-link

- [Module 1 – Proofs by Calculation](../01-Proofs%20by%20Calculation.md)
