# Module 6 - Simple induction example

## Statement

Prove $2^n \ge n+1$ for every natural number $n$.

## Code

```lean
import Mathlib

example (n : ℕ) : 2 ^ n ≥ n + 1 := by
  induction n with
  | zero => norm_num
  | succ k IH =>
    calc 2 ^ (k + 1) = 2 * 2 ^ k := by ring
      _ ≥ 2 * (k + 1) := by gcongr
      _ = (k + 1 + 1) + k := by ring
      _ ≥ k + 1 + 1 := by omega
```

## Walkthrough

- [`induction`](../../../Glossary/induction.md) `n with | zero => ... | succ k IH => ...` splits the goal into the base case (`n = 0`) and the inductive step (`n = k + 1`, with `IH : 2 ^ k ≥ k + 1` available as the inductive hypothesis).
- Base case: `2 ^ 0 ≥ 0 + 1` is `1 ≥ 1`, closed directly by [`norm_num`](../../../Glossary/norm_num.md).
- Inductive step: the [`calc`](../../../Glossary/calc.md) block rewrites `2 ^ (k + 1)` as `2 * 2 ^ k` with [`ring`](../../../Glossary/ring.md). Then [`gcongr`](../../../Glossary/gcongr.md) reduces `2 * 2 ^ k ≥ 2 * (k + 1)` to the subgoal `2 ^ k ≥ k + 1` and closes it with `IH` from the context.
- The last two lines rewrite `2 * (k + 1)` as `(k + 1 + 1) + k` and note that adding the nonnegative `k` can only increase the value, which [`omega`](../../../Glossary/omega.md) checks.

## Back-link

- [Module 6 – Induction](../06-Induction.md)
