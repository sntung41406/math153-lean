# `Even`

**Meaning.** `Even n` says `n` is even. Mathlib defines it as `∃ r, n = r + r` — note `r + r`, not `2 * r`.

**Example.**
```lean
import Mathlib

example : Even (10 : ℤ) := by
  use 5
  norm_num
```

**Use it when** a statement is about evenness. To prove `Even n`, `use` a witness `r` and check `n = r + r`. To use a hypothesis `h : Even n`, write `obtain ⟨r, hr⟩ := h` to get `hr : n = r + r`.

**Reference.** [Mathlib documentation — `Even`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Even.html#Even)
