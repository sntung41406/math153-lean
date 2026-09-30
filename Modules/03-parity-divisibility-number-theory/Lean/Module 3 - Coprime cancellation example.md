# Module 3 - Coprime cancellation example

## Statement

Prove that if $8\mid 5n$, then $8\mid n$, exploiting that $8$ and $5$ share no common factor.

## Code

```lean
import Mathlib

example {n : ℤ} (hn : 8 ∣ 5 * n) : 8 ∣ n := by
  obtain ⟨a, ha⟩ := hn
  use -3 * a + 2 * n
  calc
    n = -3 * (5 * n) + 16 * n := by ring
    _ = -3 * (8 * a) + 16 * n := by rw [ha]
    _ = 8 * (-3 * a + 2 * n)  := by ring
```

## Walkthrough

- Since $8$ and $5$ are coprime, Bézout's identity guarantees integers $x,y$ with $8x+5y=1$ — here $x=2,y=-3$ works ($8\cdot2+5\cdot(-3)=1$), which is why the proof writes $n$ as $-3(5n)+16n$.
- Substituting the hypothesis `ha : 5 * n = 8 * a` turns this into a multiple of `8`, giving the witness for `8 ∣ n`.
- This only works because `8` and `5` share no common factor — if the divisor and multiplier shared a factor, no such combination would isolate `n`.

## Back-link

- [Module 3 – Parity, Divisibility & Number Theory](../03-Parity%20Divisibility%20%26%20Number%20Theory.md)
