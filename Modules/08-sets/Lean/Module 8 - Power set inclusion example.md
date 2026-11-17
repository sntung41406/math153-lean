# Module 8 - Power set inclusion example

## Statement

Prove that for all sets $A, B$, $\mathcal{P}(A) \cup \mathcal{P}(B) \subseteq \mathcal{P}(A \cup B)$. Then prove that the reverse inclusion fails for $A = \{0\}$ and $B = \{1\}$.

## Code

```lean
import Mathlib

example {α : Type*} (A B : Set α) : 𝒫 A ∪ 𝒫 B ⊆ 𝒫 (A ∪ B) := by
  intro S hS
  rw [Set.mem_powerset_iff]
  intro x hx
  obtain hA | hB := hS
  · rw [Set.mem_powerset_iff] at hA
    left
    exact hA hx
  · rw [Set.mem_powerset_iff] at hB
    right
    exact hB hx

example : ¬ 𝒫 ({0} ∪ {1} : Set ℕ) ⊆ 𝒫 {0} ∪ 𝒫 {1} := by
  intro h
  have h01 : ({0} ∪ {1} : Set ℕ) ∈ 𝒫 ({0} ∪ {1} : Set ℕ) := by
    rw [Set.mem_powerset_iff]
  obtain h0 | h1 := h h01
  · rw [Set.mem_powerset_iff] at h0
    have h10 : (1 : ℕ) ∈ ({0} : Set ℕ) := h0 (by simp)
    norm_num at h10
  · rw [Set.mem_powerset_iff] at h1
    have h01' : (0 : ℕ) ∈ ({1} : Set ℕ) := h1 (by simp)
    norm_num at h01'
```

## Walkthrough

`𝒫 A` is the [power set](../../../Glossary/Set.powerset.md) of `A`, and [`Set.mem_powerset_iff`](../../../Glossary/Set.powerset.md) says `S ∈ 𝒫 A ↔ S ⊆ A`. Both proofs rewrite with it to turn power-set membership into a subset claim.

**The inclusion.**

- [`intro`](../../../Glossary/intro.md) `S hS` takes a set `S` with `hS : S ∈ 𝒫 A ∪ 𝒫 B`. After [`rw`](../../../Glossary/rw.md) `[Set.mem_powerset_iff]`, the goal is `S ⊆ A ∪ B`, so `intro x hx` takes an element `x` with `hx : x ∈ S`.
- [`obtain`](../../../Glossary/obtain.md) `hA | hB := hS` splits the [union](../../../Glossary/set-operations.md) into its two cases.
- In the first case, rewriting `hA` gives `hA : S ⊆ A`. A subset claim is a function from membership to membership, so `hA hx : x ∈ A`. [`left`](../../../Glossary/left-right.md) chooses `x ∈ A` in the goal `x ∈ A ∨ x ∈ B`. The second case is the same, with `B` and `right`.

**The reverse inclusion fails.**

- `intro h` assumes the reverse inclusion, and leaves `False` to prove.
- [`have`](../../../Glossary/have.md) `h01` shows `{0} ∪ {1}` is in `𝒫 ({0} ∪ {1})`. After `rw [Set.mem_powerset_iff]`, the goal is `{0} ∪ {1} ⊆ {0} ∪ {1}`, which `rw` closes by itself: every set is a subset of itself.
- `h h01` puts `{0} ∪ {1}` into `𝒫 {0} ∪ 𝒫 {1}`, and `obtain h0 | h1` splits the two cases.
- In the first case, `h0 : {0} ∪ {1} ⊆ {0}`. Applying it to a proof that `1 ∈ {0} ∪ {1}` (found by [`simp`](../../../Glossary/simp.md)) gives `h10 : 1 ∈ {0}`, which says `1 = 0`. [`norm_num`](../../../Glossary/norm_num.md) `at h10` reduces it to `False`. The second case uses the element `0` in the same way.

## Back-link

- [Module 8 – Sets](../08-Sets.md)
