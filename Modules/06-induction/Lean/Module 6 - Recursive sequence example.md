# Module 6 - Recursive sequence example

## Statement

Given $A_0 = 0$ and $A_{n+1} = A_n + (n+1)$, prove $A_n = \dfrac{n(n+1)}{2}$ for every $n$.

## Code

```lean
import Mathlib

def A : ℕ → ℚ
  | 0 => 0
  | n + 1 => A n + (n + 1)

example (n : ℕ) : A n = n * (n + 1) / 2 := by
  induction n with
  | zero =>
    calc A 0 = 0 := by rw [A]
      _ = (0 : ℚ) * (0 + 1) / 2 := by norm_num
  | succ k IH =>
    push_cast
    calc A (k + 1) = A k + (k + 1) := by rw [A]
      _ = k * (k + 1) / 2 + (k + 1) := by rw [IH]
      _ = (k + 1) * (k + 1 + 1) / 2 := by ring
```

## Walkthrough

- [`def`](../../../Glossary/def.md) `A` is a [recursive definition by pattern matching](../../../Glossary/pattern-matching.md), matching the sequence on paper: `A 0 = 0` and `A (n + 1) = A n + (n + 1)`.
- [`induction`](../../../Glossary/induction.md) `n with | zero => ... | succ k IH => ...` mirrors the definition: the base case handles `A 0`, and the inductive step handles `A (k + 1)` using `IH : A k = k * (k + 1) / 2`.
- In the inductive step, [`push_cast`](../../../Glossary/push_cast.md) runs first. The goal mixes a natural number `k` (the index) with rational arithmetic. The tactic rewrites the cast `↑(k + 1) : ℚ` as `(k : ℚ) + 1`, so that [`ring`](../../../Glossary/ring.md) can see both sides as the same polynomial.
- In each branch, [`rw`](../../../Glossary/rw.md) `[A]` unfolds one layer of the definition, turning `A (k + 1)` into `A k + (k + 1)`. Then `rw [IH]` substitutes the inductive hypothesis, and `ring` closes the identity. Over `ℚ`, division behaves like ordinary field division.

## Back-link

- [Module 6 – Induction](../06-Induction.md)
