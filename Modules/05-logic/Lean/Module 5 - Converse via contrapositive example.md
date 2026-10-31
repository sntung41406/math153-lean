# Module 5 - Converse via contrapositive example

## Statement

Prove the converse "if $n^2$ is even then $n$ is even" by proving its contrapositive instead: if $n$ is odd then $n^2$ is odd.

## Code

```lean
import Mathlib

example {n : ℤ} (h : Even (n ^ 2)) : Even n := by
  contrapose! h
  rw [Int.not_even_iff_odd] at h ⊢
  obtain ⟨k, hk⟩ := h
  use 2 * k ^ 2 + 2 * k
  rw [hk]
  ring
```

## Walkthrough

- The statement is the implication `Even (n ^ 2) → Even n`, with the premise given as the hypothesis `h`.
- [`contrapose!`](../../../Glossary/contrapose.md) `h` replaces it by its contrapositive. The hypothesis becomes `h : ¬Even n` and the goal becomes `¬Even (n ^ 2)`. The premise and the conclusion swap places, and both are negated.
- [`Int.not_even_iff_odd`](../../../Glossary/Int.not_even_iff_odd.md) `: ¬Even n ↔ Odd n` says that an integer that is not even is odd. [`rw`](../../../Glossary/rw.md) `[…] at h ⊢` uses it in the hypothesis and in the goal (`⊢` stands for the goal). Now `h : Odd n` and the goal is `Odd (n ^ 2)`.
- This is the contrapositive from the main note: if $n$ is odd then $n^2$ is odd. From here the proof is a parity calculation, as in Module 3.
- [`obtain`](../../../Glossary/obtain.md) `⟨k, hk⟩ := h` gives `hk : n = 2 * k + 1`. [`Odd`](../../../Glossary/Odd.md) `(n ^ 2)` needs a witness `m` with `n ^ 2 = 2 * m + 1`. Since $(2k+1)^2 = 4k^2+4k+1 = 2(2k^2+2k)+1$, we [`use`](../../../Glossary/use.md) `2 * k ^ 2 + 2 * k`.
- `rw [hk]` replaces `n` by `2 * k + 1`, and [`ring`](../../../Glossary/ring.md) checks `(2 * k + 1) ^ 2 = 2 * (2 * k ^ 2 + 2 * k) + 1`.

## Back-link

- [Module 5 – Logic](../05-Logic.md)
