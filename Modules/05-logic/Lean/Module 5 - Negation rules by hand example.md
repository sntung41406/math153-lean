# Module 5 - Negation rules by hand example

## Statement

Prove four of the negation rules from the definitions, without `push Not`: $\neg\exists x, P\,x \leftrightarrow \forall x, \neg P\,x$, the two De Morgan laws, and $\neg(P \to Q) \leftrightarrow P \wedge \neg Q$. Note which directions need the law of excluded middle.

## Negating an existential

### Code

```lean
import Mathlib

example {α : Type*} (P : α → Prop) : ¬ (∃ x, P x) ↔ ∀ x, ¬ P x := by
  constructor
  · intro h x hx
    have hex : ∃ x, P x := ⟨x, hx⟩
    contradiction
  · intro h hex
    obtain ⟨x, hx⟩ := hex
    have hnx : ¬ P x := h x
    contradiction
```

### Walkthrough

- [`{α : Type*}`](../../../Glossary/Type.md) says that `α` can be any type, such as `ℤ` or `ℝ`, so the rule holds for every domain.
- [`¬`](../../../Glossary/not.md) `A` means `A → False`. So [`intro`](../../../Glossary/intro.md) works on a `¬` goal: it assumes `A` and leaves the goal `False`.
- Forward direction: `intro h x hx` introduces three things at once: `h : ¬ ∃ x, P x`, an arbitrary `x`, and `hx : P x` (from the goal `¬ P x`). Now `x` together with `hx` is a witness, so `hex : ∃ x, P x`. This contradicts `h`, and [`contradiction`](../../../Glossary/contradiction.md) closes the goal.
- Backward direction: `intro h hex` gives `h : ∀ x, ¬ P x` and `hex : ∃ x, P x`. [`obtain`](../../../Glossary/obtain.md) takes the witness `x` and `hx : P x` out of `hex`. Using `h` at this `x` gives `¬ P x`, which contradicts `hx`.
- Neither direction uses excluded middle.

## De Morgan's laws

### Code

```lean
import Mathlib

example (P Q : Prop) : ¬ (P ∨ Q) ↔ (¬ P ∧ ¬ Q) := by
  constructor
  · intro h
    constructor
    · intro hP
      have hPQ : P ∨ Q := by
        left
        exact hP
      contradiction
    · intro hQ
      have hPQ : P ∨ Q := by
        right
        exact hQ
      contradiction
  · intro h hPQ
    obtain ⟨hnP, hnQ⟩ := h
    obtain hP | hQ := hPQ
    · contradiction
    · contradiction

example (P Q : Prop) : ¬ (P ∧ Q) ↔ (¬ P ∨ ¬ Q) := by
  constructor
  · intro h
    by_cases hP : P
    · right
      intro hQ
      have hPQ : P ∧ Q := by
        constructor
        · exact hP
        · exact hQ
      contradiction
    · left
      exact hP
  · intro h hPQ
    obtain ⟨hP, hQ⟩ := hPQ
    obtain hnP | hnQ := h
    · contradiction
    · contradiction
```

### Walkthrough

- First law, forward: from `h : ¬ (P ∨ Q)`, prove `¬ P` and `¬ Q` separately. To prove `¬ P`, assume `hP : P`. Then [`left`](../../../Glossary/left-right.md) builds `P ∨ Q`, which contradicts `h`. The `¬ Q` part is the same, using `right`.
- First law, backward: given `¬ P` and `¬ Q`, assume `hPQ : P ∨ Q` and split it into cases. Each case contradicts one of the two hypotheses.
- Second law, forward: from `h : ¬ (P ∧ Q)` we must say *which* side of `¬ P ∨ ¬ Q` holds, but `h` does not tell us. [`by_cases`](../../../Glossary/by_cases.md) `hP : P` splits on whether `P` is true. If it is, then `Q` must fail, since `P` and `Q` together would contradict `h`, so we choose `right`. If `P` is false, we choose `left`. **This is the step that uses excluded middle.**
- Second law, backward: given `¬ P ∨ ¬ Q`, assume `P ∧ Q`. Each case of the `∨` contradicts one part of the `∧`.

## Negating an implication

### Code

```lean
import Mathlib

example (P Q : Prop) : ¬ (P → Q) ↔ (P ∧ ¬ Q) := by
  constructor
  · intro h
    by_cases hP : P
    · constructor
      · exact hP
      · intro hQ
        have hPQ : P → Q := by
          intro _
          exact hQ
        contradiction
    · have hPQ : P → Q := by
        intro hP'
        contradiction
      contradiction
  · intro h hPQ
    obtain ⟨hP, hnQ⟩ := h
    have hQ : Q := hPQ hP
    contradiction
```

### Walkthrough

- Forward direction: from `h : ¬ (P → Q)`, prove `P ∧ ¬ Q`. Again `h` does not hand us a proof of `P`, so `by_cases hP : P` splits on it. **This direction uses excluded middle.**
- In the case `hP : P`, the first part is `hP`. For `¬ Q`, assume `hQ : Q`. Then `P → Q` holds, because its conclusion `Q` is true whatever `P` is (`intro _` ignores the premise). This contradicts `h`.
- In the case `hP : ¬ P`, the implication `P → Q` holds *vacuously*: its premise can never be true. Inside that proof, `intro hP'` gives `hP' : P`, which contradicts `hP`. So `P → Q` holds, which contradicts `h`. This case is impossible.
- Backward direction: given `hP : P` and `hnQ : ¬ Q`, assume `hPQ : P → Q`. Then `hPQ hP : Q` contradicts `hnQ`.
- Of the four rules on this page, only two directions needed `by_cases`: `¬ (P ∧ Q) → ¬ P ∨ ¬ Q` and `¬ (P → Q) → P ∧ ¬ Q`. In both, we have to *produce* a positive fact from a negative hypothesis.

## Back-link

- [Module 5 – Logic](../05-Logic.md)
