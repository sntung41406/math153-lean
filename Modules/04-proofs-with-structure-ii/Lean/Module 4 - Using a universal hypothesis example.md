# Module 4 - Using a universal hypothesis example

## Statement

Use a "for all" hypothesis by applying it at a chosen value.

## Code

```lean
import Mathlib

example {a : ℝ} (h : ∀ x, a ≤ x ^ 2 - 2 * x) : a ≤ -1 :=
  calc
    a ≤ 1 ^ 2 - 2 * 1 := by apply h
    _ = -1              := by norm_num
```

## Walkthrough

- `h : ∀ x, a ≤ x ^ 2 - 2 * x` is a [`∀`](../../../Glossary/forall.md) hypothesis: it holds for *every* real `x` — in particular, for `x = 1`.
- [`apply`](../../../Glossary/apply.md) `h` in the first `calc` step instantiates `h` at the value needed to close that step (`x = 1`), giving `a ≤ 1 ^ 2 - 2 * 1`. You can also name the value yourself: `h 1` is a proof of `a ≤ 1 ^ 2 - 2 * 1`.
- Choosing the right value to instantiate at is the key judgment call — here, `x = 1` happens to make the right-hand side as small as possible, which is exactly the bound needed.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
