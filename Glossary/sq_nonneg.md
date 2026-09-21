# `sq_nonneg`

**Meaning.** The Mathlib lemma `sq_nonneg a : 0 ≤ a ^ 2` — every square is nonnegative.

**Example.**
```lean
import Mathlib

example (m n : ℤ) (h : m ^ 2 + n ≤ 2) : n ≤ 2 := by nlinarith [sq_nonneg m]
```

**Use it when** a step needs the fact that a square is at least zero. Automation such as `nlinarith` often needs it passed in explicitly, as `nlinarith [sq_nonneg m]`.

**Reference.** [Mathlib documentation — `sq_nonneg`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Order/Ring/Unbundled/Basic.html#sq_nonneg)
