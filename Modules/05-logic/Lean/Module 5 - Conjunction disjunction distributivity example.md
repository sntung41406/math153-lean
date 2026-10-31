# Module 5 - Conjunction disjunction distributivity example

## Statement

Prove $P \wedge (Q \vee R) \leftrightarrow (P \wedge Q) \vee (P \wedge R)$ for propositions $P, Q, R$.

## Code

```lean
import Mathlib

example (P Q R : Prop) : (P ∧ (Q ∨ R)) ↔ ((P ∧ Q) ∨ (P ∧ R)) := by
  constructor
  · intro h
    obtain ⟨hP, hQ | hR⟩ := h
    · left
      constructor
      · exact hP
      · exact hQ
    · right
      constructor
      · exact hP
      · exact hR
  · intro h
    obtain ⟨hP, hQ⟩ | ⟨hP, hR⟩ := h
    · constructor
      · exact hP
      · left
        exact hQ
    · constructor
      · exact hP
      · right
        exact hR
```

## Walkthrough

- [`constructor`](../../../Glossary/constructor.md) splits the [`↔`](../../../Glossary/iff.md) goal into a forward direction and a backward direction, proved one after another.
- Forward: [`intro`](../../../Glossary/intro.md) `h` names the hypothesis `P ∧ (Q ∨ R)`. [`obtain`](../../../Glossary/obtain.md) `⟨hP, hQ | hR⟩ := h` takes it apart in one step: `hP : P`, and either `hQ : Q` or `hR : R`. In the `Q` case, [`left`](../../../Glossary/left-right.md) chooses the disjunct `P ∧ Q`, and `constructor` splits it into `P` and `Q`. The `R` case is the same with `right`.
- Backward: `obtain ⟨hP, hQ⟩ | ⟨hP, hR⟩ := h` splits the `∨` hypothesis into its two cases, and each case already carries an `∧`. The goal `P ∧ (Q ∨ R)` is split with `constructor`. The `P` part is `hP`. For the `Q ∨ R` part, `left` or `right` chooses the side we have a proof of.
- The tactics follow the shape of the statement. Each `∧` in a goal needs `constructor`, each `∨` in a goal needs `left` or `right`, and each `∧` or `∨` in a hypothesis is taken apart with `obtain`.

## Back-link

- [Module 5 – Logic](../05-Logic.md)
