# `not_lt`

**Meaning.** The Mathlib lemma `not_lt : ¬a < b ↔ b ≤ a` — "`a` is not less than `b`" is the same as "`b` is at most `a`".

**Example.**
```lean
import Mathlib

example {x : ℝ} (h : ¬ x < 2) : 2 ≤ x := not_lt.mp h
```

**Use it when** a hypothesis is a negated strict inequality and you want an ordinary inequality, typically straight after [`by_contra`](by_contra.md). It is an [`↔`](iff.md): `.mp` goes from `¬a < b` to `b ≤ a`, and `.mpr` goes back.

**Reference.** [Mathlib documentation — `not_lt`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Order/Defs/LinearOrder.html#not_lt)
