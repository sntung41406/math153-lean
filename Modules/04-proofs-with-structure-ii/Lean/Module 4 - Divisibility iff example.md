# Module 4 - Divisibility iff example

## Statement

Let $n$ be an integer. Prove that $8\mid 5n$ if and only if $8\mid n$.

## Code

```lean
import Mathlib

example {n : ℤ} : 8 ∣ 5 * n ↔ 8 ∣ n := by
  constructor
  · intro hn
    obtain ⟨a, ha⟩ := hn
    use -3 * a + 2 * n
    calc
      n = -3 * (5 * n) + 16 * n := by ring
      _ = -3 * (8 * a) + 16 * n := by rw [ha]
      _ = 8 * (-3 * a + 2 * n) := by ring
  · intro hn
    obtain ⟨a, ha⟩ := hn
    use 5 * a
    calc
      5 * n = 5 * (8 * a) := by rw [ha]
      _ = 8 * (5 * a) := by ring
```

## Walkthrough

- [`constructor`](../../../Glossary/constructor.md) splits the [`↔`](../../../Glossary/iff.md) goal into two implications. Each one starts with [`intro`](../../../Glossary/intro.md) `hn` to assume its left side.
- **Forward direction.** This is the coprime cancellation argument from Module 3 ([Module 3 - Coprime cancellation example](../../03-parity-divisibility-number-theory/Lean/Module%203%20-%20Coprime%20cancellation%20example.md)), now used as one half of an equivalence. `hn : 8 ∣ 5 * n` gives a witness `a` with `ha : 5 * n = 8 * a`. Because $8\cdot 2+5\cdot(-3)=1$, we can write $n = -3(5n)+16n$, and then substitute `ha`. The new witness is `-3 * a + 2 * n`.
- **Reverse direction.** `hn : 8 ∣ n` gives `ha : n = 8 * a`. Multiplying by $5$ gives the witness `5 * a`.
- In both branches the name `hn` is used again. This is safe: each `·` block has its own context, so the two hypotheses never meet.
- The two directions have very different difficulty. The reverse direction is true for any multiplier in place of $5$. The forward direction needs $5$ and $8$ to be coprime: for example $8\mid 4\cdot 2$ but $8\nmid 2$.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
