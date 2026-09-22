# `omega`

**Meaning.** `omega` proves goals about whole numbers (`ℕ` and `ℤ`) that involve only `+`, `-`, comparisons and multiplication by fixed numbers.

**Example.**
```lean
import Mathlib

example (n : ℕ) (h : n ≠ 0) : 1 ≤ n := by omega
```

**Use it when** a small step about whole numbers is obvious to you but not to `linarith` — here, `linarith` cannot use `h : n ≠ 0` at all, since it isn't a comparison `linarith` reads, while `omega` reasons about `≠` directly. It does not handle `x * y` or powers of variables.

**Reference.** [Lean 4 documentation — `omega`](https://lean4.dev/tactics/automation/omega)
