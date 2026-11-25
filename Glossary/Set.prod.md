# `Set.prod` (`×ˢ`)

**Meaning.** For `A : Set α` and `B : Set β`, the product `A ×ˢ B : Set (α × β)` is the set of pairs whose first coordinate is in `A` and whose second coordinate is in `B`. The two sets may come from different types. The named lemma `Set.mem_prod : p ∈ A ×ˢ B ↔ p.1 ∈ A ∧ p.2 ∈ B` states its membership rule. The symbol `×ˢ` is typed `\times\^s`.

**Example.**
```lean
import Mathlib

example : ((1 : ℕ), (5 : ℝ)) ∈ {n : ℕ | n < 2} ×ˢ {x : ℝ | 4 < x} := by
  rw [Set.mem_prod]
  constructor
  · show 1 < 2
    norm_num
  · show (4 : ℝ) < 5
    norm_num
```

**Use it when** a statement is about pairs taken from two sets. Rewrite with `Set.mem_prod`, then prove one membership for each coordinate. The coordinates `p.1` and `p.2` are the projections [`Prod.fst` and `Prod.snd`](Prod.fst-snd.md). Do not confuse `A ×ˢ B`, a *set* of pairs, with `α × β`, the *type* of all pairs.

**Reference.** [Mathlib documentation — `Set.prod`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Operations.html#Set.prod) and [`Set.mem_prod`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Operations.html#Set.mem_prod)
