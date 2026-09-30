# `Odd`

**Meaning.** `Odd n` says `n` is odd. Mathlib defines it as `∃ k, n = 2 * k + 1`.

**Example.**
```lean
import Mathlib

example : Odd (7 : ℤ) := by
  use 3
  norm_num
```

**Use it when** a statement is about oddness. To prove `Odd n`, `use` a witness `k` and check `n = 2 * k + 1`. To use a hypothesis `h : Odd n`, write `obtain ⟨k, hk⟩ := h`. The witness can be negative: `Odd (-3 : ℤ)` has witness `-2`.

**Reference.** [Mathlib documentation — `Odd`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Parity.html#Odd)
