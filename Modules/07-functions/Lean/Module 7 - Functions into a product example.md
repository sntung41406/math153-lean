# Module 7 - Functions into a product example

## Statement

Let $q : \mathbb{Z} \to \mathbb{Z} \times \mathbb{Z}$ be $q(m) = (m+1,\ 2-m)$. Prove $q$ is injective but not surjective.

## Code

```lean
import Mathlib

open Function

def q (m : ℤ) : ℤ × ℤ := (m + 1, 2 - m)

example : Injective q := by
  intro m n h
  have h1 : (q m).1 = (q n).1 := congrArg Prod.fst h
  dsimp only [q] at h1
  linarith

example : ¬ Surjective q := by
  intro h
  obtain ⟨m, hm⟩ := h (0, 1)
  have h1 : (q m).1 = 0 := congrArg Prod.fst hm
  have h2 : (q m).2 = 1 := congrArg Prod.snd hm
  dsimp only [q] at h1 h2
  omega
```

## Walkthrough

- `ℤ × ℤ` is the type of ordered pairs of integers, and `(m + 1, 2 - m)` is one such pair. For a pair `x`, the projections [`x.1` and `x.2`](../../../Glossary/Prod.fst-snd.md) (also written `Prod.fst x` and `Prod.snd x`) are its first and second coordinates.
- **Injective.** `intro m n h` gives `h : q m = q n`, an equation between pairs. [`congrArg`](../../../Glossary/congrArg.md) `Prod.fst h` applies the first projection to both sides, giving `h1 : (q m).1 = (q n).1`.
- `dsimp only [q] at h1` unfolds `q` and reads off the first coordinate, so `h1 : m + 1 = n + 1`. [`linarith`](../../../Glossary/linarith.md) concludes `m = n`. The second coordinate is never needed.
- **Not surjective.** Assume `h : Surjective q`. Applied to the pair `(0, 1)`, it gives `m` with `hm : q m = (0, 1)`.
- Applying each projection to `hm` gives `h1 : (q m).1 = 0` and `h2 : (q m).2 = 1`. After `dsimp only [q]`, these are `m + 1 = 0` and `2 - m = 1`.
- The first equation forces `m = -1`, and the second forces `m = 1`. [`omega`](../../../Glossary/omega.md) finds this contradiction in integer arithmetic.

## Back-link

- [Module 7 – Functions](../07-Functions.md)
