# `Nat.le_induction`

**Meaning.** The induction principle that starts at a number `m`, not at `0`. With `hn : m ≤ n`, the form `induction n, hn using Nat.le_induction with` creates two cases. In `| base =>` you prove the goal at `m`. In `| succ k hk IH =>` you have `hk : m ≤ k` and the inductive hypothesis `IH` at `k`, and you prove the goal at `k + 1`.

**Example.**
```lean
import Mathlib

example {n : ℕ} (hn : 3 ≤ n) : 2 * n ≥ 6 := by
  induction n, hn using Nat.le_induction with
  | base => norm_num
  | succ k hk IH => omega
```

**Use it when** a claim only holds from some point on, such as a claim about all sufficiently large `n`.

**Reference.** [Mathlib documentation — `Nat.le_induction`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Nat/Init.html#Nat.le_induction)
