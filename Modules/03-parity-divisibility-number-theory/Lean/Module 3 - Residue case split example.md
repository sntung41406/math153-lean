# Module 3 - Residue case split example

## Statement

Prove $x^3\equiv x\pmod 3$ for every integer $x$, by case-splitting on the residue of $x$ mod 3.

## Code

```lean
import Mathlib

example {x : ℤ} : x ^ 3 ≡ x [ZMOD 3] := by
  mod_cases hx : x % 3
  calc
    x ^ 3 ≡ 0 ^ 3 [ZMOD 3] := by rel [hx]
    _ = 0                    := by norm_num
    _ ≡ x [ZMOD 3]           := by rel [hx]
  calc
    x ^ 3 ≡ 1 ^ 3 [ZMOD 3] := by rel [hx]
    _ = 1                    := by norm_num
    _ ≡ x [ZMOD 3]           := by rel [hx]
  calc
    x ^ 3 ≡ 2 ^ 3 [ZMOD 3] := by rel [hx]
    _ = 2 + 3 * 2             := by norm_num
    _ ≡ 2 [ZMOD 3]           := by decide
    _ ≡ x [ZMOD 3]           := by rel [hx]
```

## Walkthrough

- [`mod_cases`](../../../Glossary/mod_cases.md) `hx : x % 3` is a genuine Mathlib tactic that splits the goal into three cases, one for each possible remainder of `x` mod `3`: `hx : x ≡ 0`, `hx : x ≡ 1`, and `hx : x ≡ 2 [ZMOD 3]`.
- Each `calc` block proves the same goal, `x ^ 3 ≡ x [ZMOD 3]`, using that branch's specific residue — first substituting the residue in for `x` via [`rel`](../../../Glossary/rel.md) `[hx]`, evaluating the numeric power with `norm_num`, then substituting back.
- All three cases must close for the universal statement (true for *every* integer `x`) to be established.

## Back-link

- [Module 3 – Parity, Divisibility & Number Theory](../03-Parity%20Divisibility%20%26%20Number%20Theory.md)
