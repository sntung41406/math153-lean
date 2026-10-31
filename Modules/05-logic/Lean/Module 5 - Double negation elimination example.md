# Module 5 - Double negation elimination example

## Statement

Prove $\neg\neg P \to P$ for a proposition $P$, using the law of excluded middle.

## Code

```lean
import Mathlib

example {P : Prop} (h : ¬¬P) : P := by
  by_cases hP : P
  · exact hP
  · contradiction
```

## Walkthrough

- [`by_cases`](../../../Glossary/by_cases.md) `hP : P` splits the proof into two branches using the law of excluded middle: one where `hP : P`, one where `hP : ¬ P`. No side goal is produced — classically, every proposition is either true or false.
- In the first branch the goal `P` is exactly `hP`, so `exact hP` closes it.
- In the second branch, the context holds both `hP : ¬ P` and `h : ¬¬ P` (i.e. `¬ P → False`). Applying `h` to `hP` gives `False`, which [`contradiction`](../../../Glossary/contradiction.md) finds automatically and uses to close the goal.

## Back-link

- [Module 5 – Logic](../05-Logic.md)
