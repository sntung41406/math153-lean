# `push Not`

**Meaning.** `push Not` moves every `¬` in the goal inward, as far as it can go. It uses the negation rules: `¬ ∀ x, P x` becomes `∃ x, ¬ P x`, `¬ ∃ x, P x` becomes `∀ x, ¬ P x`, `¬ (P ∧ Q)` becomes `P → ¬ Q`, `¬ (P ∨ Q)` becomes `¬ P ∧ ¬ Q`, `¬ (P → Q)` becomes `P ∧ ¬ Q`, and `¬ ¬ P` becomes `P`. On numbers it also flips negated inequalities: `¬ (a < b)` becomes `b ≤ a`, and `¬ (a ≤ b)` becomes `b < a`. `push Not at h` does the same to the hypothesis `h`. To get De Morgan's form `¬ P ∨ ¬ Q` for `¬ (P ∧ Q)` instead, write `push +distrib Not`.

**Example.**
```lean
import Mathlib

example : ¬ (∀ x : ℝ, x ^ 2 ≥ x) := by
  push Not
  use (1 / 2 : ℝ)
  norm_num

example {a : ℝ} (h : ¬ ∃ x : ℝ, a < x ∧ x < a + 1) : False := by
  push Not at h
  have h' : a + 1 ≤ a + 1 / 2 := h (a + 1 / 2) (by linarith)
  linarith
```

**Use it when** a goal or hypothesis starts with `¬`, especially in front of a quantifier. After `push Not`, a goal `¬ ∀ …` becomes an `∃` goal that you prove with [`use`](use.md), and a hypothesis `¬ ∃ …` becomes a `∀` hypothesis that you can use at any value. Older code, including *The Mechanics of Proof* and *Mathematics in Lean*, writes this tactic as `push_neg`. Current Mathlib still accepts `push_neg`, but shows a warning that it is deprecated.

**Reference.** [Mathlib documentation — `push`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Tactic/Push.html)
