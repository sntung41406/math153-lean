# `Int.ModEq` (`≡ [ZMOD n]`)

**Meaning.** `a ≡ b [ZMOD n]` is notation for `Int.ModEq n a b`: "`a` is congruent to `b` modulo `n`". Mathlib defines it as equal remainders, `a % n = b % n`, not as divisibility. The lemma [`Int.modEq_iff_dvd`](Int.modEq_iff_dvd.md) turns it into divisibility.

**Example.**
```lean
import Mathlib

example : (17 : ℤ) ≡ 2 [ZMOD 5] := by decide
```

**Use it when** you work with congruences between integers. For specific numbers, `decide` checks them by computation. To substitute a congruence into an expression, use [`rel`](rel.md).

**Reference.** [Mathlib documentation — `Int.ModEq`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Int/ModEq.html#Int.ModEq)
