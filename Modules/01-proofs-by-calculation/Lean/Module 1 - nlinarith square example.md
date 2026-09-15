# Module 1 - nlinarith square example

## Statement

Use `nlinarith` with an explicit nonnegativity fact to discharge a step that holds simply because a square is being added.

## Code

```lean
import Mathlib

example {m n : ℤ} (h : m ^ 2 + n ≤ 2) : n ≤ 2 := by
  calc
    n ≤ m ^ 2 + n := by nlinarith [sq_nonneg m]
    _ ≤ 2         := by linarith
```

## Walkthrough

- The mathematical idea: since $m^2 \ge 0$, adding $m^2$ to $n$ can only make it bigger (or equal), so $n \le m^2 + n$.
- `sq_nonneg m : 0 ≤ m ^ 2` is the Mathlib lemma stating any square is nonnegative. Passing it to `nlinarith [sq_nonneg m]` gives the tactic exactly the extra fact it needs to close the step — `nlinarith` then combines it with ordinary linear reasoning.
- The second step is purely linear (substituting `h`), so plain `linarith` suffices there.

## Back-link

- [Module 1 – Proofs by Calculation](../01-Proofs%20by%20Calculation.md)
