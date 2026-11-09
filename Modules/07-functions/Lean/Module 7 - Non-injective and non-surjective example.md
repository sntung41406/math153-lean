# Module 7 - Non-injective and non-surjective example

## Statement

Prove the squaring function $x \mapsto x^2$ on $\mathbb{R}$ is neither injective nor surjective.

## Code

```lean
import Mathlib

open Function

example : ¬ Injective (fun x : ℝ ↦ x ^ 2) := by
  intro h
  have h1 : (-1 : ℝ) = 1 := h (by norm_num)
  norm_num at h1

example : ¬ Surjective (fun x : ℝ ↦ x ^ 2) := by
  intro h
  obtain ⟨x, hx⟩ := h (-1)
  nlinarith [sq_nonneg x]
```

## Walkthrough

- **Not injective.** Assuming `h : Injective (fun x ↦ x^2)` for contradiction, `h` can be applied to any proof that two inputs give the same output. `h (by norm_num)` applies it to a proof of `(-1)^2 = 1^2`, producing `h1 : (-1:ℝ) = 1` — which `norm_num` immediately recognizes as false.
- **Not surjective.** Assuming `h : Surjective (fun x ↦ x^2)`, applying it to the target `-1` gives `h (-1) : ∃ x, x^2 = -1`. `obtain ⟨x, hx⟩` extracts a witness `x` with `hx : x^2 = -1`. Since squares are always nonnegative (`sq_nonneg x : 0 ≤ x^2`), `nlinarith` spots the contradiction between `x^2 = -1` and `x^2 ≥ 0`.
- Both proofs follow the same shape: assume the property holds, derive something absurd, done — the standard pattern for disproving a $\forall$/$\exists$-shaped claim.

## Back-link

- [Module 7 – Functions](../07-Functions.md)
