# Module 2 - Same-exponent cancellation example

## Statement

Name the result of a `calc` chain with `have`, then cancel a shared exponent from an inequality once the sign condition is known.

## Code

```lean
import Mathlib

example {a b : ℝ} (h1 : a ^ 2 = b ^ 2 + 1) (h2 : a ≥ 0) : a ≥ 1 := by
  have h3 : a ^ 2 ≥ 1 ^ 2 := by
    calc
      a ^ 2 = b ^ 2 + 1 := h1
      _ ≥ 1             := by nlinarith [sq_nonneg b]
      _ = 1 ^ 2         := by ring
  exact le_of_pow_le_pow_left₀ (by norm_num) h2 h3
```

## Walkthrough

- `have h3 : a ^ 2 ≥ 1 ^ 2 := by calc ...` proves the intermediate fact with a whole `calc` chain, then stores the chain's result under the name `h3`. The chain is exactly the one-line calculation from the main note.
- [`le_of_pow_le_pow_left₀`](../../../Glossary/le_of_pow_le_pow_left%E2%82%80.md) `: n ≠ 0 → 0 ≤ b → a ^ n ≤ b ^ n → a ≤ b` cancels the exponent `n`. It takes three inputs: `(by norm_num)` proves `2 ≠ 0`; `h2` is the sign condition `0 ≤ a`; and `h3` is `1 ^ 2 ≤ a ^ 2` (the same fact as `a ^ 2 ≥ 1 ^ 2`, read right to left).
- `exact` closes the goal with that finished proof. It does the same job as writing a proof directly after `:=`, as in the step `a ^ 2 = b ^ 2 + 1 := h1` above.

## Back-link

- [Module 2 – Proofs with Structure](../02-Proofs%20with%20Structure.md)
