# Module 8 - Set equality example

## Statement

Prove $\{x \in \mathbb{Z} \mid x \text{ is odd}\} = \{a \in \mathbb{Z} \mid \exists k,\ a = 2k-1\}$.

## Code

```lean
import Mathlib

example : {x : ℤ | Odd x} = {a : ℤ | ∃ k, a = 2 * k - 1} := by
  ext x
  constructor
  · rintro ⟨l, hl⟩
    exact ⟨l + 1, by rw [hl]; ring⟩
  · rintro ⟨k, hk⟩
    exact ⟨k - 1, by rw [hk]; ring⟩
```

## Walkthrough

- [`ext`](../../../Glossary/ext.md) `x` reduces the set equality to a single iff: `x ∈ {x | Odd x} ↔ x ∈ {a | ∃ k, a = 2*k-1}`, which unfolds to [`Odd x`](../../../Glossary/Odd.md) `↔ ∃ k, x = 2*k-1`. [`constructor`](../../../Glossary/constructor.md) splits it into the two directions.
- Forward: [`rintro`](../../../Glossary/rintro.md) `⟨l, hl⟩` destructures `Odd x` (i.e. `∃ l, x = 2*l+1`) directly in one step. The witness `l+1` works, since `x = 2l+1 = 2(l+1)-1`.
- Backward: `rintro ⟨k, hk⟩` destructures `∃ k, x = 2k-1`. The witness `k-1` works for `Odd x`, since `x = 2k-1 = 2(k-1)+1`.
- Each direction ends with `by rw [...]; ring`: [`rw`](../../../Glossary/rw.md) substitutes the hypothesis, and [`ring`](../../../Glossary/ring.md) proves the small algebraic identity that makes the chosen witness correct.

## Back-link

- [Module 8 – Sets](../08-Sets.md)
