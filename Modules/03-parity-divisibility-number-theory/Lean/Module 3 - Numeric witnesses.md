# Module 3 - Numeric witnesses

## Statement

Prove parity and divisibility facts about specific numbers by giving a witness: $-3$ is odd, $26$ is even, $11\mid 88$, $-2\mid 6$, and every integer divides $0$.

## Parity

### Code

```lean
import Mathlib

example : Odd (-3 : ℤ) := by
  use -2
  norm_num

example : Even (26 : ℤ) := by
  use 13
  norm_num
```

### Walkthrough

- [`Odd`](../../../Glossary/Odd.md) `n` means `∃ k, n = 2 * k + 1`. Solving $-3=2k+1$ gives $k=-2$, so [`use`](../../../Glossary/use.md) `-2` commits to that witness. The goal becomes `-3 = 2 * -2 + 1`, and [`norm_num`](../../../Glossary/norm_num.md) checks the arithmetic.
- [`Even`](../../../Glossary/Even.md) `n` means `∃ r, n = r + r` in Mathlib — not `n = 2 * r`. The witness is the same number, $13$, but after `use 13` the goal is `26 = 13 + 13`.
- The `(-3 : ℤ)` tells Lean that `-3` is an integer. Write the kind of number explicitly: without it, Lean has to guess, and a plain number such as `26` is read as a natural number.

## Divisibility

### Code

```lean
import Mathlib

example : (11 : ℕ) ∣ 88 := by
  use 8

example : (-2 : ℤ) ∣ 6 := by
  use -3
  norm_num

example (t : ℤ) : t ∣ 0 := by
  use 0
  ring
```

### Walkthrough

- [`a ∣ b`](../../../Glossary/dvd.md) means `∃ c, b = a * c`. The symbol `∣` is typed `\mid`. It is not the keyboard bar `|`.
- `(11 : ℕ) ∣ 88` is about natural numbers, so the witness must be a natural number: `8`. After `use 8`, the goal `88 = 11 * 8` is simple enough that `use` checks it by itself, so no further line is needed.
- `(-2 : ℤ) ∣ 6` is about integers. The witness `-3` is negative, which is allowed in `ℤ` but would not exist in `ℕ`. Here `use -3` leaves the goal `6 = -2 * -3`, and `norm_num` checks it.
- For `t ∣ 0`, the witness is `0` for every `t`. The goal `0 = t * 0` contains a variable, so we check it with [`ring`](../../../Glossary/ring.md) instead of `norm_num`.

## Back-link

- [Module 3 – Parity, Divisibility & Number Theory](../03-Parity%20Divisibility%20%26%20Number%20Theory.md)
