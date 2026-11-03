# `Nat.strong_induction_on`

**Meaning.** The strong induction principle. The form `induction n using Nat.strong_induction_on with | _ n IH =>` gives one case. You prove the goal at `n`, and `IH` says that the goal holds at every `m < n`. To use it, write `IH m hm`, where `hm : m < n`.

**Example.**
```lean
import Mathlib

example (n : ℕ) : 2 ∣ n ∨ 2 ∣ n + 1 := by
  induction n using Nat.strong_induction_on with
  | _ n IH =>
    by_cases h : n < 2
    · omega
    · have := IH (n - 2) (by omega)
      omega
```

**Use it when** the proof for `n` needs the claim at a smaller number that is not always `n - 1`. If the proof applies `IH` to different values of another variable, keep that variable under a `∀` in the statement.

**Reference.** [Mathlib documentation — `Nat.strong_induction_on`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Nat/Init.html#Nat.strong_induction_on)
