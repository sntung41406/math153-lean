# Module 4 - Refuting a universal statement example

## Statement

Prove that it is not true that $x^2\ge x$ for every real $x$.

## Code

```lean
import Mathlib

example : ¬ (∀ x : ℝ, x ^ 2 ≥ x) := by
  intro h
  have h1 : ((1 : ℝ) / 2) ^ 2 ≥ 1 / 2 := h (1 / 2)
  norm_num at h1
```

## Walkthrough

- The goal is a negation. [`¬ P`](../../../Glossary/not.md) means `P →` [`False`](../../../Glossary/False.md), so [`intro`](../../../Glossary/intro.md) `h` assumes `h : ∀ x : ℝ, x ^ 2 ≥ x`, and the goal becomes `False`.
- A universal statement claims something about *every* value, so one bad value is enough to refute it. The value $x=\tfrac12$ is a **counterexample**: $\big(\tfrac12\big)^2=\tfrac14$, which is smaller than $\tfrac12$.
- `h (1 / 2)` uses the assumed statement at that value. This gives `h1 : (1 / 2) ^ 2 ≥ 1 / 2`, a statement about specific numbers that is false.
- [`norm_num`](../../../Glossary/norm_num.md) `at h1` computes both sides and finds that `h1` is false. A false hypothesis closes any goal, including `False`.
- Choosing the counterexample is the mathematical work. Numbers with $x^2<x$ lie strictly between $0$ and $1$, so `0` or `2` would not work here.
- Module 5 proves the same statement in a second way: it first rewrites `¬ ∀ x, …` as `∃ x, ¬ …` and then gives $\tfrac12$ as a witness. The counterexample is the same; only the bookkeeping changes.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
