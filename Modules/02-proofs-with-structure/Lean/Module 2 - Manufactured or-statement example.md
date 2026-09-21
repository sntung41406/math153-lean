# Module 2 - Manufactured or-statement example

## Statement

Create your own "or" fact by invoking a general order lemma, then case-split on it.

## Code

```lean
import Mathlib

example {n : ℕ} : n ^ 2 ≠ 2 := by
  obtain hn | hn := lt_or_ge n 2
  · apply ne_of_lt
    calc
      n ^ 2 ≤ 1 ^ 2 := Nat.pow_le_pow_left (by omega) 2
      _ < 2          := by norm_num
  · apply ne_of_gt
    calc
      (2:ℕ) < 2 ^ 2 := by norm_num
      _ ≤ n ^ 2       := Nat.pow_le_pow_left hn 2
```

## Walkthrough

- No hypothesis here is already an "or" statement, so we manufacture one: [`lt_or_ge`](../../../Glossary/lt_or_ge.md) `n 2 : n < 2 ∨ n ≥ 2` is a general fact about any linear order, giving us exactly the case split we need.
- `obtain hn | hn := lt_or_ge n 2` splits into the two cases `hn : n < 2` and `hn : n ≥ 2`. Each [`·`](../../../Glossary/focusing-dot.md) (focusing dot) starts the proof of one case; the indented lines after it belong to that case only.
- [`Nat.pow_le_pow_left`](../../../Glossary/Nat.pow_le_pow_left.md) `: a ≤ b → a ^ k ≤ b ^ k` is the monotonicity fact that lets us compare squares directly from a comparison of their bases. In the first branch, `(by omega)` converts `n < 2` into the `n ≤ 1` the lemma expects; [`omega`](../../../Glossary/omega.md) handles simple facts like this about whole numbers.
- In each case, `apply ne_of_lt` or `apply ne_of_gt` reduces `n ^ 2 ≠ 2` to a strict inequality, which is then proved by a calculation ending in a numeric inequality, closed by `norm_num` the same way as in Module 1.
- This pattern — invoke a lemma to produce an "or" fact, then case-split on it — is far more common in practice than hypotheses that arrive already shaped as an "or".

## Back-link

- [Module 2 – Proofs with Structure](../02-Proofs%20with%20Structure.md)
