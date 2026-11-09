# `Set.image` and `Set.preimage`

**Meaning.** For a function `f : A → B`, the image `f '' S` of a set `S` of inputs is the set of all outputs `f x` with `x ∈ S`. The preimage `f ⁻¹' T` of a set `T` of outputs is the set of all inputs `x` with `f x ∈ T`. By definition, `y ∈ f '' S` means `∃ x, x ∈ S ∧ f x = y`, and `x ∈ f ⁻¹' T` means `f x ∈ T`.

**Example.**
```lean
import Mathlib

example : (3 : ℝ) ∈ (fun x : ℝ ↦ x + 1) '' {2} := by
  use 2
  norm_num

example : (2 : ℝ) ∈ (fun x : ℝ ↦ x + 1) ⁻¹' {3} := by
  show (2 : ℝ) + 1 = 3
  norm_num
```

**Use it when** a statement follows a set of inputs forward (image) or collects the inputs that land in a set (preimage). To show an element is in an image, [`use`](use.md) a witness. To prove two sets are equal, start with [`ext`](ext.md). The preimage `f ⁻¹' T` exists for every function `f`; it does not mean that `f` has an inverse function. The names `Set.mem_image` and `Set.mem_preimage` are Mathlib's statements of the two membership rules above.

**Reference.** [Mathlib documentation — `Set.image`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Defs.html#Set.image) and [`Set.preimage`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Set/Operations.html#Set.preimage)
