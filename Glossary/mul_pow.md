# `mul_pow`

**Meaning.** The lemma `mul_pow a b n : (a * b) ^ n = a ^ n * b ^ n`.

**Example.**
```lean
import Mathlib

example (a b : ℝ) : (a * b) ^ 2 = a ^ 2 * b ^ 2 := mul_pow a b 2
```

**Use it when** you need this rewrite as one step of a [`rw`](rw.md) chain. To prove a whole identity of this kind, [`ring`](ring.md) is usually simpler.

**Reference.** [Mathlib documentation — `mul_pow`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Basic.html#mul_pow)
