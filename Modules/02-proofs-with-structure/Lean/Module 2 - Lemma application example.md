# Module 2 - Lemma application example

## Statement

Use `apply` to invoke a previously-proved lemma (`ne_of_lt`), turning a disequality goal into an inequality goal.

## Code

```lean
import Mathlib

example {x : ℚ} (hx : 3 * x = 2) : x ≠ 1 := by
  apply ne_of_lt
  calc
    x = 3 * x / 3 := by ring
    _ = 2 / 3     := by rw [hx]
    _ < 1         := by norm_num
```

## Walkthrough

- The goal `x ≠ 1` uses [`≠`](../../../Glossary/ne.md) ("not equal"): it says `x = 1` is false.
- The Mathlib lemma [`ne_of_lt`](../../../Glossary/ne_of_lt.md) `: a < b → a ≠ b` says a strictly smaller number can't be equal to a larger one.
- [`apply`](../../../Glossary/apply.md) `ne_of_lt` matches this lemma's conclusion against our goal `x ≠ 1`, replacing the goal with the lemma's hypothesis: `x < 1`.
- The rest is an ordinary calculation proving that new, simpler goal, with `norm_num` closing the final numeric comparison `2 / 3 < 1`.
- This is *backward reasoning*: instead of building up to the goal, we reduce the goal to something easier to prove, using a fact someone already established.

## Back-link

- [Module 2 – Proofs with Structure](../02-Proofs%20with%20Structure.md)
