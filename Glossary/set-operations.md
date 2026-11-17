# Set operations: `∪`, `∩`, `\`, `ᶜ`

**Meaning.** For sets `A B : Set α`, the union `A ∪ B`, the intersection `A ∩ B`, the difference `A \ B`, and the complement `Aᶜ` are again sets in `Set α`. For union, intersection, and complement, Mathlib states the membership rule as a named lemma that turns a set statement into logic:

| Lemma | Statement |
| :--- | :--- |
| `Set.mem_union` | `x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B` |
| `Set.mem_inter_iff` | `x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B` |
| `Set.mem_compl_iff` | `x ∈ Aᶜ ↔ x ∉ A` |

The difference follows the same pattern: `x ∈ A \ B` means `x ∈ A ∧ x ∉ B`.

**Example.**
```lean
import Mathlib

example {α : Type*} (A B : Set α) : A ∩ B ⊆ A ∪ B := by
  intro x hx
  rw [Set.mem_inter_iff] at hx
  rw [Set.mem_union]
  left
  exact hx.1
```

**Use it when** a goal or hypothesis is a membership in a combination of sets. Rewrite with these lemmas, using [`rw`](rw.md) or [`simp only`](simp.md), and then work with `∨`, `∧`, and `¬` as in any logic proof. Each rule also holds by definition, so [`rintro`](rintro.md) and [`obtain`](obtain.md) patterns can take a membership in `A ∪ B` or `A ∩ B` apart directly.

**Reference.** [Mathlib documentation — `Set.mem_union`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Basic.html#Set.mem_union), [`Set.mem_inter_iff`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Basic.html#Set.mem_inter_iff), and [`Set.mem_compl_iff`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Operations.html#Set.mem_compl_iff)
