# Module 3 - Non-divisibility example

## Statement

Prove that $5$ does not divide $12$, because $12$ lies strictly between the consecutive multiples $5\cdot 2=10$ and $5\cdot 3=15$.

## Code

```lean
import Mathlib

example : ¬ (5 : ℤ) ∣ 12 := by
  rintro ⟨k, hk⟩
  have h1 : 2 < k := by linarith
  have h2 : k < 3 := by linarith
  omega
```

## Walkthrough

- The goal starts with [`¬`](../../../Glossary/not.md) ("not"). To prove `¬ P`, you assume `P` and show that this leads to something impossible.
- [`rintro`](../../../Glossary/rintro.md) `⟨k, hk⟩` does two things at once: it assumes `5 ∣ 12`, and it takes that assumption apart into a witness `k` and the fact `hk : 12 = 5 * k`. Now the goal is `False` — we must reach something impossible.
- `h1 : 2 < k` holds because $5\cdot 2=10<12=5k$. `linarith` finds this from `hk`.
- `h2 : k < 3` holds because $5k=12<15=5\cdot 3$. Again `linarith` finds it.
- No integer lies strictly between `2` and `3`. [`omega`](../../../Glossary/omega.md) knows that `k` is an integer, so it sees that `h1` and `h2` cannot both be true, and closes the goal. Here `linarith` would also work: for integers, it first turns `2 < k` into `3 ≤ k`, which contradicts `k < 3`. What matters is that `k` is an integer: if `k` were a rational number (`k : ℚ`), both tactics would fail, because `k = 2.5` lies between `2` and `3`.

**A shortcut.** The line `example : ¬ (5 : ℤ) ∣ 12 := by decide` also works. [`decide`](../../../Glossary/decide.md) checks the statement by direct computation. That is a fine way to *check* a numeric fact, but it does not show the reason, so in this course we write the proof above.

## Back-link

- [Module 3 – Parity, Divisibility & Number Theory](../03-Parity%20Divisibility%20%26%20Number%20Theory.md)
