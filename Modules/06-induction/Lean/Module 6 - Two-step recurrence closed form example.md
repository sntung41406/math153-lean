# Module 6 - Two-step recurrence closed form example

## Statement

Given $a_0=2$, $a_1=1$, $a_{n+2}=a_{n+1}+2a_n$, prove $a_n=2^n+(-1)^n$ for every $n$.

## Two-step form

### Code

```lean
import Mathlib

def a : ℕ → ℤ
  | 0 => 2
  | 1 => 1
  | n + 2 => a (n + 1) + 2 * a n

theorem a_closed_form : ∀ n, a n = 2 ^ n + (-1) ^ n
  | 0 => by
      rw [a]
      norm_num
  | 1 => by
      rw [a]
      norm_num
  | k + 2 => by
      have IH1 := a_closed_form (k + 1)
      have IH2 := a_closed_form k
      calc a (k + 2) = a (k + 1) + 2 * a k := by rw [a]
        _ = (2 ^ (k + 1) + (-1) ^ (k + 1)) + 2 * (2 ^ k + (-1) ^ k) := by rw [IH1, IH2]
        _ = 2 ^ (k + 2) + (-1) ^ (k + 2) := by ring
```

### Walkthrough

- As in [Module 6 - Two-step induction example](Module%206%20-%20Two-step%20induction%20example.md), the theorem uses [pattern matching](../../../Glossary/pattern-matching.md). There are two base cases and a step with two hypotheses, `IH1` and `IH2`.
- The step uses both hypotheses at once: `rw [IH1, IH2]` replaces `a (k + 1)` and `a k` by their formulas.
- [`ring`](../../../Glossary/ring.md) closes the last line. It treats $(-1)^{k+1}$ as $-(-1)^k$ and $(-1)^{k+2}$ as $(-1)^k$.

## Ordinary induction on a pair

### Code

```lean
example (n : ℕ) :
    a n = 2 ^ n + (-1) ^ n ∧ a (n + 1) = 2 ^ (n + 1) + (-1) ^ (n + 1) := by
  induction n with
  | zero =>
    constructor
    · rw [a]
      norm_num
    · rw [a]
      norm_num
  | succ k IH =>
    obtain ⟨IH1, IH2⟩ := IH
    constructor
    · exact IH2
    · calc a (k + 1 + 1) = a (k + 1) + 2 * a k := by rw [a]
        _ = 2 ^ (k + 1 + 1) + (-1) ^ (k + 1 + 1) := by
          rw [IH1, IH2]
          ring
```

### Walkthrough

- This is the same principle with no recursive theorem. The statement is $Q(n)$: the formula holds at $n$ [and](../../../Glossary/and.md) at $n+1$. The proof is ordinary [`induction`](../../../Glossary/induction.md) on $Q$.
- The base case is $Q(0)$. [`constructor`](../../../Glossary/constructor.md) splits it into the two base cases.
- In the step, [`obtain`](../../../Glossary/obtain.md) gives the two hypotheses from $Q(k)$. The target $Q(k+1)$ has two parts. The first part is the formula at $k+1$, which is exactly `IH2`. The second part is the formula at $k+2$, which is the same calculation as before.
- This block uses `a` from the first block, so the two blocks belong in the same file, in this order.

## Back-link

- [Module 6 – Induction](../06-Induction.md)
