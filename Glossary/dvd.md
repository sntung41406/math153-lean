# `∣` (divides)

**Meaning.** `a ∣ b` means "`a` divides `b`": `∃ c, b = a * c`. Type it in VS Code with `\|` or `\mid`. It is a different symbol from the ordinary bar `|` on your keyboard.

**Example.**
```lean
import Mathlib

example : (4 : ℤ) ∣ 12 := by
  use 3
  norm_num
```

**Use it when** a statement is about divisibility. To prove `a ∣ b`, `use` a witness `c` and check `b = a * c`. To use `h : a ∣ b`, write `obtain ⟨c, hc⟩ := h` to get `hc : b = a * c`. Say which numbers you mean: on `ℕ` the witness must be a natural number, while on `ℤ` it may be negative.

**Reference.** [Mathlib documentation — divisibility](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Divisibility/Basic.html#semigroupDvd)
