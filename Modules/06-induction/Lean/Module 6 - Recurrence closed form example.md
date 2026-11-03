# Module 6 - Recurrence closed form example

## Statement

Given $x_0=5$ and $x_{n+1}=2x_n-1$, prove $x_n=2^{n+2}+1$ for every $n$.

## Code

```lean
import Mathlib

def x : ℕ → ℤ
  | 0 => 5
  | n + 1 => 2 * x n - 1

example (n : ℕ) : x n = 2 ^ (n + 2) + 1 := by
  induction n with
  | zero =>
    rw [x]
    norm_num
  | succ k IH =>
    calc x (k + 1) = 2 * x k - 1 := by rw [x]
      _ = 2 * (2 ^ (k + 2) + 1) - 1 := by rw [IH]
      _ = 2 ^ ((k + 1) + 2) + 1 := by ring
```

## Walkthrough

- `x` is a [recursive definition by pattern matching](../../../Glossary/pattern-matching.md). It has one case for the first term and one for the recursive rule.
- The formula is the conjecture from the first terms $5,9,17,33$. The [`induction`](../../../Glossary/induction.md) is what proves it.
- Base case: [`rw`](../../../Glossary/rw.md) `[x]` replaces `x 0` by `5`, and [`norm_num`](../../../Glossary/norm_num.md) checks $5=2^{0+2}+1$.
- Inductive step: the three lines of the [`calc`](../../../Glossary/calc.md) chain are the three parts of the proof. `rw [x]` applies the recursive rule. `rw [IH]` uses the hypothesis `IH : x k = 2 ^ (k + 2) + 1`. [`ring`](../../../Glossary/ring.md) does the algebra.

## Back-link

- [Module 6 – Induction](../06-Induction.md)
