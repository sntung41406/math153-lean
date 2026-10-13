# `interval_cases`

**Meaning.** `interval_cases n` splits the proof into one case for each possible value of `n`, when the context contains a lower bound and an upper bound for the integer or natural number `n`.

**Example.**
```lean
import Mathlib

example {n : ℕ} (h1 : 1 ≤ n) (h2 : n ≤ 3) : n ^ 2 ≤ 9 := by
  interval_cases n
  · norm_num
  · norm_num
  · norm_num
```

**Use it when** a variable can take only a few values and you want to check each one. Above, the bounds give the three cases `n = 1`, `n = 2` and `n = 3`. Both bounds must already be hypotheses before you call it.

**Reference.** [Mathlib documentation — `interval_cases`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Tactic/IntervalCases.html)
