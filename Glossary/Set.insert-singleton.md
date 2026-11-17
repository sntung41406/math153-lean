# Finite sets `{a, b, c}` and singletons `{a}`

**Meaning.** `{a}` is the singleton set whose only element is `a`, and `{a, b, c}` is the set with elements `a`, `b`, and `c`. Lean builds `{a, b, c}` by inserting `a` and `b` into the singleton `{c}`. Three named Mathlib lemmas give the membership rules:

- `Set.mem_singleton_iff : x ∈ {a} ↔ x = a`
- `Set.mem_insert_iff : x ∈ insert a s ↔ x = a ∨ x ∈ s`, so `x ∈ {a, b, c}` unfolds to `x = a ∨ x = b ∨ x = c`
- `Set.mem_singleton a : a ∈ {a}`

**Example.**
```lean
import Mathlib

example (n : ℕ) (h : n ∈ ({2, 3} : Set ℕ)) : n ≤ 3 := by
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at h
  omega
```

**Use it when** a set is given by listing its elements. Rewrite with `Set.mem_insert_iff` and `Set.mem_singleton_iff` to turn membership into a list of equations, and then finish with [`omega`](omega.md), [`norm_num`](norm_num.md), or a case split.

**Reference.** [Mathlib documentation — `Set.mem_singleton_iff`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Insert.html#Set.mem_singleton_iff), [`Set.mem_insert_iff`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Insert.html#Set.mem_insert_iff), and [`Set.mem_singleton`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Insert.html#Set.mem_singleton)
