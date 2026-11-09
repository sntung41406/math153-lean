# Module 7 - Bijective example

## Statement

Prove $p(x) = 2x-5$ is bijective on $\mathbb{R}$, and prove that every real $y$ has exactly one preimage under $p$.

## Code

```lean
import Mathlib

open Function

def p (x : ℝ) : ℝ := 2 * x - 5

example : Bijective p := by
  constructor
  · intro x1 x2 hx
    dsimp only [p] at hx
    linarith
  · intro y
    use (y + 5) / 2
    dsimp only [p]
    ring

example : ∀ y, ∃! x, p x = y := by
  intro y
  use (y + 5) / 2
  dsimp
  constructor
  · dsimp only [p]
    ring
  · intro x hx
    dsimp only [p] at hx
    linarith
```

## Walkthrough

- [`Function.Bijective`](../../../Glossary/Function.Bijective.md) `p` unfolds to `Injective p ∧ Surjective p`, so `constructor` splits the goal into the two halves proved separately.
- Injective half: `intro x1 x2 hx` introduces the hypothesis `hx : p x1 = p x2`; `dsimp only [p] at hx` unfolds it to `2 * x1 - 5 = 2 * x2 - 5`, and `linarith` derives `x1 = x2`.
- Surjective half: `intro y` fixes a target, `use (y + 5) / 2` supplies the witness, and after unfolding `p` with `dsimp only [p]`, `ring` verifies `2 * ((y + 5) / 2) - 5 = y`.
- **The $\exists!$ form.** The second example states "each output is hit exactly once" with [`∃!`](../../../Glossary/exists-unique.md). After `intro y`, the goal is `∃! x, p x = y`.
- [`use`](../../../Glossary/use.md) `(y + 5) / 2` supplies the same witness as in the surjective half. [`dsimp`](../../../Glossary/dsimp.md) then shows the goal as two parts joined by `∧`: the witness works, and every `x` with `p x = y` equals the witness.
- `constructor` splits the two parts. The first is the existence check from before. For the second, `intro x hx` takes any `x` with `hx : p x = y`, and `linarith` solves `2 * x - 5 = y` to get `x = (y + 5) / 2`. Solving the equation gives back the witness, which is why it is unique.

## Back-link

- [Module 7 – Functions](../07-Functions.md)
