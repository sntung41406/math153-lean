# Module 6 - Induction from a starting point example

## Statement

Prove $3^n \ge 2^n + 5$ for every $n \ge 2$.

## Code

```lean
import Mathlib

example {n : ℕ} (hn : 2 ≤ n) : (3 : ℤ) ^ n ≥ 2 ^ n + 5 := by
  induction n, hn using Nat.le_induction with
  | base => norm_num
  | succ k hk IH =>
    have h3 : (3 : ℤ) ^ (k + 1) = 3 * 3 ^ k := by ring
    have h2 : (2 : ℤ) ^ (k + 1) = 2 * 2 ^ k := by ring
    have hpos : (0 : ℤ) ≤ 2 ^ k := by positivity
    linarith [IH, h3, h2, hpos]
```

## Walkthrough

- `induction n, hn using` [`Nat.le_induction`](../../../Glossary/Nat.le_induction.md) `with | base => ... | succ k hk IH => ...` is induction from a starting point. It starts at the bound from `hn : 2 ≤ n`, not at `0`. The `base` case proves the claim at `n = 2`. The `succ` case gets `hk : 2 ≤ k` and `IH : (3 : ℤ) ^ k ≥ 2 ^ k + 5`, and must prove the claim at `k + 1`.
- Base case: `(3 : ℤ) ^ 2 ≥ 2 ^ 2 + 5` is `9 ≥ 9`, which [`norm_num`](../../../Glossary/norm_num.md) evaluates directly.
- Inductive step: `h3` and `h2` rewrite the `k + 1` powers as `3` (resp. `2`) times the `k`-th power, and `hpos` records that `2 ^ k` is nonnegative ([`positivity`](../../../Glossary/positivity.md)).
- [`linarith`](../../../Glossary/linarith.md) finds the linear combination. Scaling `IH` by $3$ gives $3\cdot3^k\ge3\cdot2^k+15$, which is at least the target $2\cdot2^k+5$ once $2^k\ge0$ is known.

## Back-link

- [Module 6 – Induction](../06-Induction.md)
