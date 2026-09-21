# Module 2 - Existential goal example

## Statement

Use `use` to supply a witness, depending on `x`, for a "there exists" goal.

## Code

```lean
import Mathlib

example (x : ℝ) : ∃ y : ℝ, y > x := by
  use x + 1
  linarith
```

## Walkthrough

- The goal `∃ y : ℝ, y > x` uses [`∃`](../../../Glossary/exists.md) ("there exists"): it asks for some real number `y` that is larger than `x`.
- [`use`](../../../Glossary/use.md) `x + 1` commits to the witness `x + 1`, changing the goal to `x + 1 > x`.
- `linarith` closes that inequality.
- The witness is written in terms of `x`, because a different `x` needs a different `y`. Any witness that works is acceptable — `x + 2` would do just as well.

## Back-link

- [Module 2 – Proofs with Structure](../02-Proofs%20with%20Structure.md)
