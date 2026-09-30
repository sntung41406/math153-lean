# Module 3 - Congruence substitution example

## Statement

Substitute two congruences into a polynomial expression using `rel`, chaining through a `calc` block.

## Code

```lean
import Mathlib

example {a b : ℤ} (ha : a ≡ 4 [ZMOD 5]) (hb : b ≡ 3 [ZMOD 5]) :
    a * b + b ^ 3 + 3 ≡ 2 [ZMOD 5] :=
  calc
    a * b + b ^ 3 + 3 ≡ 4 * b + b ^ 3 + 3 [ZMOD 5] := by rel [ha]
    _ ≡ 4 * 3 + 3 ^ 3 + 3 [ZMOD 5]                  := by rel [hb]
    _ = 2 + 5 * 8                                     := by norm_num
    _ ≡ 2 [ZMOD 5]                                    := by decide
```

## Walkthrough

- `a ≡ 4 [ZMOD 5]` is Lean's notation for [`Int.ModEq`](../../../Glossary/Int.ModEq.md) (congruence mod `5`).
- [`rel`](../../../Glossary/rel.md) `[ha]` substitutes `a ≡ 4 [ZMOD 5]` into the expression, just as `rw` would substitute an equality — replacing `a` with `4` while preserving the congruence. `rel` is a genuine Mathlib tactic that works for `Int.ModEq` the same way it does for `≤`/`<`/`=`.
- `rel [hb]` does the same for `b ≡ 3 [ZMOD 5]`.
- Once only numbers remain, `norm_num` evaluates the arithmetic, and [`decide`](../../../Glossary/decide.md) closes the final congruence check `2 + 5 * 8 ≡ 2 [ZMOD 5]` by direct computation (both sides reduce to the same residue mod 5).
- The whole chain behaves exactly like an equality `calc` block, just with `≡ [ZMOD 5]` in place of `=` at each step.

## Back-link

- [Module 3 – Parity, Divisibility & Number Theory](../03-Parity%20Divisibility%20%26%20Number%20Theory.md)
