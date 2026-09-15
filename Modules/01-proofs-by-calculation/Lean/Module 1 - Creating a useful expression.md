# Module 1 - Creating a useful expression

## Statement

Formalize the "add and subtract the same quantity" trick: the hypothesis only mentions `x + 4`, so the proof introduces that exact expression into the goal before substituting.

## Code

```lean
import Mathlib

example {x : ℤ} (h : x + 4 = 2) : x = -2 := by
  calc
    x = (x + 4) - 4 := by ring
    _ = 2 - 4        := by rw [h]
    _ = -2            := by norm_num
```

## Walkthrough

- The mathematical idea is the first line: `x = (x + 4) - 4`. Nothing in the hypothesis mentions `x` alone, so the proof manufactures an `x + 4` to substitute into.
- `by ring` (line 1): `ring` only checks that this rearrangement is algebraically valid — it does not discover it. Finding `(x + 4) - 4` as the useful form is the actual mathematical step, done on paper first.
- `by rw [h]` (line 2): now that `x + 4` appears in the goal, `h : x + 4 = 2` lets `rw` replace it with `2`.
- `by norm_num` (line 3): closes the remaining numeric fact `2 - 4 = -2`.

## Back-link

- [Module 1 – Proofs by Calculation](../01-Proofs%20by%20Calculation.md)
