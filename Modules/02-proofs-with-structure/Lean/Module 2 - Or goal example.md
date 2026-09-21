# Module 2 - Or goal example

## Statement

Use `right` (or `left`) to commit to one alternative of an "or" goal, then prove just that one.

## Code

```lean
import Mathlib

example {x : ℝ} (hx : 2 * x + 1 = 5) : x = 1 ∨ x = 2 := by
  right
  calc
    x = (2 * x + 1 - 1) / 2 := by ring
    _ = (5 - 1) / 2         := by rw [hx]
    _ = 2                    := by norm_num
```

## Walkthrough

- The goal starts as `x = 1 ∨ x = 2`. Since we intend to prove the second alternative, [`right`](../../../Glossary/left-right.md) changes the goal to just `x = 2` (use `left` if you intend the first alternative instead).
- The remaining goal is proved with an ordinary calculation, with `norm_num` closing the final numeric step.
- Choosing the wrong side (e.g. `left` here) would leave a goal, `x = 1`, that isn't actually provable from `hx` — always check which alternative is true before committing.

## Back-link

- [Module 2 – Proofs with Structure](../02-Proofs%20with%20Structure.md)
