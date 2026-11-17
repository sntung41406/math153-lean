# Module 8 - Complement example

## Statement

Prove $\{n \in \mathbb{Z} \mid n \text{ is even}\}^c = \{n \in \mathbb{Z} \mid n \text{ is odd}\}$.

## Code

```lean
import Mathlib

example : {n : ℤ | Even n}ᶜ = {n : ℤ | Odd n} := by
  ext n
  simp only [Set.mem_compl_iff, Set.mem_ofPred_eq, Int.not_even_iff_odd]
```

## Walkthrough

- [`ext`](../../../Glossary/ext.md) `n` reduces the set equality to `n ∈ {n | Even n}ᶜ ↔ n ∈ {n | Odd n}`.
- [`Set.mem_compl_iff`](../../../Glossary/set-operations.md) rewrites `n ∈ Aᶜ` to `n ∉ A`, and [`Set.mem_ofPred_eq`](../../../Glossary/Set.md) unfolds set-builder membership, leaving `¬ Even n ↔ Odd n`.
- [`Int.not_even_iff_odd`](../../../Glossary/Int.not_even_iff_odd.md) is exactly that fact for integers, so [`simp`](../../../Glossary/simp.md) closes the goal by rewriting with it.

## Back-link

- [Module 8 – Sets](../08-Sets.md)
