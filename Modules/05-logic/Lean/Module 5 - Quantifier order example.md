# Module 5 - Quantifier order example

## Statement

Prove $\big(\exists x, \forall y, P\,x\,y\big) \to \forall y, \exists x, P\,x\,y$ — a single witness that works for every $y$ certainly gives, for each $y$, some witness that works for it.

## Code

```lean
import Mathlib

example {α β : Type*} {P : α → β → Prop} (h : ∃ x : α, ∀ y : β, P x y) :
    ∀ y : β, ∃ x : α, P x y := by
  obtain ⟨x, hx⟩ := h
  intro y
  exact ⟨x, hx y⟩
```

## Walkthrough

- [`{α β : Type*}`](../../../Glossary/Type.md) says that `α` and `β` can be any types. `x` ranges over `α` and `y` ranges over `β`.
- [`obtain`](../../../Glossary/obtain.md) `⟨x, hx⟩ := h` unpacks the hypothesis $\exists x, \forall y, P\,x\,y$ into a concrete witness `x` and a proof `hx : ∀ y, P x y`.
- [`intro`](../../../Glossary/intro.md) `y` introduces an arbitrary `y` for the goal `∀ y, ∃ x, P x y`, leaving `∃ x, P x y` to prove.
- `hx y` specializes the universal fact to this particular `y`, giving `P x y`; pairing it with the witness `x` via `⟨x, hx y⟩` closes the existential goal. Note the same `x` is reused for every `y` — that's exactly what makes the hypothesis stronger than the conclusion, and why the converse implication isn't provable this way.

## Back-link

- [Module 5 – Logic](../05-Logic.md)
