# Module 4 - Prime example

## Statement

Prove that $2$ is prime, directly from the definition: $2\le 2$, and every natural number $m$ that divides $2$ is $1$ or $2$.

## Code

```lean
import Mathlib

example : Nat.Prime 2 := by
  rw [Nat.prime_def]
  constructor
  · norm_num
  intro m hm
  have h1 : m ≤ 2 := Nat.le_of_dvd (by norm_num) hm
  have h2 : 0 < m := Nat.pos_of_dvd_of_pos hm (by norm_num)
  interval_cases m
  · left
    rfl
  · right
    rfl
```

## Walkthrough

- [`Nat.Prime`](../../../Glossary/Nat.Prime.md) `p` is Mathlib's statement "the natural number `p` is prime". The lemma [`Nat.prime_def`](../../../Glossary/Nat.prime_def.md) is an [`↔`](../../../Glossary/iff.md) that restates it in the form from Module 3, and [`rw`](../../../Glossary/rw.md) replaces the goal by that form: `2 ≤ 2 ∧ ∀ (m : ℕ), m ∣ 2 → m = 1 ∨ m = 2`.
- Read the structure of this goal before proving anything. It is an "and". Its second part is a [`∀`](../../../Glossary/forall.md), then an [`→`](../../../Glossary/implies.md), then an "or". Each layer has its own tactic, and we use them from the outside in.
- [`constructor`](../../../Glossary/constructor.md) splits the "and". The first part `2 ≤ 2` is closed by `norm_num`.
- [`intro`](../../../Glossary/intro.md) `m hm` handles the `∀` and the `→` together: `m` is an arbitrary natural number and `hm : m ∣ 2`. The goal is now `m = 1 ∨ m = 2`.
- A divisor of a positive number is at most that number ([`Nat.le_of_dvd`](../../../Glossary/Nat.le_of_dvd.md)) and is itself positive ([`Nat.pos_of_dvd_of_pos`](../../../Glossary/Nat.pos_of_dvd_of_pos.md)). Each lemma needs the fact `0 < 2`, which `by norm_num` supplies in place. So `h1 : m ≤ 2` and `h2 : 0 < m`.
- [`interval_cases`](../../../Glossary/interval_cases.md) `m` sees these two bounds and makes one goal for each remaining value: `m = 1` and `m = 2`. In each, [`left` or `right`](../../../Glossary/left-right.md) chooses the true side of the "or".
- Mathlib can prove `Nat.Prime 2` in one step with `norm_num`. We do it by hand here to practise reading a definition with several nested layers.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
