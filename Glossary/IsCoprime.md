# `IsCoprime`

**Meaning.** `IsCoprime a b` says the integers `a` and `b` are coprime. Mathlib defines it in Bézout form: `∃ u v, u * a + v * b = 1`.

**Example.**
```lean
import Mathlib

example : IsCoprime (8 : ℤ) 5 := by
  use 2, -3
  norm_num
```

**Use it when** a statement needs two integers to have no common factor. To prove it, [`use`](use.md) the two coefficients: above, $2\cdot 8+(-3)\cdot 5=1$. To use a hypothesis `h : IsCoprime a b`, write `obtain ⟨u, v, huv⟩ := h` to get `huv : u * a + v * b = 1`.

**Reference.** [Mathlib documentation — `IsCoprime`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/RingTheory/Coprime/Basic.html#IsCoprime)
