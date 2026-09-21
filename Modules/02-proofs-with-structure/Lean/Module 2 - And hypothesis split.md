# Module 2 - And hypothesis split

## Statement

Use `obtain` to split an "and" hypothesis into its two separate parts.

## Code

```lean
import Mathlib

example {x y : ℤ} (h : 2 * x - y = 4 ∧ y - x + 1 = 2) : x = 5 := by
  obtain ⟨h1, h2⟩ := h
  calc
    x = 2 * x - y + (y - x + 1) - 1 := by ring
    _ = 4 + 2 - 1                    := by rw [h1, h2]
    _ = 5                            := by ring
```

## Walkthrough

- `h : 2 * x - y = 4 ∧ y - x + 1 = 2` is a single hypothesis packaging two facts together with [`∧`](../../../Glossary/and.md) ("and").
- `obtain ⟨h1, h2⟩ := h` uses the angle-bracket pattern `⟨h1, h2⟩` (rather than the `|` pattern used for "or") to unpack it into two ordinary hypotheses, `h1` and `h2`, that can be used independently — exactly as if they had been given as two separate hypotheses from the start.
- The rest of the proof is an ordinary calculation using both.

## Back-link

- [Module 2 – Proofs with Structure](../02-Proofs%20with%20Structure.md)
