# `obtain` patterns

**Meaning.** `obtain` takes a hypothesis apart using a pattern: `⟨h1, h2⟩` unpacks an "and" (or a "there exists"), and `h1 | h2` splits an "or" into two cases.

**Example.**
```lean
import Mathlib

example {x y : ℤ} (h : x = 1 ∧ y = 2) : x + y = 3 := by
  obtain ⟨hx, hy⟩ := h
  rw [hx, hy]
  norm_num

example {x : ℝ} (h : x = 1 ∨ x = -1) : x ^ 2 = 1 := by
  obtain hx | hx := h
  · rw [hx]
    norm_num
  · rw [hx]
    norm_num
```

**Use it when** a hypothesis is an "and", "or" or "there exists" statement and you need its pieces. For `∃ b, P b`, the pattern `⟨b, hb⟩` gives a new variable `b` and the fact `hb : P b`. The angle brackets `⟨ ⟩` also appear later for *building* such statements.

**Reference.** [Lean 4 documentation — `rcases` and `obtain`](https://lean4.dev/tactics/mathlib/rcases)
