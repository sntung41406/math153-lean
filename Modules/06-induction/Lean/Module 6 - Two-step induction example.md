# Module 6 - Two-step induction example

## Statement

Given $F_0 = 1$, $F_1 = 1$, $F_{n+2} = F_{n+1} + F_n$, prove $F_n \le 2^n$ for every $n$.

## Code

```lean
import Mathlib

def F : ℕ → ℤ
  | 0 => 1
  | 1 => 1
  | n + 2 => F (n + 1) + F n

theorem F_le_two_pow : ∀ n, F n ≤ 2 ^ n
  | 0 => by rw [F]; norm_num
  | 1 => by rw [F]; norm_num
  | k + 2 => by
      have IH1 := F_le_two_pow (k + 1)
      have IH2 := F_le_two_pow k
      have h1 : (2 : ℤ) ^ (k + 2) = 2 * 2 ^ (k + 1) := by ring
      have h2 : (2 : ℤ) ^ (k + 1) = 2 * 2 ^ k := by ring
      have h3 : (0 : ℤ) ≤ 2 ^ k := by positivity
      calc F (k + 2) = F (k + 1) + F k := by rw [F]
        _ ≤ 2 ^ (k + 1) + 2 ^ k := by linarith
        _ ≤ 2 ^ (k + 2) := by linarith
```

## Walkthrough

- **The principle.** Two-step induction needs two base cases, $P(0)$ and $P(1)$, and a step that assumes $P(k)$ and $P(k+1)$ to prove $P(k+2)$. The three cases of the proof below are exactly these three parts.
- `F` needs two base values before its recursive rule applies, since each term depends on the two before it. It is defined by [pattern matching](../../../Glossary/pattern-matching.md) on the cases `0`, `1`, and `n + 2`.
- The theorem `F_le_two_pow` uses the same three cases. The cases `0` and `1` are the two base cases. They unfold `F` with [`rw`](../../../Glossary/rw.md) and close with [`norm_num`](../../../Glossary/norm_num.md).
- The case `k + 2` is the inductive step. `F_le_two_pow (k + 1)` and `F_le_two_pow k` are recursive uses of the theorem being proved, and they give the two inductive hypotheses `IH1` and `IH2`. Lean accepts them because `k + 1` and `k` are smaller than `k + 2`.
- `h1` and `h2` relate the powers of $2$ at `k + 2`, `k + 1`, and `k`, and `h3` records $2^k\ge0$. The final [`calc`](../../../Glossary/calc.md) combines these facts with `IH1` and `IH2` by [`linarith`](../../../Glossary/linarith.md).
- The same principle can be written without a recursive theorem. See [Module 6 - Two-step recurrence closed form example](Module%206%20-%20Two-step%20recurrence%20closed%20form%20example.md), which uses ordinary [`induction`](../../../Glossary/induction.md) on a pair of neighbouring claims.

## Back-link

- [Module 6 – Induction](../06-Induction.md)
