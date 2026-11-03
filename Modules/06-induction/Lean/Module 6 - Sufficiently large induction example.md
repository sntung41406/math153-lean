# Module 6 - Sufficiently large induction example

## Statement

Prove that $2^n\ge n^2$ for all sufficiently large natural numbers $n$: there is a natural number $N$ such that $2^n\ge n^2$ for every $n\ge N$.

## Code

```lean
import Mathlib

example : ∃ N : ℕ, ∀ n ≥ N, 2 ^ n ≥ n ^ 2 := by
  use 4
  intro n hn
  induction n, hn using Nat.le_induction with
  | base => norm_num
  | succ k hk IH =>
    calc 2 ^ (k + 1) = 2 * 2 ^ k := by ring
      _ ≥ 2 * k ^ 2 := by gcongr
      _ = k ^ 2 + k * k := by ring
      _ ≥ k ^ 2 + 4 * k := by gcongr
      _ = k ^ 2 + 2 * k + 2 * k := by ring
      _ ≥ k ^ 2 + 2 * k + 1 := by omega
      _ = (k + 1) ^ 2 := by ring
```

## Walkthrough

- The statement uses the same [`∃`](../../../Glossary/exists.md) and [`∀`](../../../Glossary/forall.md) form as [Module 4 - Sufficiently large example](../../04-proofs-with-structure-ii/Lean/Module%204%20-%20Sufficiently%20large%20example.md).
- [`use`](../../../Glossary/use.md) `4` chooses the threshold. The claim is false at $n=3$, so $4$ is the smallest threshold that works. [`intro`](../../../Glossary/intro.md) `n hn` then gives `hn : n ≥ 4`.
- [`Nat.le_induction`](../../../Glossary/Nat.le_induction.md) starts the induction at $4$. The `base` case is $2^4\ge4^2$, which [`norm_num`](../../../Glossary/norm_num.md) checks.
- In the `succ` case we have `hk : 4 ≤ k` and `IH : 2 ^ k ≥ k ^ 2`. The first [`gcongr`](../../../Glossary/gcongr.md) step uses `IH`, and the second uses `hk` to compare `k * k` with `4 * k`.
- The [`omega`](../../../Glossary/omega.md) step needs only $2k\ge1$. It treats `k ^ 2` as a single unknown number.

## Back-link

- [Module 6 – Induction](../06-Induction.md)
