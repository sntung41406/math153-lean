# Module 3 - Parity case split example

## Statement

Prove $n^2+n+4$ is even for every integer $n$, by splitting into the even and odd cases.

## Code

```lean
import Mathlib

example (n : ℤ) : Even (n ^ 2 + n + 4) := by
  obtain hn | hn := Int.even_or_odd n
  · obtain ⟨x, hx⟩ := hn
    use 2 * x ^ 2 + x + 2
    rw [hx]; ring
  · obtain ⟨x, hx⟩ := hn
    use 2 * x ^ 2 + 3 * x + 3
    rw [hx]; ring
```

## Walkthrough

- [`Int.even_or_odd`](../../../Glossary/Int.even_or_odd.md) `n : Even n ∨ Odd n` is a lemma stating every integer is even or odd. `obtain hn | hn := Int.even_or_odd n` case-splits on it.
- Each branch destructures its own case's witness. Note Mathlib's [`Even`](../../../Glossary/Even.md) `n` unfolds to `∃ r, n = r + r` (not `∃ r, n = 2 * r`) — so `hx : n = x + x` in the even branch, not `n = 2 * x`. `use` still commits to a witness for the goal in that same `r + r` shape; `rw [hx]; ring` handles the substitution and the resulting algebra in one step.
- Both branches prove the *same* goal, `Even (n ^ 2 + n + 4)`, just under different assumptions about `n`'s shape — together they cover every possible integer.

## Back-link

- [Module 3 – Parity, Divisibility & Number Theory](../03-Parity%20Divisibility%20%26%20Number%20Theory.md)
