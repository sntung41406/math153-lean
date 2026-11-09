# `cases`

**Meaning.** `cases a` splits the proof into one goal for each *constructor* of `a`'s type: each way, listed after `|` in the type's `inductive` definition, that a value can be built. A constructor can take arguments, so a type can have more elements than constructors. For example, `ℕ` has two constructors (`0` and `n + 1`) but infinitely many elements. In the `Color` type below, neither constructor takes an argument, so each of the two constructors gives exactly one element, and `cases c` checks `red` and `green` one at a time. If `h` is an equation between values built by two *different* constructors, `cases h` closes the goal, because the equation is impossible.

**Example.**
```lean
import Mathlib

inductive Color
  | red
  | green

open Color

def swap : Color → Color
  | red => green
  | green => red

example (c : Color) : swap (swap c) = c := by
  cases c
  · rfl
  · rfl

example : red ≠ green := by
  intro h
  cases h
```

**Use it when** a function is given by a table, as with [pattern matching](pattern-matching.md), and the proof must check every row. To run the same tactic in every goal that `cases` produces, write `cases c <;> rfl`: the combinator `<;>` applies the tactic on its right to each new goal. To take apart `∃` or `∧` hypotheses, use [`obtain`](obtain.md) instead.

**Reference.** [Lean documentation — `cases`](https://leanprover-community.github.io/mathlib4_docs/Init/Tactics.html#Lean.Parser.Tactic.cases)
