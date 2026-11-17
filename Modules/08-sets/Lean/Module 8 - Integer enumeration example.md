# Module 8 - Integer enumeration example

## Statement

Prove that the function $e : \mathbb{N} \to \mathbb{Z}$ listing the integers as $0, -1, 1, -2, 2, \dots$ is a bijection, by giving an inverse $d : \mathbb{Z} \to \mathbb{N}$.

## Code

```lean
import Mathlib

open Function

def e (n : ℕ) : ℤ := if n % 2 = 0 then n / 2 else -((n + 1) / 2)

def d (z : ℤ) : ℕ := if 0 ≤ z then 2 * z.natAbs else 2 * z.natAbs - 1

example : e 0 = 0 ∧ e 1 = -1 ∧ e 2 = 1 ∧ e 3 = -2 ∧ e 4 = 2 := by
  norm_num [e]

theorem d_left : LeftInverse d e := by
  intro n
  dsimp only [e, d]
  split_ifs <;> omega

theorem d_right : RightInverse d e := by
  intro z
  dsimp only [e, d]
  split_ifs <;> omega

example : Bijective e := ⟨d_left.injective, d_right.surjective⟩
```

## Walkthrough

- `e` and `d` are [defined](../../../Glossary/def.md) with [`if … then … else`](../../../Glossary/if-then-else.md), one branch for each case of the hand proof. In `e`, the input `n` is a natural number and the output is an integer, so Lean converts `n` to an integer before dividing. Division of integers rounds down; since each branch divides an even number by `2`, there is no rounding.
- In `d`, [`z.natAbs`](../../../Glossary/Int.natAbs.md) is the absolute value of `z` as a natural number. For `z ≥ 0` it is `z`, so `d z = 2z`. For `z < 0` it is `-z`, so `d z = -2z - 1`.
- The first `example` checks the first five values, `0, -1, 1, -2, 2`. [`norm_num`](../../../Glossary/norm_num.md) `[e]` unfolds `e` and computes each value.
- **Left inverse.** [`LeftInverse d e`](../../../Glossary/Function.LeftInverse-RightInverse.md) means `∀ n, d (e n) = n`. After [`intro`](../../../Glossary/intro.md) `n`, [`dsimp only`](../../../Glossary/dsimp.md) `[e, d]` unfolds both definitions. The goal then contains two `if`s: one inside `e n`, and one inside `d` applied to it.
- [`split_ifs`](../../../Glossary/split_ifs.md) splits the goal into one case for each choice of branch, and adds each condition (for example `n % 2 = 0` and `0 ≤ n / 2`) as a hypothesis. Some of these cases are impossible, such as `n` even with `n / 2 < 0`.
- `<;>` runs [`omega`](../../../Glossary/omega.md) on every case. `omega` proves each possible case by arithmetic and closes each impossible one from its contradictory hypotheses. It understands `%`, `/` by a number, `natAbs`, and the conversion from `ℕ` to `ℤ`.
- **Right inverse.** `RightInverse d e` means `∀ z, e (d z) = z`. The proof is the same.
- **Bijective.** As in [Module 7 - Inverse example](../../07-functions/Lean/Module%207%20-%20Inverse%20example.md), `d_left.injective` proves that `e` is injective, and `d_right.surjective` proves that `e` is surjective. The angle brackets combine them into [`Bijective e`](../../../Glossary/Function.Bijective.md). So $|\mathbb{N}| = |\mathbb{Z}|$.

## Back-link

- [Module 8 – Sets](../08-Sets.md)
