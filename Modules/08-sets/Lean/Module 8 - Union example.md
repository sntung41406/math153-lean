# Module 8 - Union example

## Statement

Prove $\{x \in \mathbb{R} \mid -1 < x\} \cup \{x \in \mathbb{R} \mid x < 1\} = \mathbb{R}$, the universal set of real numbers.

## Code

```lean
import Mathlib

example : {x : ℝ | -1 < x} ∪ {x : ℝ | x < 1} = Set.univ := by
  ext t
  constructor
  · intro _
    exact Set.mem_univ t
  · intro _
    simp only [Set.mem_union, Set.mem_ofPred_eq]
    obtain h | h := lt_or_ge t 0
    · right
      linarith
    · left
      linarith
```

## Walkthrough

- `Set.univ` is the universal set: every real number is a member of [`Set.univ : Set ℝ`](../../../Glossary/Set.md).
- [`ext`](../../../Glossary/ext.md) `t` reduces the set equality to an iff for an arbitrary real `t`: `t ∈ {x | -1 < x} ∪ {x | x < 1} ↔ t ∈ Set.univ`. [`constructor`](../../../Glossary/constructor.md) splits it into two directions.
- **Left to right.** The goal is `t ∈ Set.univ`, which is always true. `Set.mem_univ t` proves it, so the hypothesis is not needed. The name `_` tells Lean that we will not use it.
- **Right to left.** This is the real content: every `t` is in the union. `simp only [Set.mem_union, Set.mem_ofPred_eq]` rewrites the goal from [set-membership form](../../../Glossary/set-operations.md) into its logical form: `-1 < t ∨ t < 1`.
- [`obtain`](../../../Glossary/obtain.md) `h | h :=` [`lt_or_ge`](../../../Glossary/lt_or_ge.md) `t 0` splits into the two cases `t < 0` and `t ≥ 0`. Together these cover every real number.
- In the first case, [`right`](../../../Glossary/left-right.md) commits to proving `t < 1`, which follows from `t < 0` by [`linarith`](../../../Glossary/linarith.md). In the second case, `left` commits to proving `-1 < t`, which follows from `t ≥ 0`.

## Back-link

- [Module 8 – Sets](../08-Sets.md)
