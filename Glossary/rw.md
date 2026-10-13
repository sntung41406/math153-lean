# `rw`

**Meaning.** `rw` rewrites the goal by replacing one side of a given equality with the other, wherever it matches. It does the same with an "if and only if" statement, replacing one statement by an equivalent one.

**Example.**
```lean
import Mathlib

example (a b : ℕ) (h : a = b) : a + 1 = b + 1 := by rw [h]

example {x : ℝ} (h : x + 1 = 3 ↔ x = 2) (hx : x = 2) : x + 1 = 3 := by
  rw [h]
  exact hx
```

**Use it when** you have an equality hypothesis and want to substitute it into the goal — `rw [← h]` substitutes in the reverse direction. With `h : P ↔ Q` (see [`↔`](iff.md)), `rw [h]` changes a goal `P` into `Q`. `rw [h] at h2` rewrites inside the hypothesis `h2` instead of the goal.

**Reference.** [Lean 4 documentation — `rw`](https://lean4.dev/tactics/core/rw)
