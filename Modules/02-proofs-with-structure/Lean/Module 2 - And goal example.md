# Module 2 - And goal example

## Statement

Use `constructor` to split an "and" goal into two separate goals, and prove each in turn.

## Code

```lean
import Mathlib

example {a b : ℝ} (h1 : a - 5 * b = 4) (h2 : b + 2 = 3) : a = 9 ∧ b = 1 := by
  constructor
  · calc
      a = 4 + 5 * b := by linarith
      _ = -6 + 5 * (b + 2) := by ring
      _ = -6 + 5 * 3       := by rw [h2]
      _ = 9                := by ring
  · linarith
```

## Walkthrough

- The goal `a = 9 ∧ b = 1` has two parts. [`constructor`](../../../Glossary/constructor.md) splits it into two separate goals: `a = 9` and `b = 1`.
- As in the [manufactured or-statement example](Module%202%20-%20Manufactured%20or-statement%20example.md), each `·` (focusing dot) marks the start of the proof for each goal in turn — the first block proves `a = 9` (with `linarith` deriving the first calc step from `h1`), the second proves `b = 1` directly from `h2` via `linarith`.
- Both goals must be closed for the overall "and" statement to count as proved.

## Back-link

- [Module 2 – Proofs with Structure](../02-Proofs%20with%20Structure.md)
