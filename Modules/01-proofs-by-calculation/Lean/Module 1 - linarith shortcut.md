# Module 1 - linarith shortcut

## Statement

Use the `linarith` tactic to close linear equality/inequality goals in one step, skipping a full `calc` chain.

## Code

```lean
import Mathlib

example {a b : ℤ} (ha : a - 2 * b = 1) : a = 2 * b + 1 := by
  linarith

example {m n : ℝ} (h1 : m ≤ 8 - n) : 10 > m + n := by
  linarith

example {w : ℚ} (h1 : 3 * w + 1 = 4) : w = 1 := by
  linarith

-- linarith can't verify this one — it's genuinely nonlinear (x * x and y * y are
-- opaque atoms to linarith, even though x = y makes them obviously equal)
example {x y : ℝ} (h : x = y) : x * x = y * y := by
  rw [h]
```

## Walkthrough

- `linarith` automatically finds the linear combination of the hypotheses in context that proves the goal, without spelling out a `calc` chain.
- It handles addition, subtraction, and multiplication/division by *constants* — including the third example, which needs dividing by `3` to isolate `w`. This is stronger than it might look: a step that used to require writing out a full calculation by hand, `linarith` closes in one line.
- **Real scope limit**: `linarith` cannot relate two *variables* multiplied together (like `x * x` vs `y * y`) — that's genuinely nonlinear reasoning. The last example needs a different approach entirely (here, just `rw [h]` substitutes directly; `nlinarith` is the usual fallback for inequalities that need a bounded amount of nonlinear reasoning).

## Back-link

- [Module 1 – Proofs by Calculation](../01-Proofs%20by%20Calculation.md)
