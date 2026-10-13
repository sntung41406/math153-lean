# `Nat.pos_of_dvd_of_pos`

**Meaning.** The lemma `Nat.pos_of_dvd_of_pos : m ∣ n → 0 < n → 0 < m` for natural numbers — a divisor of a positive number is positive.

**Example.**
```lean
import Mathlib

example {m : ℕ} (h : m ∣ 6) : 0 < m := Nat.pos_of_dvd_of_pos h (by norm_num)
```

**Use it when** you know `m ∣ n` with `n` positive and need to rule out `m = 0`. Together with [`Nat.le_of_dvd`](Nat.le_of_dvd.md) it places a divisor of `n` between `1` and `n`.

**Reference.** [Lean documentation — `Nat.pos_of_dvd_of_pos`](https://leanprover-community.github.io/mathlib4_docs/Init/Data/Nat/Dvd.html#Nat.pos_of_dvd_of_pos)
