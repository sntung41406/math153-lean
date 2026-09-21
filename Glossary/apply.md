# `apply`

**Meaning.** `apply` uses a lemma backward: if the lemma's conclusion matches the goal, the goal is replaced by the lemma's hypotheses.

**Example.**
```lean
import Mathlib

example {x : ℚ} (h : x < 1) : x ≠ 1 := by
  apply ne_of_lt
  exact h
```

**Use it when** you know a lemma that would finish the goal, and it is easier to prove that lemma's hypotheses than the goal itself. If the lemma has several hypotheses, you get one new goal for each.

**Reference.** [Lean 4 documentation — `exact` and `apply`](https://lean4.dev/tactics/core/exact-apply)
