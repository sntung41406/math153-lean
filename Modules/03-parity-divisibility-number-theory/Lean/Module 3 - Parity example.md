# Module 3 - Parity example

## Statement

Prove that $3n+2$ is odd, given that $n$ is odd, by unfolding the definition of `Odd` and supplying a witness.

## Code

```lean
import Mathlib

example {n : ℤ} (hn : Odd n) : Odd (3 * n + 2) := by
  obtain ⟨k, hk⟩ := hn
  use 3 * k + 2
  calc
    3 * n + 2 = 3 * (2 * k + 1) + 2 := by rw [hk]
    _ = 2 * (3 * k + 2) + 1          := by ring
```

## Walkthrough

- [`Odd`](../../../Glossary/Odd.md) `n` unfolds to `∃ k, n = 2 * k + 1` in Mathlib. [`obtain`](../../../Glossary/obtain.md) `⟨k, hk⟩ := hn` extracts the witness `k` and the fact `hk : n = 2 * k + 1` from the hypothesis.
- [`use`](../../../Glossary/use.md) `3 * k + 2` commits to the witness that will make `3 * n + 2` odd, then the `calc` block verifies `3 * n + 2 = 2 * (3 * k + 2) + 1` by substituting `hk` and simplifying.

## Back-link

- [Module 3 – Parity, Divisibility & Number Theory](../03-Parity%20Divisibility%20%26%20Number%20Theory.md)
