# Module 4 - Iff example

## Statement

Prove an "if and only if" statement by splitting into its two directions with `constructor`.

## Code

```lean
import Mathlib

example {a : ℚ} : 3 * a + 1 ≤ 7 ↔ a ≤ 2 := by
  constructor
  · intro h
    calc a = ((3 * a + 1) - 1) / 3 := by ring
      _ ≤ (7 - 1) / 3               := by linarith
      _ = 2                          := by norm_num
  · intro h
    calc 3 * a + 1 ≤ 3 * 2 + 1 := by linarith
      _ = 7                       := by norm_num
```

## Walkthrough

- [`constructor`](../../../Glossary/constructor.md) splits the [`↔`](../../../Glossary/iff.md) goal `3 * a + 1 ≤ 7 ↔ a ≤ 2` into two separate implication goals: `3 * a + 1 ≤ 7 → a ≤ 2` and `a ≤ 2 → 3 * a + 1 ≤ 7`.
- The first `·` block proves the forward direction: [`intro`](../../../Glossary/intro.md) `h` assumes `h : 3 * a + 1 ≤ 7`, then a calculation (with `linarith` substituting `h`) derives `a ≤ 2`.
- The second `·` block proves the reverse direction: `intro h` assumes `h : a ≤ 2`, then a calculation derives `3 * a + 1 ≤ 7`.
- Both directions are genuinely different arguments — neither one alone would establish the "if and only if".
- To see how a proved `↔` is *used*, continue with [Module 4 - Using an iff example](Module%204%20-%20Using%20an%20iff%20example.md).

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
