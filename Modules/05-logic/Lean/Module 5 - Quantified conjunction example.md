# Module 5 - Quantified conjunction example

## Statement

If $P\,x$ holds for every $x$ and $Q\,x$ holds for every $x$, then $P\,x \wedge Q\,x$ holds for every $x$. Then use the same pattern on a concrete statement about real numbers.

## The general rule

### Code

```lean
import Mathlib

example {α : Type*} {P Q : α → Prop} (h1 : ∀ x : α, P x) (h2 : ∀ x : α, Q x) :
    ∀ x : α, P x ∧ Q x := by
  intro x
  constructor
  · exact h1 x
  · exact h2 x
```

### Walkthrough

- `α` is the domain: the type the variable `x` ranges over. [`{α : Type*}`](../../../Glossary/Type.md) says that `α` can be any type, such as `ℤ` or `ℝ`, so this one proof covers all of them. `P` and `Q` are predicates on `α`: for each `x : α`, `P x` is a [`Prop`](../../../Glossary/Prop.md).
- The goal starts with [`∀`](../../../Glossary/forall.md), so [`intro`](../../../Glossary/intro.md) `x` takes an arbitrary `x : α`. Nothing is known about this `x`, so whatever we prove about it holds for every `x`.
- The goal is now `P x ∧ Q x`. [`constructor`](../../../Glossary/constructor.md) splits it into `P x` and `Q x`.
- `h1 : ∀ x : α, P x` can be used at any value. `h1 x` is a proof of `P x` for our arbitrary `x`, and `h2 x` is a proof of `Q x`.

## A concrete instance

### Code

```lean
import Mathlib

example : ∀ x : ℝ, x ^ 2 ≥ 0 ∧ x ^ 2 + 1 > 0 := by
  intro x
  constructor
  · positivity
  · positivity
```

### Walkthrough

- The domain is now `ℝ`. The proof has the same shape: take an arbitrary real `x`, split the [`∧`](../../../Glossary/and.md), and prove each part.
- [`positivity`](../../../Glossary/positivity.md) proves `x ^ 2 ≥ 0` and `x ^ 2 + 1 > 0`, since a square is nonnegative.
- Each part is proved for the same arbitrary `x`. That is why the two separate `∀` statements combine into one `∀` of an `∧`.

## Back-link

- [Module 5 – Logic](../05-Logic.md)
