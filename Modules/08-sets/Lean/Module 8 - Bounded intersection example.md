# Module 8 - Bounded intersection example

## Statement

Prove $\{n \in \mathbb{N} \mid 4 \le n\} \cap \{n \in \mathbb{N} \mid n \le 6\} = \{4, 5, 6\}$.

## Code

```lean
import Mathlib

example : {n : ℕ | 4 ≤ n} ∩ {n : ℕ | n ≤ 6} = {4, 5, 6} := by
  ext n
  simp only [Set.mem_inter_iff, Set.mem_ofPred_eq, Set.mem_insert_iff,
    Set.mem_singleton_iff]
  omega
```

## Walkthrough

- [`ext`](../../../Glossary/ext.md) `n` reduces the set equality to an iff for an arbitrary natural number `n`: `n ∈ {n | 4 ≤ n} ∩ {n | n ≤ 6} ↔ n ∈ {4, 5, 6}`.
- The [`simp only`](../../../Glossary/simp.md) call unpacks each membership into logic, one lemma per step:
  - [`Set.mem_inter_iff`](../../../Glossary/set-operations.md) turns membership in `A ∩ B` into `n ∈ A ∧ n ∈ B`.
  - [`Set.mem_ofPred_eq`](../../../Glossary/Set.md) unfolds set-builder membership, so `n ∈ {n | 4 ≤ n}` becomes `4 ≤ n`.
  - [`Set.mem_insert_iff`](../../../Glossary/Set.insert-singleton.md) and `Set.mem_singleton_iff` turn `n ∈ {4, 5, 6}` into `n = 4 ∨ n = 5 ∨ n = 6`.
- The goal is now `4 ≤ n ∧ n ≤ 6 ↔ n = 4 ∨ n = 5 ∨ n = 6`, a statement about natural numbers only. [`omega`](../../../Glossary/omega.md) proves it.

## Back-link

- [Module 8 – Sets](../08-Sets.md)
