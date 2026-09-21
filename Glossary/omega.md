# `omega`

**Meaning.** `omega` proves goals about whole numbers (`ℕ` and `ℤ`) that involve only `+`, `-`, comparisons and multiplication by fixed numbers.

**Example.**
```lean
import Mathlib

example (n : ℕ) (h : n < 2) : n ≤ 1 := by omega
```

**Use it when** a small step about whole numbers is obvious to you but not to `linarith`, such as turning `n < 2` into `n ≤ 1`. It does not handle `x * y` or powers of variables.

**Reference.** [Lean 4 documentation — `omega`](https://lean4.dev/tactics/automation/omega)
