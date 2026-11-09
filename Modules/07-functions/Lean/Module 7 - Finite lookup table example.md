# Module 7 - Finite lookup table example

## Statement

Define $f$ on $\{\text{athos}, \text{porthos}, \text{aramis}\}$ by the table athos $\mapsto$ aramis, porthos $\mapsto$ aramis, aramis $\mapsto$ athos. Prove $f$ is neither injective nor surjective.

## Code

```lean
import Mathlib

open Function

inductive Musketeer
  | athos
  | porthos
  | aramis
  deriving DecidableEq

open Musketeer

def f : Musketeer → Musketeer
  | athos => aramis
  | porthos => aramis
  | aramis => athos

example : ¬ Injective f := by
  intro h
  have h1 : athos = porthos := h rfl
  cases h1

example : ¬ Surjective f := by
  intro h
  obtain ⟨a, ha⟩ := h porthos
  cases a <;> cases ha
```

## Walkthrough

- `inductive Musketeer` makes a new type with three *constructors*, listed after `|`. None of them takes an argument, so each gives exactly one element, and the type has exactly three elements. Different constructors are different elements, so `athos ≠ porthos`. The line `deriving DecidableEq` lets Lean decide equality between two elements by checking the names.
- `open Musketeer` lets us write `athos` in place of `Musketeer.athos`.
- `def f` is a lookup table written with [pattern matching](../../../Glossary/pattern-matching.md): one line per input. There is no formula, and none is needed.
- **Not injective.** Assume `h : Injective f`. Since `f athos` and `f porthos` are both `aramis`, the equation `f athos = f porthos` holds by definition, so [`rfl`](../../../Glossary/rfl.md) proves it. Applying `h` to it gives `h1 : athos = porthos`. Then [`cases`](../../../Glossary/cases.md) `h1` closes the goal: an equation between two different constructors of an `inductive` type is impossible.
- **Not surjective.** Assume `h : Surjective f`. Applied to the target `porthos`, it gives an input `a` with `ha : f a = porthos` ([`obtain`](../../../Glossary/obtain.md) takes the `∃` apart).
- `cases a` splits into three goals, one for each possible input. In each goal `ha` says `aramis = porthos` or `athos = porthos` after unfolding `f`. Both are impossible, so `cases ha` closes each goal.
- `<;>` runs the tactic on its right in *every* goal that the tactic on its left produces. So `cases a <;> cases ha` is a short way to write `cases a` and then `cases ha` three times. Checking every row of the table is exactly what a proof about a lookup table should do.

## Back-link

- [Module 7 – Functions](../07-Functions.md)
