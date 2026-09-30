# `Int.modEq_iff_dvd`

**Meaning.** The Mathlib lemma `Int.modEq_iff_dvd : a ≡ b [ZMOD n] ↔ n ∣ b - a` — a congruence is the same as divisibility of the difference. Notice the order `b - a`.

**Example.**
```lean
import Mathlib

example : (-5 : ℤ) ≡ 1 [ZMOD 3] := by
  rw [Int.modEq_iff_dvd]
  use 2
  norm_num
```

**Use it when** you want to prove or use a congruence through a divisibility witness. After `rw [Int.modEq_iff_dvd]`, the goal above is `3 ∣ 1 - -5`, so the witness is `2`. On paper, with `a - b`, it would be `-2`.

**Reference.** [Mathlib documentation — `Int.modEq_iff_dvd`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Int/ModEq.html#Int.modEq_iff_dvd)
