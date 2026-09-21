# Module 2 - Or hypothesis case split

## Statement

Use `obtain` to case-split on an "or" hypothesis, proving the goal separately in each case.

## Code

```lean
import Mathlib

example {x y : ℝ} (h : x = 1 ∨ y = -1) : x * y + x = y + 1 := by
  obtain hx | hy := h
  calc
    x * y + x = 1 * y + 1 := by rw [hx]
    _ = y + 1             := by ring
  calc
    x * y + x = x * -1 + x := by rw [hy]
    _ = -1 + 1             := by ring
    _ = y + 1              := by rw [hy]
```

## Walkthrough

- [`obtain`](../../../Glossary/obtain.md) `hx | hy := h` splits the [`∨`](../../../Glossary/or.md) ("or") hypothesis `h : x = 1 ∨ y = -1` into two separate goals: one where `hx : x = 1` is available, another where `hy : y = -1` is available. The goal to prove (`x * y + x = y + 1`) is the same in both.
- The two `calc` blocks that follow prove the (identical) goal in each of the two cases, each using its own hypothesis.
- Lean tackles the first case fully, then moves to the second — both must be closed for the proof to be complete.

## Back-link

- [Module 2 – Proofs with Structure](../02-Proofs%20with%20Structure.md)
