# Module 2 - Antisymmetry example

## Statement

Use the `le_antisymm` lemma to split an equality goal into two inequality goals.

## Code

```lean
import Mathlib

example {a b : ℝ} (h1 : a ^ 2 + b ^ 2 = 0) : a ^ 2 = 0 := by
  apply le_antisymm
  calc
    a ^ 2 ≤ a ^ 2 + b ^ 2 := by nlinarith [sq_nonneg b]
    _ = 0                 := h1
  positivity
```

## Walkthrough

- [`le_antisymm`](../../../Glossary/le_antisymm.md) `: a ≤ b → b ≤ a → a = b` says two numbers each at most the other must be equal.
- `apply le_antisymm` replaces the single goal `a ^ 2 = 0` with **two** goals: `a ^ 2 ≤ 0` and `0 ≤ a ^ 2`.
- The first is proved by the `calc` block: `nlinarith [sq_nonneg b]` supplies the fact `0 ≤ b ^ 2` so the tactic can conclude `a ^ 2 ≤ a ^ 2 + b ^ 2`, then `h1` substitutes to `0`. The second, `0 ≤ a ^ 2`, is closed directly by [`positivity`](../../../Glossary/positivity.md), which recognizes from the *form* of the expression that any square is nonnegative. The step `_ = 0 := h1` needs no tactic at all: `h1` is already a proof of exactly that equation, so it is written directly after `:=`. This does the same job as the tactic [`exact`](../../../Glossary/exact.md) `h1`.
- Lean always works on the first remaining goal, so the code addresses them in order, one after another.

## Back-link

- [Module 2 – Proofs with Structure](../02-Proofs%20with%20Structure.md)
