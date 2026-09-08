# Module 0 - term vs tactic proof example

## Statement

Prove `2 + 2 = 4` two ways: directly as a **proof term**, and interactively as a **tactic proof** inside a `by` block — and locate the goal in the Infoview before the tactic closes it.

## Code

```lean
import Mathlib

-- Term-style proof: a direct proof term
theorem add_two_two_term : 2 + 2 = 4 := rfl

#check add_two_two_term

-- Tactic-style proof: interactive steps inside `by`
theorem add_two_two_tactic : 2 + 2 = 4 := by
  rfl
```

## Walkthrough

- **`add_two_two_term`**: `rfl` (reflexivity) is itself a complete proof term whose type matches `2 + 2 = 4`, so Lean accepts it immediately — no interaction needed.
- **`add_two_two_tactic`**: entering `by` switches to tactic mode. Put the cursor at the start of the `rfl` line and the Infoview shows the goal still open: `⊢ 2 + 2 = 4`. Put it after `rfl` and the goal is gone — the Infoview reports `Goals accomplished 🎉`.
- This proof is one step, so there is no intermediate state to watch. The point here is only *where to look*: the Infoview shows what remains to be proved at the cursor. Later modules use proofs of several steps, where the goal visibly changes line by line.
- The two proofs are interchangeable here because `rfl` is simple enough to write directly as a term; more complex proofs are usually far easier to build step-by-step in tactic mode, watching the goal change after each line.

## Back-link

- [Module 0 – Preface](../00-Preface.md)
