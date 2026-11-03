# Module 6 - Induction with a disjunction example

## Statement

Prove that for every natural number $n$, $4^n\equiv1\pmod{15}$ or $4^n\equiv4\pmod{15}$.

## Code

```lean
import Mathlib

example (n : ℕ) : (4 : ℤ) ^ n ≡ 1 [ZMOD 15] ∨ (4 : ℤ) ^ n ≡ 4 [ZMOD 15] := by
  induction n with
  | zero =>
    left
    norm_num
  | succ k IH =>
    obtain hk | hk := IH
    · right
      calc (4 : ℤ) ^ (k + 1) = 4 * 4 ^ k := by ring
        _ ≡ 4 * 1 [ZMOD 15] := by rel [hk]
        _ = 4 := by norm_num
    · left
      calc (4 : ℤ) ^ (k + 1) = 4 * 4 ^ k := by ring
        _ ≡ 4 * 4 [ZMOD 15] := by rel [hk]
        _ ≡ 1 [ZMOD 15] := by decide
```

## Walkthrough

- The statement $P(n)$ is an [`∨`](../../../Glossary/or.md) of two [congruences](../../../Glossary/Int.ModEq.md). [`induction`](../../../Glossary/induction.md) does not care about this shape, so we get the usual two cases.
- Base case: $4^0=1$, so we choose the first side with [`left`](../../../Glossary/left-right.md). [`norm_num`](../../../Glossary/norm_num.md) closes `4 ^ 0 ≡ 1 [ZMOD 15]`.
- Inductive step: `IH` is itself an `∨`. As in [Module 5 - Disjunction elimination example](../../05-logic/Lean/Module%205%20-%20Disjunction%20elimination%20example.md), [`obtain`](../../../Glossary/obtain.md) `hk | hk := IH` splits the proof into two cases.
- If $4^k\equiv1$, the target is the second side, so we write `right`. In the [`calc`](../../../Glossary/calc.md) chain, [`rel`](../../../Glossary/rel.md) `[hk]` substitutes the congruence into `4 * 4 ^ k`.
- If $4^k\equiv4$, the target is the first side, so we write `left`. Now the chain reaches `4 * 4`, and [`decide`](../../../Glossary/decide.md) checks that $16\equiv1\pmod{15}$ by computation.
- The two cases swap the two sides of the `∨`. This is why the residues of $4^n$ alternate.

## Back-link

- [Module 6 – Induction](../06-Induction.md)
