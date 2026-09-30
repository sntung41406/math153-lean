# Module 3 - Congruence from divisibility

## Statement

Prove $11\equiv 3\pmod 4$ by turning the congruence into a divisibility statement and giving a witness.

## Code

```lean
import Mathlib

example : (11 : ℤ) ≡ 3 [ZMOD 4] := by
  rw [Int.modEq_iff_dvd]
  use -2
  norm_num
```

## Walkthrough

- `(11 : ℤ) ≡ 3 [ZMOD 4]` is Lean's notation for [`Int.ModEq`](../../../Glossary/Int.ModEq.md) `4 11 3`. Mathlib *defines* it as "equal remainders": `11 % 4 = 3 % 4`. This is not the same statement as our definition "$4$ divides the difference", so we need a lemma to connect the two.
- [`Int.modEq_iff_dvd`](../../../Glossary/Int.modEq_iff_dvd.md) `: a ≡ b [ZMOD n] ↔ n ∣ b - a` is that lemma. `rw [Int.modEq_iff_dvd]` changes the goal to `4 ∣ 3 - 11`.
- Notice the order: Mathlib subtracts `b - a`, so the difference is $3-11=-8$, not $11-3=8$. The witness is therefore `-2`, not `2`.
- [`use`](../../../Glossary/use.md) `-2` changes the goal to `3 - 11 = 4 * -2`, and [`norm_num`](../../../Glossary/norm_num.md) checks this arithmetic.
- If you write `use 2` by mistake, the goal becomes `3 - 11 = 4 * 2`, which is false. `norm_num` simplifies it to `False` and Lean reports the unsolved goal `⊢ False`. When you see that, check the sign of your witness.

## Back-link

- [Module 3 – Parity, Divisibility & Number Theory](../03-Parity%20Divisibility%20%26%20Number%20Theory.md)
