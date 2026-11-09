# Module 7 - Doubling over ℝ and ℤ example

## Statement

Prove that $x \mapsto 2x$ is surjective as a function $\mathbb{R} \to \mathbb{R}$, but not as a function $\mathbb{Z} \to \mathbb{Z}$.

## Code

```lean
import Mathlib

open Function

example : Surjective (fun x : ℝ ↦ 2 * x) := by
  intro y
  use y / 2
  dsimp only
  ring

example : ¬ Surjective (fun x : ℤ ↦ 2 * x) := by
  intro h
  obtain ⟨x, hx⟩ := h 1
  dsimp only at hx
  omega
```

## Walkthrough

- The two statements use the same rule, `fun x ↦ 2 * x`. Only the type annotation `x : ℝ` or `x : ℤ` changes, and that changes the domain and codomain.
- **Over ℝ.** `intro y` fixes a target, and [`use`](../../../Glossary/use.md) `y / 2` supplies the witness. The goal is now `(fun x ↦ 2 * x) (y / 2) = y`. [`dsimp only`](../../../Glossary/dsimp.md) applies the function to its input, giving `2 * (y / 2) = y`, and [`ring`](../../../Glossary/ring.md) checks it.
- **Over ℤ.** Assume `h : Surjective (fun x : ℤ ↦ 2 * x)`. Applied to the target `1`, it gives an integer `x` with `hx : (fun x ↦ 2 * x) x = 1`.
- `dsimp only at hx` tidies this to `hx : 2 * x = 1`. [`omega`](../../../Glossary/omega.md) knows that an even integer cannot equal `1`, so it closes the goal. Without the `dsimp` step, `omega` cannot see the arithmetic inside the `fun`.
- The witness `y / 2` from the first proof is not available in the second: over `ℤ`, `1 / 2` is not a preimage of `1`.

## Back-link

- [Module 7 – Functions](../07-Functions.md)
