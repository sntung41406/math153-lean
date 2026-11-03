# `dvd_trans`

**Meaning.** The lemma `dvd_trans : a ∣ b → b ∣ c → a ∣ c` — divisibility passes along a chain.

**Example.**
```lean
import Mathlib

example {a b c : ℕ} (h1 : a ∣ b) (h2 : b ∣ c) : a ∣ c := dvd_trans h1 h2
```

**Use it when** you know a divisor of a divisor. A proof `h : a ∣ b` can also be used as `h.trans h2`, which means the same thing.

**Reference.** [Mathlib documentation — `dvd_trans`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Divisibility/Basic.html#dvd_trans)
