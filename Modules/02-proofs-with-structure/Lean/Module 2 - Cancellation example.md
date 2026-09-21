# Module 2 - Cancellation example

## Statement

Cancel a common nonzero factor from both sides of an equation, by invoking a cancellation lemma and proving its side condition.

## Code

```lean
import Mathlib

example {t : ℝ} (h1 : t ^ 2 = 3 * t) (h2 : t ≥ 1) : t ≥ 2 := by
  have h3 : t * t = 3 * t := by
    calc
      t * t = t ^ 2 := by ring
      _ = 3 * t     := by rw [h1]
  have h4 : t = 3 := mul_right_cancel₀ (ne_of_gt (by linarith)) h3
  linarith
```

## Walkthrough

- `have h3 : t * t = 3 * t := by calc ...` names the result of a whole `calc` chain. This rewrites the hypothesis so that both sides visibly share the factor `t` on the right.
- [`mul_right_cancel₀`](../../../Glossary/mul_right_cancel%E2%82%80.md) `: b ≠ 0 → a * b = c * b → a = c` is the Mathlib cancellation lemma. It needs two inputs: a proof of the side condition `t ≠ 0`, and the equation `h3`. It then gives `t = 3`.
- The side condition is proved by [`ne_of_gt`](../../../Glossary/ne_of_gt.md), the greater-than counterpart of `ne_of_lt`: from `t > 0` it gives `t ≠ 0`. The inner `(by linarith)` proves `t > 0` from `h2 : t ≥ 1`.
- Finally, `linarith` derives `t ≥ 2` from `h4 : t = 3`.
- Without the side condition there is no proof: Lean will not let you cancel a factor it cannot see is nonzero.

## Back-link

- [Module 2 – Proofs with Structure](../02-Proofs%20with%20Structure.md)
