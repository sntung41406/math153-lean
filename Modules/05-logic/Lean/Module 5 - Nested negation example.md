# Module 5 - Nested negation example

## Statement

Negate $\forall m \in \mathbb{Z},\ m \ne 2 \to \exists n \in \mathbb{Z},\ n^2 = m$, first by hand and then with `push Not`. Then prove the negation by giving the witness $m = 3$.

## Computing the negation

### Code

```lean
import Mathlib

example :
    ¬ (∀ m : ℤ, m ≠ 2 → ∃ n : ℤ, n ^ 2 = m) ↔ ∃ m : ℤ, m ≠ 2 ∧ ∀ n : ℤ, n ^ 2 ≠ m := by
  push Not
  rfl
```

### Walkthrough

- By hand, the negation moves inward one connective at a time:
  1. $\neg\big(\forall m,\ m \ne 2 \to \exists n,\ n^2 = m\big)$
  2. $\exists m,\ \neg\big(m \ne 2 \to \exists n,\ n^2 = m\big)$, by the rule for $\neg\forall$
  3. $\exists m,\ m \ne 2 \wedge \neg\big(\exists n,\ n^2 = m\big)$, by the rule for $\neg(P \to Q)$
  4. $\exists m,\ m \ne 2 \wedge \forall n,\ n^2 \ne m$, by the rule for $\neg\exists$
- [`push Not`](../../../Glossary/push-not.md) does all three steps at once. After it runs, the left side of the `↔` is the same as the right side, and [`rfl`](../../../Glossary/rfl.md) closes the goal.
- The domain $\mathbb{Z}$ stays the same in every step. The negation of "for every integer…" is "there is an integer…", not "there is a non-integer…".

## Proving the negation

### Code

```lean
import Mathlib

example : ¬ (∀ m : ℤ, m ≠ 2 → ∃ n : ℤ, n ^ 2 = m) := by
  push Not
  use 3
  constructor
  · norm_num
  · intro n hn
    have h1 : -2 < n := by nlinarith
    have h2 : n < 2 := by nlinarith
    interval_cases n
    · norm_num at hn
    · norm_num at hn
    · norm_num at hn
```

### Walkthrough

- After `push Not`, the goal is the negated form from step 4: `∃ m, m ≠ 2 ∧ ∀ n, n ^ 2 ≠ m`. The original statement is false, so its negation is something we can prove.
- [`use`](../../../Glossary/use.md) `3` chooses $m = 3$. [`constructor`](../../../Glossary/constructor.md) splits the `∧`, and [`norm_num`](../../../Glossary/norm_num.md) checks `3 ≠ 2`.
- The second part says that $3$ is not a perfect square. `n ^ 2 ≠ 3` means `n ^ 2 = 3 → False`, so [`intro`](../../../Glossary/intro.md) `n hn` gives an arbitrary integer `n` and `hn : n ^ 2 = 3`.
- If $n \le -2$ or $n \ge 2$, then $n^2 \ge 4$. So [`nlinarith`](../../../Glossary/nlinarith.md) proves `-2 < n` and `n < 2` from `hn`.
- Now [`interval_cases`](../../../Glossary/interval_cases.md) `n` makes one case for each of $n = -1, 0, 1$. In each case `hn` becomes a false equation such as `(-1) ^ 2 = 3`, and `norm_num at hn` closes the goal.

## Back-link

- [Module 5 – Logic](../05-Logic.md)
