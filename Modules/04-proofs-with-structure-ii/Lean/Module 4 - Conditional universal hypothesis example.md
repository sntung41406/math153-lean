# Module 4 - Conditional universal hypothesis example

## Statement

Suppose $a^2\le 2$ and $b^2\le 2$, and each of $a$, $b$ is at least every real $y$ with $y^2\le 2$. Prove $a=b$.

## Backward: `apply`

### Code

```lean
import Mathlib

example {a b : ℝ} (ha1 : a ^ 2 ≤ 2) (hb1 : b ^ 2 ≤ 2)
    (ha2 : ∀ y, y ^ 2 ≤ 2 → y ≤ a) (hb2 : ∀ y, y ^ 2 ≤ 2 → y ≤ b) :
    a = b := by
  apply le_antisymm
  · apply hb2
    exact ha1
  · apply ha2
    exact hb1
```

### Walkthrough

- The hypothesis `hb2 : ∀ y, y ^ 2 ≤ 2 → y ≤ b` combines [`∀`](../../../Glossary/forall.md) and [`→`](../../../Glossary/implies.md). Read it as a machine with two inputs: give it a number `y` and a proof of `y ^ 2 ≤ 2`, and it returns a proof of `y ≤ b`.
- [`apply`](../../../Glossary/apply.md) [`le_antisymm`](../../../Glossary/le_antisymm.md) replaces the goal `a = b` by two goals, `a ≤ b` and `b ≤ a`.
- In the first goal `a ≤ b`, the tactic `apply hb2` matches the goal with the conclusion `y ≤ b` of `hb2`. Lean sees that `y` must be `a`, so the first input is filled in automatically. The second input is still missing, so the goal becomes the antecedent `a ^ 2 ≤ 2`.
- `exact ha1` supplies that antecedent. Forgetting this step is a common mistake: `hb2` alone does not say `a ≤ b`. It says `a ≤ b` *if* `a ^ 2 ≤ 2`.
- The second goal `b ≤ a` is the same argument with the roles of `a` and `b` exchanged.

## Forward: supply both inputs

### Code

```lean
import Mathlib

example {a b : ℝ} (ha1 : a ^ 2 ≤ 2) (hb1 : b ^ 2 ≤ 2)
    (ha2 : ∀ y, y ^ 2 ≤ 2 → y ≤ a) (hb2 : ∀ y, y ^ 2 ≤ 2 → y ≤ b) :
    a = b := by
  have h1 : a ≤ b := hb2 a ha1
  have h2 : b ≤ a := ha2 b hb1
  exact le_antisymm h1 h2
```

### Walkthrough

- `hb2 a ha1` gives `hb2` both inputs directly: the number `a`, then the proof `ha1 : a ^ 2 ≤ 2`. The result is a proof of `a ≤ b`.
- Writing only `hb2 a` gives the implication `a ^ 2 ≤ 2 → a ≤ b`. This is a true statement, but it is not yet the inequality `a ≤ b`.
- Both proofs are the same mathematics. The backward proof starts from the goal and asks "what would give me this?". The forward proof starts from the hypotheses and builds new facts.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
