# `calc`

**Meaning.** `calc` builds a proof as an explicit chain of equalities or inequalities, where each step must be individually justified.

**Example.**
```lean
import Mathlib

example (a : ℤ) (h : a = 2) : a + 1 = 3 := by
  calc a + 1 = 2 + 1 := by rw [h]
    _         = 3     := by norm_num
```

**What `_` means.** In every step after the first, `_` stands for the right-hand side of the previous step, and Lean fills it in for you. So `_ = 3` above reads "(`2 + 1`) `= 3`". You can also start the first line with just the expression and put `_` at the start of every step, which lines the relations up:
```lean
example (a : ℤ) (h : a = 2) : a + 1 = 3 := by
  calc a + 1
    _ = 2 + 1 := by rw [h]
    _ = 3     := by norm_num
```
Both forms mean the same thing.

**Use it when** the reasoning has more than one step and you want each link checked, or a single tactic can't see the whole chain at once.

**Reference.** [Lean 4 documentation — `calc`](https://lean4.dev/tactics/advanced/calc)
