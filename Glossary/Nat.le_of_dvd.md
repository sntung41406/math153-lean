# `Nat.le_of_dvd`

**Meaning.** The lemma `Nat.le_of_dvd : 0 < n → m ∣ n → m ≤ n` for natural numbers — a divisor of a positive number is at most that number.

**Example.**
```lean
import Mathlib

example {m : ℕ} (h : m ∣ 6) : m ≤ 6 := Nat.le_of_dvd (by norm_num) h
```

**Use it when** you know `m ∣ n` and need a bound on `m`. The first input is a proof of `0 < n`; for a specific number, `by norm_num` supplies it. The condition matters: every number divides `0`, so there is no bound when `n = 0`.

**Reference.** [Lean documentation — `Nat.le_of_dvd`](https://leanprover-community.github.io/mathlib4_docs/Init/Data/Nat/Dvd.html#Nat.le_of_dvd)
