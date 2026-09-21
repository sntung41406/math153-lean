# `mul_right_cancel₀`

**Meaning.** The Mathlib lemma `mul_right_cancel₀ : b ≠ 0 → a * b = c * b → a = c` — a common nonzero factor on the right can be cancelled.

**Example.**
```lean
import Mathlib

example {t : ℝ} (ht : t ≠ 0) (h : t * t = 3 * t) : t = 3 := mul_right_cancel₀ ht h
```

**Use it when** both sides of an equation share a factor and you can prove that factor is nonzero. The first input is always that side condition. (`mul_left_cancel₀` does the same for a factor on the left.)

**Version note.** Lemma names ending in `₀` have been renamed in Mathlib before. Re-check this name against the current Mathlib each term.

**Reference.** [Mathlib documentation — `mul_right_cancel₀`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/GroupWithZero/Defs.html#mul_right_cancel₀)
