# Module 2 - Factored or-goal example

## Statement

Factor a quadratic to get an "or" fact, case-split on it, and prove a different side of the "or" goal in each case.

## Code

```lean
import Mathlib

example {x : ℝ} (hx : x ^ 2 - 3 * x + 2 = 0) : x = 1 ∨ x = 2 := by
  have h1 : (x - 1) * (x - 2) = 0 := by
    calc
      (x - 1) * (x - 2) = x ^ 2 - 3 * x + 2 := by ring
      _ = 0                                 := by rw [hx]
  obtain h2 | h2 := eq_zero_or_eq_zero_of_mul_eq_zero h1
  · left
    linarith
  · right
    linarith
```

## Walkthrough

- `have h1 : (x - 1) * (x - 2) = 0 := by calc ...` names the factored form of the hypothesis.
- [`eq_zero_or_eq_zero_of_mul_eq_zero`](../../../Glossary/eq_zero_or_eq_zero_of_mul_eq_zero.md) `: a * b = 0 → a = 0 ∨ b = 0` states that a product is zero only when one of its factors is. Applied to `h1`, it gives the "or" fact `x - 1 = 0 ∨ x - 2 = 0`.
- `obtain h2 | h2 := ...` case-splits on that fact. The goal `x = 1 ∨ x = 2` is the same in both cases.
- In the first case, `h2 : x - 1 = 0`, so `left` chooses the goal `x = 1` and `linarith` proves it. In the second case, `h2 : x - 2 = 0`, so `right` chooses `x = 2`.
- Choosing `left` in *both* cases would fail in the second case: from `x - 2 = 0` alone, `x = 1` is false.

## Back-link

- [Module 2 – Proofs with Structure](../02-Proofs%20with%20Structure.md)
