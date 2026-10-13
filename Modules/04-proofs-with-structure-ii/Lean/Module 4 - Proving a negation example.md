# Module 4 - Proving a negation example

## Statement

Prove a negation by assuming the statement holds and deriving an impossibility.

## Code

```lean
import Mathlib

example {x y : ℝ} (hsum : x + y = 0) : ¬(x > 0 ∧ y > 0) := by
  intro h
  obtain ⟨hx, hy⟩ := h
  have H : (0:ℝ) > 0 := by
    calc (0:ℝ) = x + y := by rw [hsum]
    _ > 0 := by linarith
  linarith
```

## Walkthrough

- The goal `¬(x > 0 ∧ y > 0)` is itself a negation — `¬ P` unfolds to "`P` implies [`False`](../../../Glossary/False.md)" (see [`¬`](../../../Glossary/not.md)). So [`intro`](../../../Glossary/intro.md) `h` assumes the negated statement's content, `h : x > 0 ∧ y > 0`, and the new goal becomes `False`.
- `obtain ⟨hx, hy⟩ := h` splits the assumed "and" into its two positivity facts.
- The `calc` block combines them with the given `hsum : x + y = 0` to derive `0 > 0`, an impossibility; the final `linarith` closes the `False` goal from that contradiction.
- Note the hypothesis carrying the original sum is named `hsum` here, not `h` — `intro h` introduces its own local `h` for the assumed conjunction, and reusing the same name would shadow the outer one.
- This proof needs no special contradiction tactic: for a goal `¬ P`, `intro` is enough. The tactic [`by_contra`](../../../Glossary/by_contra.md) is for goals that are not negations; see [Module 4 - Ruling out a case example](Module%204%20-%20Ruling%20out%20a%20case%20example.md).

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
