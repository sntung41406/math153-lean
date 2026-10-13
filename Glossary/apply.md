# `apply`

**Meaning.** `apply` uses a lemma backward: if the lemma's conclusion matches the goal, the goal is replaced by the lemma's hypotheses.

**Example.**
```lean
import Mathlib

example {x : ℚ} (h : x < 1) : x ≠ 1 := by
  apply ne_of_lt
  exact h

example {a : ℝ} (h : ∀ y : ℝ, y ^ 2 ≤ 4 → y ≤ a) : 2 ≤ a := by
  apply h
  norm_num
```

**Use it when** you know a lemma that would finish the goal, and it is easier to prove that lemma's hypotheses than the goal itself. If the lemma has several hypotheses, you get one new goal for each. `apply` works the same way with a hypothesis of the form [`∀`](forall.md) … [`→`](implies.md) …: in the second example, Lean matches the goal `2 ≤ a` with `y ≤ a`, takes `y` to be `2`, and leaves the antecedent `2 ^ 2 ≤ 4` as the new goal.

**Reference.** [Lean 4 documentation — `exact` and `apply`](https://lean4.dev/tactics/core/exact-apply)
