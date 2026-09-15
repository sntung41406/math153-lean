# Module 1 - Order-preserving step

## Statement

Formalize the core order-preservation rule — adding the same quantity to both sides of `≤` preserves it — by name, without reaching for `linarith`.

## Code

```lean
import Mathlib

example {x : ℤ} (h : x ≤ 2) : x + 3 ≤ 5 := by
  calc
    x + 3 ≤ 2 + 3 := add_le_add_left h 3
    _     = 5     := by norm_num
```

## Walkthrough

- `add_le_add_left h 3` is the Mathlib lemma for exactly the rule stated on paper: from `h : x ≤ 2` it produces `x + 3 ≤ 2 + 3` by adding `3` to both sides. Naming the lemma keeps this step formal without invoking automation.
- `by norm_num` closes the remaining numeric equality `2 + 3 = 5`; `calc` freely chains a `≤` step with a following `=` step.

## Common pitfalls

- `add_le_add_left` only covers adding the same quantity to both sides. A step that also multiplies by a possibly-negative number needs a different lemma (or, once introduced, `linarith`/`nlinarith`).

## Back-link

- [Module 1 – Proofs by Calculation](../01-Proofs%20by%20Calculation.md)
