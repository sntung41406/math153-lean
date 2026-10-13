# Module 4 - Exists unique example

## Statement

Prove unique existence (`∃!`) by exhibiting a witness and then proving uniqueness.

## Code

```lean
import Mathlib

example : ∃! a : ℝ, 3 * a + 1 = 7 := by
  use 2
  dsimp
  constructor
  · norm_num
  intro y hy
  calc
    y = (3 * y + 1 - 1) / 3 := by ring
    _ = (7 - 1) / 3          := by rw [hy]
    _ = 2                    := by norm_num
```

## Walkthrough

- [`∃!`](../../../Glossary/exists-unique.md) `a, P a` is short for: there is an `a` with `P a`, and every `y` with `P y` equals `a`. `use 2` commits to `2` as the witness. The remaining goal is displayed in a raw form, and [`dsimp`](../../../Glossary/dsimp.md) tidies it to `3 * 2 + 1 = 7 ∧ ∀ (y : ℝ), 3 * y + 1 = 7 → y = 2`: existence and uniqueness.
- [`constructor`](../../../Glossary/constructor.md) splits these into two goals. The first, `· norm_num`, checks `3 * 2 + 1 = 7`.
- The second goal is the uniqueness condition: `∀ y, 3 * y + 1 = 7 → y = 2`. [`intro`](../../../Glossary/intro.md) `y hy` introduces an arbitrary candidate `y` along with the assumption `hy` that it also satisfies the equation, and the `calc` block shows `y` must in fact equal `2`.
- Both parts are necessary: existence alone would only show *some* solution exists, not that it's the only one.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
