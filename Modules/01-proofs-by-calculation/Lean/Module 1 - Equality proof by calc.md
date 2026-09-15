# Module 1 - Equality proof by calc

## Statement

Formalize a proof-by-calculation of an equality using a `calc` block, the `ring` tactic (algebraic rearrangement) and the `rw` tactic (substitution from a hypothesis).

## Code

```lean
import Mathlib

example {a b : ℚ} (h1 : a - b = 4) (h2 : a * b = 1) : (a + b) ^ 2 = 20 := by
  calc
    (a + b) ^ 2 = (a - b) ^ 2 + 4 * (a * b) := by ring
    _           = 4 ^ 2 + 4 * 1             := by rw [h1, h2]
    _           = 20                        := by ring
```

## Walkthrough

This is the Lean version of the three-step "algebra, substitution, algebra" pattern: expand $(a+b)^2$ into a form containing $a-b$ and $ab$; substitute the two given facts; then simplify to the target number.

- `calc` starts a chain: each line states an equality, and `_` on later lines stands for the right-hand side of the line above.
- `by ring` (line 1 and 3): `ring` is a decision procedure for commutative rings ($\mathbb{Z}, \mathbb{Q}, \mathbb{R}$) — it automatically verifies pure algebraic rearrangements like expanding $(a+b)^2$, without you needing to invoke commutativity/distributivity by name.
- `by rw [h1, h2]` (line 2): `rw` ("rewrite") replaces the left-hand side of a hypothesis with its right-hand side wherever it appears in the goal. `rw [h1, h2]` chains two substitutions: first $a-b \to 4$, then $ab \to 1$.

## Common pitfalls

- **`rw` rewrites every matching occurrence at once, not just one.** If the goal contains the same subexpression twice, `rw [h]` replaces all of them simultaneously. Mathlib's `nth_rw` tactic can target one occurrence by number, but it's deferred to a later lecture — for now, restructure the `calc` step if different occurrences need different treatment.
- **`ring` needs a genuine commutative ring.** It works over $\mathbb{Z}, \mathbb{Q}, \mathbb{R}$, but fails over $\mathbb{N}$ when the expression relies on truncated subtraction (where $a - b$ is clamped to $0$ if $a < b$).

## Back-link

- [Module 1 – Proofs by Calculation](../01-Proofs%20by%20Calculation.md)
