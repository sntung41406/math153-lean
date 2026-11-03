# `Real.sq_sqrt`

**Meaning.** The lemma `Real.sq_sqrt : 0 ≤ x → √x ^ 2 = x` — squaring a square root gives back the number. `√x` is notation for `Real.sqrt x`.

**Example.**
```lean
import Mathlib

example : (√3 : ℝ) ^ 2 = 3 := Real.sq_sqrt (by norm_num)
```

**Use it when** you need to remove a square root. The input is a proof of `0 ≤ x`; for a specific number, `by norm_num` supplies it.

**Reference.** [Mathlib documentation — `Real.sq_sqrt`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Real/Sqrt.html#Real.sq_sqrt)
