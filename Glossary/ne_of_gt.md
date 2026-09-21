# `ne_of_gt`

**Meaning.** The Mathlib lemma `ne_of_gt : a > b → a ≠ b` — the greater-than counterpart of `ne_of_lt`.

**Example.**
```lean
import Mathlib

example {t : ℝ} (h : t ≥ 1) : t ≠ 0 := ne_of_gt (by linarith)
```

**Use it when** the goal is `a ≠ b` and you can show `a > b` — for example, the side condition `t ≠ 0` from `t > 0`.

**Reference.** [Mathlib documentation — `ne_of_gt`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Order/Defs/PartialOrder.html#ne_of_gt)
