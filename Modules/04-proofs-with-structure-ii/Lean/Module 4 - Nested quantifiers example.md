# Module 4 - Nested quantifiers example

## Statement

Prove that there is a real $a$ such that for every real $b$ there is a real $c$ with $a+b<c$. Then compare "for every $b$ there is a larger $c$" with "there is a $c$ larger than every $b$".

## Choosing witnesses in order

### Code

```lean
import Mathlib

example : ∃ a : ℝ, ∀ b : ℝ, ∃ c : ℝ, a + b < c := by
  use 0
  intro b
  use b + 1
  linarith
```

### Walkthrough

- Read the goal from left to right. Each `∃` asks *you* to choose a value with [`use`](../../../Glossary/use.md). Each [`∀`](../../../Glossary/forall.md) gives you an arbitrary value with [`intro`](../../../Glossary/intro.md), and you cannot choose it.
- `use 0` chooses `a`. At this moment `b` does not exist yet in the context, so the witness for `a` cannot mention `b`. The goal becomes `∀ b : ℝ, ∃ c : ℝ, 0 + b < c`.
- `intro b` introduces an arbitrary real `b`. The goal becomes `∃ c : ℝ, 0 + b < c`.
- `use b + 1` chooses `c`. Now `b` is in the context, so the witness for `c` is allowed to depend on `b`. The goal becomes `0 + b < b + 1`, and [`linarith`](../../../Glossary/linarith.md) closes it.
- The rule: a witness may depend only on the variables introduced *before* it.

## The order matters

### Code

```lean
import Mathlib

example : ∀ b : ℝ, ∃ c : ℝ, b < c := by
  intro b
  use b + 1
  linarith

example : ¬ ∃ c : ℝ, ∀ b : ℝ, b < c := by
  intro h
  obtain ⟨c, hc⟩ := h
  have h1 : c < c := hc c
  linarith
```

### Walkthrough

- The first statement is true: for every `b` there is a larger number, and the witness `b + 1` depends on `b`.
- The second statement exchanges the two quantifiers. It claims that one single `c` is larger than every real number. This is false, so we prove its negation.
- `intro h` assumes such a `c` exists, and [`obtain`](../../../Glossary/obtain.md) gives the number `c` and the fact `hc : ∀ b : ℝ, b < c`.
- A "for all" hypothesis can be used at any value. Using it at `c` itself gives `h1 : c < c`, which is impossible, and `linarith` closes the goal `False`.
- So `∀ b, ∃ c, …` and `∃ c, ∀ b, …` are different statements. In the first, `c` may change with `b`. In the second, one `c` must work for all `b`.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
