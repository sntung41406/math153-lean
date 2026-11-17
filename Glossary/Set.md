# `Set`

**Meaning.** For a type `α`, `Set α` is the type of sets of elements of `α`. The set-builder notation `{x : α | P x}` is the set of all `x` for which the proposition `P x` holds, and membership in it *is* that proposition: `a ∈ {x | P x}` means `P a`. Mathlib states this rule as `Set.mem_ofPred_eq`. A subset claim `A ⊆ B` means `∀ x, x ∈ A → x ∈ B`. The universal set `Set.univ` contains every element of `α`, and `Set.mem_univ x : x ∈ Set.univ`.

**Example.**
```lean
import Mathlib

example : (2 : ℕ) ∈ {n : ℕ | n < 5} := by
  show 2 < 5
  norm_num

example : {n : ℕ | n < 3} ⊆ {n : ℕ | n < 5} := by
  intro n hn
  rw [Set.mem_ofPred_eq] at hn ⊢
  omega
```

**Use it when** a statement is about a collection of elements described by a property. To prove `a ∈ {x | P x}`, prove `P a`, using [`show`](show.md) to restate the goal if that helps. To prove `A ⊆ B`, start with [`intro`](intro.md) `x hx`. To prove `A = B`, start with [`ext`](ext.md). For the operations on sets, see [set operations](set-operations.md).

**Reference.** [Mathlib documentation — `Set`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Defs.html#Set) and [`Set.mem_ofPred_eq`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Operations.html#Set.mem_ofPred_eq)
