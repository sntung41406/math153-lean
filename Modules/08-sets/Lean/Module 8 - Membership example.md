# Module 8 - Membership example

## Statement

Prove $1 \in \{n \in \mathbb{Z} \mid n \le 3\}$ and $10 \notin \{n \in \mathbb{N} \mid n \text{ is odd}\}$.

## Code

```lean
import Mathlib

example : 1 ∈ {n : ℤ | n ≤ 3} := by
  show (1 : ℤ) ≤ 3
  norm_num

example : 10 ∉ {n : ℕ | Odd n} := by
  show ¬ Odd 10
  rw [Nat.odd_iff]
  norm_num
```

## Walkthrough

- Membership in a [set-builder set](../../../Glossary/Set.md) is *definitionally* the underlying proposition: `1 ∈ {n : ℤ | n ≤ 3}` unfolds to `(1:ℤ) ≤ 3`. [`show`](../../../Glossary/show.md) restates the goal in that unfolded form, and [`norm_num`](../../../Glossary/norm_num.md) verifies it.
- Likewise `10 ∉ {n : ℕ | Odd n}` unfolds to `¬` [`Odd 10`](../../../Glossary/Odd.md). [`Nat.odd_iff`](../../../Glossary/Nat.odd_iff.md) `: Odd n ↔ n % 2 = 1` [rewrites](../../../Glossary/rw.md) the goal to `¬ (10 % 2 = 1)`, which `norm_num` computes and closes (`10 % 2 = 0`).

## Back-link

- [Module 8 – Sets](../08-Sets.md)
