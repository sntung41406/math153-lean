# Module 3 - Combining coprime divisors example

## Statement

Prove that if $8\mid m$ and $5\mid m$, then $40\mid m$.

## Code

```lean
import Mathlib

example {m : ℤ} (h1 : 8 ∣ m) (h2 : 5 ∣ m) : 40 ∣ m := by
  obtain ⟨a, ha⟩ := h1
  obtain ⟨b, hb⟩ := h2
  use -3 * a + 2 * b
  calc
    m = -15 * m + 16 * m         := by ring
    _ = -15 * (8 * a) + 16 * m   := by rw [ha]
    _ = -15 * (8 * a) + 16 * (5 * b) := by rw [hb]
    _ = 40 * (-3 * a + 2 * b)    := by ring
```

## Walkthrough

- We have two witnesses to work with: `ha : m = 8 * a` and `hb : m = 5 * b`.
- The same Bézout combination as before ($8\cdot2+5\cdot(-3)=1$, scaled by $m$) lets us rewrite `m` as `-15m + 16m`, then substitute each hypothesis into one copy of `m`, producing a multiple of `40`.
- Since `8` and `5` are coprime, their product `40` is exactly the smallest number divisible by both — this pattern generalizes to combining any two coprime divisors.

## Back-link

- [Module 3 – Parity, Divisibility & Number Theory](../03-Parity%20Divisibility%20%26%20Number%20Theory.md)
