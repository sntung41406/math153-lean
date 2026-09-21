# `add_le_add_left`

**Meaning.** The Mathlib lemma `add_le_add_left : b ≤ c → ∀ a, b + a ≤ c + a` — adding the same quantity on the right of both sides preserves `≤`.

**Example.**
```lean
import Mathlib

example (x : ℤ) (h : x ≤ 2) : x + 3 ≤ 2 + 3 := add_le_add_left h 3
```

**Use it when** you want to name the exact order-preservation step instead of reaching for `linarith`. (Note the naming is easy to get backwards — `add_le_add_right` adds on the *left*.)

**Reference.** [Mathlib documentation — `add_le_add_left`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Order/Monoid/Unbundled/Basic.html#add_le_add_left)
