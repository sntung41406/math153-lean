# Module 4 - Sufficiently large example

## Statement

Prove that $n^3\ge 4n^2+7$ for all sufficiently large integers $n$: there is an integer $N$ such that $n^3\ge 4n^2+7$ for every $n\ge N$.

## Code

```lean
import Mathlib

example : ∃ N : ℤ, ∀ n ≥ N, n ^ 3 ≥ 4 * n ^ 2 + 7 := by
  use 5
  intro n hn
  calc
    n ^ 3 = n * n ^ 2 := by ring
    _ ≥ 5 * n ^ 2 := by gcongr
    _ = 4 * n ^ 2 + n ^ 2 := by ring
    _ ≥ 4 * n ^ 2 + 5 ^ 2 := by gcongr
    _ ≥ 4 * n ^ 2 + 7 := by norm_num
```

## Walkthrough

- "For all sufficiently large $n$" is a short way to say `∃ N, ∀ n ≥ N, …`: there is a threshold `N`, and the claim holds from `N` on. The claim may fail for small `n`. Here it fails at $n=4$, since $64<71$.
- `∀ n ≥ N, P n` is itself short for `∀ n, n ≥ N → P n`: a [`∀`](../../../Glossary/forall.md) followed by an [`→`](../../../Glossary/implies.md).
- `use 5` chooses the threshold. The threshold is a witness, so it must be one fixed number, chosen before `n` appears.
- `intro n hn` introduces two things at once: an arbitrary integer `n`, and the assumption `hn : n ≥ 5`. The goal becomes `n ^ 3 ≥ 4 * n ^ 2 + 7`.
- The `calc` chain uses `hn` twice. In `n * n ^ 2 ≥ 5 * n ^ 2`, [`gcongr`](../../../Glossary/gcongr.md) compares the two sides factor by factor and needs only `n ≥ 5`, which it finds in the context. In `4 * n ^ 2 + n ^ 2 ≥ 4 * n ^ 2 + 5 ^ 2`, it needs `n ^ 2 ≥ 5 ^ 2`, which again follows from `n ≥ 5`.
- The last step drops the extra amount: $5^2=25\ge 7$.
- How was `5` found? On paper, try $n^3 = n\cdot n^2 \ge N n^2$ and ask how large `N` must be so that the extra $n^2$ pays for the $7$. Any larger threshold, such as `10`, also works.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
