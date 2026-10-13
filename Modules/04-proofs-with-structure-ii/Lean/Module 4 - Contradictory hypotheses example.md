# Module 4 - Contradictory hypotheses example

## Statement

Derive a numeric contradiction from two hypotheses that cannot both hold, closing an otherwise unrelated goal.

## Letting arithmetic find the contradiction

### Code

```lean
import Mathlib

example {t : ℤ} (h2 : t < 3) (h : t - 1 = 6) : t = 13 := by
  have H : (7:ℤ) < 3 := by
    have ht : t = 7 := by linarith
    rw [ht] at h2
    exact h2
  norm_num at H
```

### Walkthrough

- From `h : t - 1 = 6` we derive `t = 7` (`linarith`); substituting into `h2 : t < 3` gives `H : (7:ℤ) < 3`.
- [`norm_num`](../../../Glossary/norm_num.md) `at H` checks `H` against pure arithmetic and finds it is false: `7 < 3` can never hold. `H` becomes [`False`](../../../Glossary/False.md), and a false hypothesis closes any goal, including the unrelated `t = 13`.
- This reflects a real logical principle: once your assumptions include an impossibility, anything follows from them.

## Recognising an impossible hypothesis

### Code

```lean
import Mathlib

example {t : ℤ} (h2 : t < 3) (h : t - 1 = 6) : t = 13 := by
  have H : (7:ℤ) < 3 := by
    have ht : t = 7 := by linarith
    rw [ht] at h2
    exact h2
  contradiction
```

### Walkthrough

- This version derives the same impossible numerical hypothesis `H : (7:ℤ) < 3`.
- [`contradiction`](../../../Glossary/contradiction.md) can recognise this closed numerical proposition over the integers as false and close the goal from `H` alone. For the real-number analogue `H : (7 : ℝ) < 3`, use [`norm_num`](../../../Glossary/norm_num.md) `at H` instead. A separate proof of `¬ (7:ℤ) < 3` is unnecessary here.
- The tactic can also close goals from a statement together with its negation, but this example does not require that pair. It does not derive the contradiction directly from `t < 3` and `t - 1 = 6`; first derive the impossible numerical statement, or use [`linarith`](../../../Glossary/linarith.md) to combine the arithmetic hypotheses.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
