# Module 3 - Divisibility example

## Statement

Prove that if $a\mid b$, then $a\mid b^2+2b$, by unfolding divisibility and constructing an explicit witness.

## Code

```lean
import Mathlib

example {a b : ℤ} (hab : a ∣ b) : a ∣ b ^ 2 + 2 * b := by
  obtain ⟨k, hk⟩ := hab
  use k * (a * k + 2)
  calc
    b ^ 2 + 2 * b = (a * k) ^ 2 + 2 * (a * k) := by rw [hk]
    _ = a * (k * (a * k + 2))                  := by ring
```

## Walkthrough

- [`a ∣ b`](../../../Glossary/dvd.md) unfolds to `∃ k, b = a * k`; `obtain ⟨k, hk⟩ := hab` extracts that witness.
- The goal `a ∣ b ^ 2 + 2 * b` needs its own witness — `use k * (a * k + 2)` proposes one, arrived at by substituting `hk` and factoring out `a`.
- The `calc` block verifies the factorization is correct.

## Back-link

- [Module 3 – Parity, Divisibility & Number Theory](../03-Parity%20Divisibility%20%26%20Number%20Theory.md)
