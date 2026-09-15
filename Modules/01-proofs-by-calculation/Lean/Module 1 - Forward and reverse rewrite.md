# Module 1 - Forward and reverse rewrite

## Statement

Use `rw` in both directions — forward (`rw [h]`) and reverse (`rw [← h]`) — to prove `y = z` from two hypotheses that each equal `x + 1`.

## Code

```lean
import Mathlib

example {x y z : ℝ} (h1 : y = x + 1) (h2 : z = x + 1) : y = z := by
  calc
    y = x + 1 := by rw [h1]
    _ = z     := by rw [← h2]
```

## Walkthrough

- `rw [h1]` (forward): `h1 : y = x + 1`, so this replaces `y` with `x + 1` in the goal — moving left-to-right along the hypothesis.
- `rw [← h2]` (reverse): `h2 : z = x + 1`, but here we want to turn `x + 1` back into `z`, i.e. move right-to-left. The `←` arrow (type it with `\l` then Tab in VS Code) reverses the direction of the substitution.
- Reverse rewriting is useful whenever the fact you need runs the "wrong way" for a direct forward substitution.

## Back-link

- [Module 1 – Proofs by Calculation](../01-Proofs%20by%20Calculation.md)
