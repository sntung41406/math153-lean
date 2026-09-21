# Module 2 - Intermediate step example

## Statement

Establish an intermediate fact with `have`, then use it inside a later `calc` chain.

## Code

```lean
import Mathlib

example {a b : ℝ} (h1 : a - 5 * b = 4) (h2 : b + 2 = 3) : a = 9 := by
  have hb : b = 1 := by linarith
  calc
    a = a - 5 * b + 5 * b := by ring
    _ = 4 + 5 * 1         := by rw [h1, hb]
    _ = 9                 := by ring
```

## Walkthrough

- [`have`](../../../Glossary/have.md) `hb : b = 1 := by linarith` proves the intermediate fact and gives it the name `hb`, adding it to the list of hypotheses in the Infoview. `linarith` finds this directly from `h2` in context.
- The `calc` block then proceeds exactly as in Module 1, except `rw [h1, hb]` now substitutes both the original hypothesis `h1` and the newly-proved `hb`.
- Placing the cursor right before `calc` shows `hb : b = 1` already sitting alongside `h1` and `h2` in the Infoview — it's just another known fact to draw on.

## Back-link

- [Module 2 – Proofs with Structure](../02-Proofs%20with%20Structure.md)
