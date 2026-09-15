# Module 1 - Inequality proof by calc

## Statement

Formalize a proof-by-calculation of an inequality using `calc`, substituting inequality hypotheses with `linarith` and closing a pure numeric comparison with `norm_num`.

## Code

```lean
import Mathlib

example {x y : ℤ} (hx : x + 3 ≤ 2) (hy : y + 2 * x ≥ 3) : y > 3 := by
  calc
    y = y + 2 * x - 2 * x := by ring
    _ ≥ 3 - 2 * x         := by linarith
    _ = 9 - 2 * (x + 3)   := by ring
    _ ≥ 9 - 2 * 2         := by linarith
    _ > 3                 := by norm_num
```

## Walkthrough

Mirrors the by-hand proof: rearrange, substitute an inequality, rearrange, substitute the other inequality, then compare numbers. Each `calc` step's relation symbol (`=`, `≥`, `>`) matches the reasoning used to justify it, and Lean tracks how they chain together (here to an overall `>`).

- `by linarith` (line 2): proves `y + 2 * x - 2 * x ≥ 3 - 2 * x` using the hypothesis `hy : y + 2 * x ≥ 3` from context — `linarith` automatically searches the local hypotheses for a linear combination that closes the goal, so it doesn't need `hy` passed explicitly (though `linarith [hy]` also works and can be clearer to read).
- `by linarith` (line 4): similarly closes `9 - 2 * (x + 3) ≥ 9 - 2 * 2` using `hx : x + 3 ≤ 2`.
- `by norm_num`: closes the step that is now a pure numeric fact (`9 - 2 * 2 > 3`), with no variables left.

## Common pitfalls

- **`linarith` only handles *linear* arithmetic.** It treats any product of two unknowns (like `x * y`) as an opaque term it can't reason about — for goals that genuinely need multiplying two variables together, you need `nlinarith` instead (which tries a bounded set of nonlinear combinations) or an explicit algebraic step.
- **`linarith` searches local hypotheses automatically.** You usually don't need to pass hypotheses explicitly (`linarith` alone often suffices), but passing facts not already in context (`linarith [extra_fact]`) is sometimes necessary.

## Back-link

- [Module 1 – Proofs by Calculation](../01-Proofs%20by%20Calculation.md)
