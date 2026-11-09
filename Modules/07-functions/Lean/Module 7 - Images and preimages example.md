# Module 7 - Images and preimages example

## Statement

For $s(x) = x^2$ on $\mathbb{R}$, prove $s(\{0,1\}) = \{0,1\}$ and $s^{-1}(\{0,1\}) = \{-1,0,1\}$.

## Code

```lean
import Mathlib

example : (fun x : ℝ ↦ x ^ 2) '' {0, 1} = {0, 1} := by
  ext y
  show (∃ x : ℝ, (x = 0 ∨ x = 1) ∧ x ^ 2 = y) ↔ y = 0 ∨ y = 1
  constructor
  · rintro ⟨x, rfl | rfl, rfl⟩ <;> norm_num
  · rintro (rfl | rfl)
    · use 0
      norm_num
    · use 1
      norm_num

example : (fun x : ℝ ↦ x ^ 2) ⁻¹' {0, 1} = {-1, 0, 1} := by
  ext x
  show x ^ 2 = 0 ∨ x ^ 2 = 1 ↔ x = -1 ∨ x = 0 ∨ x = 1
  constructor
  · rintro (h | h)
    · right
      left
      simp at h
      exact h
    · have h2 : (x + 1) * (x - 1) = 0 := by nlinarith
      obtain h3 | h3 := eq_zero_or_eq_zero_of_mul_eq_zero h2
      · left
        linarith
      · right
        right
        linarith
  · rintro (rfl | rfl | rfl) <;> norm_num
```

## Walkthrough

- In Lean, `f '' S` is the [image](../../../Glossary/Set.image-preimage.md) of the set `S`, and `f ⁻¹' T` is the [preimage](../../../Glossary/Set.image-preimage.md) of `T`. Note the different symbols: `''` and `⁻¹'`.
- Both statements are equations between sets. [`ext`](../../../Glossary/ext.md) reduces each to a statement about one element: `y` is in the left side if and only if `y` is in the right side.
- [`show`](../../../Glossary/show.md) restates that goal in plain logic. Membership in `{0, 1}` *is* `y = 0 ∨ y = 1`, membership in an image *is* "there is a witness `x` in `S` with `f x = y`", and membership in a preimage *is* `f x ∈ T`. Lean accepts the restated goal because both forms mean the same thing by definition.
- **Image, forward.** [`rintro`](../../../Glossary/rintro.md) `⟨x, rfl | rfl, rfl⟩` takes the witness apart: it splits into the cases `x = 0` and `x = 1` and replaces `y` by `x ^ 2`. The `<;>` runs [`norm_num`](../../../Glossary/norm_num.md) in both cases, which checks `0 ^ 2 = 0 ∨ 0 ^ 2 = 1` and `1 ^ 2 = 0 ∨ 1 ^ 2 = 1`.
- **Image, backward.** For `y = 0` the witness is `0`, and for `y = 1` it is `1`. After [`use`](../../../Glossary/use.md), `norm_num` checks that the witness is in `{0, 1}` and has the right square.
- **Preimage, forward.** If `x ^ 2 = 0`, then [`simp`](../../../Glossary/simp.md) `at h` turns `h` into `x = 0`, because a square is zero only when the number is zero. If `x ^ 2 = 1`, then [`nlinarith`](../../../Glossary/nlinarith.md) proves `(x + 1) * (x - 1) = 0`, and [`eq_zero_or_eq_zero_of_mul_eq_zero`](../../../Glossary/eq_zero_or_eq_zero_of_mul_eq_zero.md) splits it into `x + 1 = 0` or `x - 1 = 0`. [`left` and `right`](../../../Glossary/left-right.md) pick the matching part of `x = -1 ∨ x = 0 ∨ x = 1`.
- **Preimage, backward.** Each of `-1`, `0`, `1` has square `0` or `1`, which `norm_num` checks.
- The second answer contains `-1`, which is not in the set `{0, 1}` we started from. That is the collision $(-1)^2 = 1^2$ from [Module 7 - Non-injective and non-surjective example](Module%207%20-%20Non-injective%20and%20non-surjective%20example.md): a preimage collects every input that lands in the set.

## Back-link

- [Module 7 – Functions](../07-Functions.md)
