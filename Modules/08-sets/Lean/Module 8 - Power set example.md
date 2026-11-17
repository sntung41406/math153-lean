# Module 8 - Power set example

## Statement

Prove $\{0\} \in \mathcal{P}(\{0,1\})$, i.e. $\{0\}$ is one of the subsets making up the power set of $\{0,1\}$.

## Code

```lean
import Mathlib

example : ({0} : Set ℕ) ∈ 𝒫 ({0, 1} : Set ℕ) := by
  rw [Set.mem_powerset_iff]
  intro x hx
  simp only [Set.mem_singleton_iff] at hx
  simp [hx]
```

## Walkthrough

- [`Set.mem_powerset_iff`](../../../Glossary/Set.powerset.md) `: s ∈ 𝒫 t ↔ s ⊆ t` turns the goal into `{0} ⊆ {0,1}`.
- [`intro`](../../../Glossary/intro.md) `x hx` introduces an arbitrary element `x` of `{0}` along with `hx : x ∈ {0}`.
- `simp only [Set.mem_singleton_iff] at hx` simplifies `hx` to `x = 0`, using [`Set.mem_singleton_iff`](../../../Glossary/Set.insert-singleton.md) and [`simp`](../../../Glossary/simp.md). `simp [hx]` then substitutes `x = 0` into the goal `x ∈ {0,1}`, reducing it to `0 ∈ {0,1}` and closing it automatically.
- The full power set $\mathcal{P}(\{0,1\})$ has four elements — $\emptyset$, $\{0\}$, $\{1\}$, $\{0,1\}$ — the main note proves this equality by hand. This page formalizes membership of just one of them, and the other three memberships follow the same pattern.

## Back-link

- [Module 8 – Sets](../08-Sets.md)
