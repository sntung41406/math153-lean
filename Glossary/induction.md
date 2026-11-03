# `induction`

**Meaning.** `induction n with` proves a goal about a natural number `n` by mathematical induction. It creates two cases. In `| zero =>` you prove the goal at `0`. In `| succ k IH =>` you prove it at `k + 1`, and `IH` is the inductive hypothesis at `k`. You choose the names `k` and `IH`.

**Example.**
```lean
import Mathlib

example (n : ℕ) : 2 ^ n ≥ 1 := by
  induction n with
  | zero => norm_num
  | succ k IH =>
    calc 2 ^ (k + 1) = 2 * 2 ^ k := by ring
      _ ≥ 2 * 1 := by gcongr
      _ ≥ 1 := by norm_num
```

**Use it when** a claim holds for every natural number and the case `k + 1` follows from the case `k`. To start at a number other than `0`, use [`Nat.le_induction`](Nat.le_induction.md). To use every smaller case, use [`Nat.strong_induction_on`](Nat.strong_induction_on.md).

**Reference.** [Theorem Proving in Lean 4 — Inductive Types](https://lean-lang.org/theorem_proving_in_lean4/Inductive-Types/)
