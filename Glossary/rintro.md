# `rintro`

**Meaning.** `rintro` assumes the hypothesis of the goal and takes it apart with a pattern, in one step. It works like an assumption followed by [`obtain`](obtain.md). The special pattern `rfl` assumes an equation `x = a` and replaces `x` by `a` everywhere.

**Example.**
```lean
import Mathlib

example : ¬ (2 : ℤ) ∣ 7 := by
  rintro ⟨k, hk⟩
  have h1 : 3 < k := by linarith
  have h2 : k < 4 := by linarith
  omega
```

**Use it when** the goal is "if … then …" or a [`¬`](not.md) statement, and you want to use its hypothesis immediately. Above, `rintro ⟨k, hk⟩` assumes `2 ∣ 7` and extracts `hk : 7 = 2 * k`.

**Reference.** [Lean documentation — `rintro`](https://leanprover-community.github.io/mathlib4_docs/Init/RCases.html#Lean.Parser.Tactic.rintro)
