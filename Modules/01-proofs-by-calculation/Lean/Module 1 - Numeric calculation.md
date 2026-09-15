# Module 1 - Numeric calculation

## Statement

Formalize the simplest possible `calc` chain: replace a known value, then close a purely numerical step with `norm_num`.

## Code

```lean
import Mathlib

example {total : ℤ} (h : total = 12) : total - 4 = 8 := by
  calc
    total - 4 = 12 - 4 := by rw [h]
    _         = 8      := by norm_num
```

## Walkthrough

- `calc` starts the chain at `total - 4` (the goal's left-hand side) and ends at `8` (its right-hand side). Each line must follow from the one above it.
- `by rw [h]` (line 1): `h : total = 12` lets `rw` replace `total` with `12` in the current step's goal. After the replacement both sides read `12 - 4`, so `rw` closes the step automatically.
- `by norm_num` (line 2): the step is now a fact about two literal numbers (`12 - 4 = 8`), which `norm_num` verifies directly.

## Back-link

- [Module 1 – Proofs by Calculation](../01-Proofs%20by%20Calculation.md)
