# Module 5 - Disjunction elimination example

## Statement

From $P \vee Q$ and $\neg Q$, conclude $P$.

## Code

```lean
import Mathlib

example {P Q : Prop} (h1 : P ∨ Q) (h2 : ¬ Q) : P := by
  obtain hP | hQ := h1
  · exact hP
  · contradiction
```

## Walkthrough

- `P` and `Q` have type [`Prop`](../../../Glossary/Prop.md): they are arbitrary statements. Nothing is known about them except the two hypotheses.
- `h1 : P ∨ Q` is an [`∨`](../../../Glossary/or.md) hypothesis. To use it, [`obtain`](../../../Glossary/obtain.md) `hP | hQ := h1` splits the proof into two cases: one where `hP : P` holds, and one where `hQ : Q` holds. Both cases must be closed.
- In the first case the goal `P` is exactly `hP`, so [`exact`](../../../Glossary/exact.md) `hP` closes it.
- In the second case the context has `hQ : Q` and `h2 : ¬ Q`. A statement and its negation cannot both hold, so [`contradiction`](../../../Glossary/contradiction.md) closes the goal. This case never really happens.
- This is the "P or Q, but not Q, so P" argument from the Motivation, with every step made explicit.

## Back-link

- [Module 5 – Logic](../05-Logic.md)
