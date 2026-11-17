# Module 8 - Preimage laws example

## Statement

For any function $f : A \to B$ and sets $S, T$ of outputs, prove $f^{-1}(S \cup T) = f^{-1}(S) \cup f^{-1}(T)$ and $f^{-1}(S \cap T) = f^{-1}(S) \cap f^{-1}(T)$.

## Code

```lean
import Mathlib

example {α β : Type*} (f : α → β) (S T : Set β) :
    f ⁻¹' (S ∪ T) = f ⁻¹' S ∪ f ⁻¹' T := by
  ext x
  simp only [Set.mem_preimage, Set.mem_union]

example {α β : Type*} (f : α → β) (S T : Set β) :
    f ⁻¹' (S ∩ T) = f ⁻¹' S ∩ f ⁻¹' T := by
  ext x
  simp only [Set.mem_preimage, Set.mem_inter_iff]
```

## Walkthrough

- `f ⁻¹' S` is the [preimage](../../../Glossary/Set.image-preimage.md) of `S` under `f`. By definition, `x ∈ f ⁻¹' S` means `f x ∈ S`.
- [`ext`](../../../Glossary/ext.md) `x` reduces each set equality to an iff for an arbitrary input `x`.
- **Union.** [`simp only`](../../../Glossary/simp.md) rewrites with two membership rules. `Set.mem_preimage` turns each `x ∈ f ⁻¹' S` into `f x ∈ S`, and [`Set.mem_union`](../../../Glossary/set-operations.md) turns membership in a union into `∨`. Both sides become `f x ∈ S ∨ f x ∈ T`, so `simp only` closes the goal.
- **Intersection.** The same two steps, with `Set.mem_inter_iff` in place of `Set.mem_union`. Both sides become `f x ∈ S ∧ f x ∈ T`.
- The Lean proofs are as short as the hand proof: once each membership is unpacked, the two sides say exactly the same thing.

## Back-link

- [Module 8 – Sets](../08-Sets.md)
