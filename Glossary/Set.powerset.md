# `Set.powerset` (`𝒫`)

**Meaning.** For `A : Set α`, the power set `𝒫 A : Set (Set α)` is the set of all subsets of `A`. Its elements are sets. The named lemma `Set.mem_powerset_iff : S ∈ 𝒫 A ↔ S ⊆ A` states its membership rule. The symbol `𝒫` is typed `\powerset`.

**Example.**
```lean
import Mathlib

example : (∅ : Set ℕ) ∈ 𝒫 ({0, 1} : Set ℕ) := by
  rw [Set.mem_powerset_iff]
  intro x hx
  contradiction
```

**Use it when** a statement says a set belongs to a power set. Rewrite with `Set.mem_powerset_iff` to get a subset claim, then prove it with [`intro`](intro.md) `x hx`. The same rewrite works on a hypothesis: from `h : S ∈ 𝒫 A`, `rw [Set.mem_powerset_iff] at h` gives `h : S ⊆ A`.

**Reference.** [Mathlib documentation — `Set.powerset`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Defs.html#Set.powerset) and [`Set.mem_powerset_iff`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Basic.html#Set.mem_powerset_iff)
