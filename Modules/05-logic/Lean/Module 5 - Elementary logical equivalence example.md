# Module 5 - Elementary logical equivalence example

## Statement

Prove the logical equivalence $(P \vee P) \leftrightarrow P$.

## Code

```lean
import Mathlib

example (P : Prop) : (P ∨ P) ↔ P := by
  constructor
  · intro h
    obtain h1 | h2 := h
    · exact h1
    · exact h2
  · intro h
    left
    exact h
```

## Walkthrough

- An [`↔`](../../../Glossary/iff.md) goal is two implications. [`constructor`](../../../Glossary/constructor.md) splits it into `P ∨ P → P` and `P → P ∨ P`.
- Forward direction: [`intro`](../../../Glossary/intro.md) `h` assumes `h : P ∨ P`. [`obtain`](../../../Glossary/obtain.md) `h1 | h2 := h` gives two cases, and in each case the hypothesis is exactly the goal `P`. The two cases are the same, which is why this equivalence is short.
- Backward direction: `intro h` assumes `h : P`, and the goal is `P ∨ P`. [`left`](../../../Glossary/left-right.md) chooses the left side, so the goal becomes `P`, and `exact h` closes it.
- The proof never uses what `P` says. That is what makes this a logical equivalence: it holds for *every* proposition `P`, because of the meaning of `∨` alone.

## Back-link

- [Module 5 – Logic](../05-Logic.md)
