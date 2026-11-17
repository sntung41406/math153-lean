# Module 8 - Cartesian product example

## Statement

Prove $(3, -2) \in \{n \in \mathbb{N} \mid n \text{ is odd}\} \times \{z \in \mathbb{Z} \mid z < 0\}$.

## Code

```lean
import Mathlib

example : ((3 : ℕ), (-2 : ℤ)) ∈ {n : ℕ | Odd n} ×ˢ {z : ℤ | z < 0} := by
  rw [Set.mem_prod]
  constructor
  · show Odd 3
    use 1
    norm_num
  · show (-2 : ℤ) < 0
    norm_num
```

## Walkthrough

- The two sets come from different types: the first is a set of natural numbers, and the second a set of integers. Their product [`A ×ˢ B`](../../../Glossary/Set.prod.md) is a set of pairs of type `ℕ × ℤ`. The pair `((3 : ℕ), (-2 : ℤ))` fixes the type of each coordinate.
- [`rw`](../../../Glossary/rw.md) `[Set.mem_prod]` turns membership in the product into one membership claim per coordinate: `(3, -2).1 ∈ {n | Odd n} ∧ (3, -2).2 ∈ {z | z < 0}`. Here `.1` and `.2` are the [first and second coordinates](../../../Glossary/Prod.fst-snd.md).
- [`constructor`](../../../Glossary/constructor.md) splits the `∧` into the two coordinates.
- **First coordinate.** [`show`](../../../Glossary/show.md) `Odd 3` restates the goal in its simplest form: the first coordinate is `3`, and set-builder membership is the property itself. [`Odd 3`](../../../Glossary/Odd.md) means `∃ k, 3 = 2 * k + 1`. [`use`](../../../Glossary/use.md) `1` supplies the witness, and [`norm_num`](../../../Glossary/norm_num.md) checks `3 = 2 * 1 + 1`.
- **Second coordinate.** `show (-2 : ℤ) < 0` restates the goal, and `norm_num` proves it.

## Back-link

- [Module 8 – Sets](../08-Sets.md)
