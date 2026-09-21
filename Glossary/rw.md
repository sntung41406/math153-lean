# `rw`

**Meaning.** `rw` rewrites the goal by replacing one side of a given equality with the other, wherever it matches.

**Example.**
```lean
import Mathlib

example (a b : ℕ) (h : a = b) : a + 1 = b + 1 := by rw [h]
```

**Use it when** you have an equality hypothesis and want to substitute it into the goal — `rw [← h]` substitutes in the reverse direction.

**Reference.** [Lean 4 documentation — `rw`](https://lean4.dev/tactics/core/rw)
