# Module 5 - Divisibility counterexample

## Statement

Disprove "for all natural numbers $a,b,c$, if $a \mid bc$ then $a \mid b$ or $a \mid c$" with the counterexample $a = 4$, $b = c = 2$.

## Code

```lean
import Mathlib

example : ¬ (∀ a b c : ℕ, a ∣ b * c → a ∣ b ∨ a ∣ c) := by
  push Not
  use 4, 2, 2
  decide
```

## Walkthrough

- The statement is a `∀`, so one counterexample is enough to disprove it.
- [`push Not`](../../../Glossary/push-not.md) turns the goal into the negation `∃ a b c, a ∣ b * c ∧ ¬a ∣ b ∧ ¬a ∣ c`. The `∀` became `∃`, the implication became `∧`, and the `∨` became `∧` of two negations.
- [`use`](../../../Glossary/use.md) `4, 2, 2` gives the three witnesses at once. The goal becomes `4 ∣ 2 * 2 ∧ ¬4 ∣ 2 ∧ ¬4 ∣ 2`.
- Each part is a concrete statement about small natural numbers: $4 \mid 4$, $4 \nmid 2$, and $4 \nmid 2$. [`decide`](../../../Glossary/decide.md) checks all of them.
- The rule "if $p \mid bc$ then $p \mid b$ or $p \mid c$" is true when $p$ is prime. The counterexample shows why the word "prime" is needed: $4 = 2 \cdot 2$ can divide a product by taking one factor of $2$ from each of $b$ and $c$.

## Back-link

- [Module 5 – Logic](../05-Logic.md)
