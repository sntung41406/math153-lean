# Module 8 - Distributive law example

## Statement

Prove that for all sets $A, B, C$, $A \cap (B \cup C) = (A \cap B) \cup (A \cap C)$.

## Code

```lean
import Mathlib

example {α : Type*} (A B C : Set α) : A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  ext x
  simp only [Set.mem_inter_iff, Set.mem_union]
  constructor
  · rintro ⟨hA, hB | hC⟩
    · left
      exact ⟨hA, hB⟩
    · right
      exact ⟨hA, hC⟩
  · rintro (⟨hA, hB⟩ | ⟨hA, hC⟩)
    · constructor
      · exact hA
      · left
        exact hB
    · constructor
      · exact hA
      · right
        exact hC
```

## Walkthrough

- `{α : Type*}` and `(A B C : Set α)` make the statement hold for any three [sets](../../../Glossary/Set.md) from the same type `α`.
- [`ext`](../../../Glossary/ext.md) `x` reduces the set equality to an iff for an arbitrary `x`. [`simp only`](../../../Glossary/simp.md) `[Set.mem_inter_iff, Set.mem_union]` rewrites each [membership](../../../Glossary/set-operations.md) into logic, leaving `x ∈ A ∧ (x ∈ B ∨ x ∈ C) ↔ (x ∈ A ∧ x ∈ B) ∨ (x ∈ A ∧ x ∈ C)`.
- [`constructor`](../../../Glossary/constructor.md) splits the iff into its two directions.
- **Left to right.** [`rintro`](../../../Glossary/rintro.md) `⟨hA, hB | hC⟩` takes the `∧` apart and splits the `∨` in one step. In the case `hB : x ∈ B`, [`left`](../../../Glossary/left-right.md) chooses `x ∈ A ∧ x ∈ B`, and `⟨hA, hB⟩` builds it from its two parts. The case `hC : x ∈ C` uses `right` in the same way.
- **Right to left.** `rintro (⟨hA, hB⟩ | ⟨hA, hC⟩)` splits the `∨` first and then takes each `∧` apart. In each case, `constructor` splits the goal `x ∈ A ∧ (x ∈ B ∨ x ∈ C)`: the first part is `hA`, and the second part chooses the correct side of the `∨`.
- The two directions follow the hand proof line by line. This is the set version of the logical law $P \wedge (Q \vee R) \iff (P \wedge Q) \vee (P \wedge R)$.

## Back-link

- [Module 8 – Sets](../08-Sets.md)
