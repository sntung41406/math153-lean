# Module 5 - Negation algorithm example

## Statement

Use `push Not` to move a negation inward, first in a goal and then in a hypothesis. Revisit Module 4's proof that no real number is larger than every real number.

## Refuting a universal statement

### Code

```lean
import Mathlib

example : ¬ (∀ x : ℝ, x ^ 2 ≥ x) := by
  push Not
  use (1 / 2 : ℝ)
  norm_num
```

### Walkthrough

- The goal starts as `¬ ∀ x : ℝ, x ^ 2 ≥ x`. [`push Not`](../../../Glossary/push-not.md) rewrites it using `¬ ∀ x, P x ↔ ∃ x, ¬ P x` and then `¬ (a ≥ b) ↔ a < b`, leaving `∃ x, x ^ 2 < x`.
- [`use`](../../../Glossary/use.md) `(1 / 2 : ℝ)` commits to the witness $x = \tfrac12$, reducing the goal to $\big(\tfrac12\big)^2 < \tfrac12$.
- [`norm_num`](../../../Glossary/norm_num.md) evaluates $\big(\tfrac12\big)^2 = \tfrac14$ and checks $\tfrac14 < \tfrac12$, closing the goal.
- Compare with [Module 4 - Refuting a universal statement example](../../04-proofs-with-structure-ii/Lean/Module%204%20-%20Refuting%20a%20universal%20statement%20example.md), which proves the same statement with `intro h` and `h (1 / 2)`. There the counterexample is fed to an assumed hypothesis; here `push Not` first turns the goal into an `∃`, and the counterexample is given as a witness with `use`.

## Refuting an existential statement

### Code

```lean
import Mathlib

example : ¬ ∃ c : ℝ, ∀ b : ℝ, b < c := by
  push Not
  intro c
  use c
```

### Walkthrough

- [Module 4 - Nested quantifiers example](../../04-proofs-with-structure-ii/Lean/Module%204%20-%20Nested%20quantifiers%20example.md) proved this statement by contradiction: assume such a `c` exists, then use the hypothesis at `b = c` to get `c < c`.
- Here `push Not` changes the goal to `∀ c : ℝ, ∃ b, c ≤ b`. The `¬ ∃` became `∀ ¬`, the `¬ ∀` became `∃ ¬`, and `¬ (b < c)` became `c ≤ b`.
- The new goal is a positive statement with no contradiction in it: for every `c`, find a `b` that is at least as large. [`intro`](../../../Glossary/intro.md) `c` takes an arbitrary `c`, and `use c` chooses `b = c`. The remaining goal `c ≤ c` is closed by `use` itself, since it is true by reflexivity.
- The mathematics is the same as in Module 4: the number `c` itself is the value that breaks the claim. The negation algorithm shows *what to prove* before we start, so there is no need to assume the claim and look for a contradiction.

## Negating a hypothesis

### Code

```lean
import Mathlib

example {a : ℝ} (h : ¬ ∃ x : ℝ, a < x ∧ x < a + 1) : False := by
  push Not at h
  have h' : a + 1 ≤ a + 1 / 2 := h (a + 1 / 2) (by linarith)
  linarith
```

### Walkthrough

- The hypothesis `h` says there is no real number strictly between `a` and `a + 1`. This is false, so from `h` we can prove [`False`](../../../Glossary/False.md).
- A negative hypothesis is hard to use directly. `push Not at h` rewrites the hypothesis instead of the goal: `h : ∀ x : ℝ, a < x → a + 1 ≤ x`. The `¬ (P ∧ Q)` became `P → ¬ Q`, and `¬ (x < a + 1)` became `a + 1 ≤ x`.
- Now `h` is a "for all" statement, so it can be used at any value. `h (a + 1 / 2)` needs a proof of `a < a + 1 / 2`, which [`linarith`](../../../Glossary/linarith.md) gives. The result is `h' : a + 1 ≤ a + 1 / 2`.
- `h'` is false, and `linarith` closes the goal.

## Back-link

- [Module 5 – Logic](../05-Logic.md)
