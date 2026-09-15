# Module 1 - Guided calculation practice

## Statement

Combine creating a useful expression, forward rewriting, and numeric calculation in one chain: from `r + 2 * s = -1` and `s = 3`, conclude `r = -7`.

## Code

```lean
import Mathlib

example {r s : ℤ} (h1 : r + 2 * s = -1) (h2 : s = 3) : r = -7 := by
  calc
    r = (r + 2 * s) - 2 * s := by ring
    _ = -1 - 2 * s          := by rw [h1]
    _ = -1 - 2 * 3          := by rw [h2]
    _ = -7                  := by norm_num
```

## Walkthrough

- `by ring` (line 1): as in the `x + 4 = 2` example, the useful expression `(r + 2 * s) - 2 * s` is chosen first on paper because it contains `r + 2 * s`, the exact left-hand side of `h1`; `ring` just confirms it equals `r`.
- `by rw [h1]` (line 2): substitutes `r + 2 * s` with `-1`.
- `by rw [h2]` (line 3): substitutes `s` with `3`.
- `by norm_num` (line 4): closes the purely numeric fact `-1 - 2 * 3 = -7`.

This is the completed version of the chain you built in class.

## Back-link

- [Module 1 – Proofs by Calculation](../01-Proofs%20by%20Calculation.md)
