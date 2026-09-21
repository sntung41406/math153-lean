# `le_of_pow_le_pow_left₀`

**Meaning.** The Mathlib lemma `le_of_pow_le_pow_left₀ : n ≠ 0 → 0 ≤ b → a ^ n ≤ b ^ n → a ≤ b` — a shared exponent can be cancelled from an inequality when the larger base is nonnegative.

**Example.**
```lean
import Mathlib

example {a : ℝ} (h1 : 1 ^ 2 ≤ a ^ 2) (h2 : 0 ≤ a) : 1 ≤ a :=
  le_of_pow_le_pow_left₀ (by norm_num) h2 h1
```

**Use it when** you know how two powers compare and want to compare their bases. The sign condition matters: `1 ^ 2 ≤ (-2) ^ 2`, but `1 ≤ -2` is false.

**Version note.** Lemma names ending in `₀` have been renamed in Mathlib before. Re-check this name against the current Mathlib each term.

**Reference.** [Mathlib documentation — `le_of_pow_le_pow_left₀`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Order/GroupWithZero/Basic.html#le_of_pow_le_pow_left₀)
