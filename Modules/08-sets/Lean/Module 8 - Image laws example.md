# Module 8 - Image laws example

## Statement

For any function $f : A \to B$ and sets $S, T$ of inputs, prove $f(S \cup T) = f(S) \cup f(T)$ and $f(S \cap T) \subseteq f(S) \cap f(T)$. Then prove that the reverse inclusion fails for $s(x) = x^2$ on $\mathbb{R}$ with $S = \{-1\}$ and $T = \{1\}$.

## Code

```lean
import Mathlib

example {α β : Type*} (f : α → β) (S T : Set α) :
    f '' (S ∪ T) = f '' S ∪ f '' T := by
  ext y
  constructor
  · rintro ⟨x, hx | hx, rfl⟩
    · left
      exact ⟨x, hx, rfl⟩
    · right
      exact ⟨x, hx, rfl⟩
  · rintro (⟨x, hx, rfl⟩ | ⟨x, hx, rfl⟩)
    · use x
      constructor
      · left
        exact hx
      · rfl
    · use x
      constructor
      · right
        exact hx
      · rfl

example {α β : Type*} (f : α → β) (S T : Set α) :
    f '' (S ∩ T) ⊆ f '' S ∩ f '' T := by
  rintro y ⟨x, ⟨hS, hT⟩, rfl⟩
  exact ⟨⟨x, hS, rfl⟩, ⟨x, hT, rfl⟩⟩

example : ¬ (fun x : ℝ ↦ x ^ 2) '' {-1} ∩ (fun x : ℝ ↦ x ^ 2) '' {1} ⊆
    (fun x : ℝ ↦ x ^ 2) '' ({-1} ∩ {1}) := by
  intro h
  have h1 : (1 : ℝ) ∈ (fun x : ℝ ↦ x ^ 2) '' {-1} ∩ (fun x : ℝ ↦ x ^ 2) '' {1} := by
    constructor
    · use -1
      norm_num
    · use 1
      norm_num
  obtain ⟨x, ⟨hx1, hx2⟩, -⟩ := h h1
  rw [Set.mem_singleton_iff] at hx1 hx2
  rw [hx1] at hx2
  norm_num at hx2
```

## Walkthrough

Recall that `f '' S` is the [image](../../../Glossary/Set.image-preimage.md) of `S` under `f`, and `y ∈ f '' S` means `∃ x, x ∈ S ∧ f x = y`. So a proof of `y ∈ f '' S` is a triple: a witness `x`, a proof of `x ∈ S`, and a proof of `f x = y`.

**Images preserve unions.**

- [`ext`](../../../Glossary/ext.md) `y` reduces the equality to an iff, and [`constructor`](../../../Glossary/constructor.md) splits it.
- **Left to right.** [`rintro`](../../../Glossary/rintro.md) `⟨x, hx | hx, rfl⟩` takes the triple apart. The middle pattern `hx | hx` splits `x ∈ S ∪ T` into its two cases, since [membership in a union](../../../Glossary/set-operations.md) is an `∨`. The pattern `rfl` replaces `y` by `f x` everywhere. In the case `hx : x ∈ S`, [`left`](../../../Glossary/left-right.md) chooses `f x ∈ f '' S`, and `⟨x, hx, rfl⟩` builds the triple with the same witness. The case `x ∈ T` uses `right`.
- **Right to left.** `rintro (⟨x, hx, rfl⟩ | ⟨x, hx, rfl⟩)` splits the `∨` and takes apart the triple in each case. [`use`](../../../Glossary/use.md) `x` keeps the same witness. `constructor` leaves two goals: `x ∈ S ∪ T`, proved by choosing the correct side, and `f x = f x`, proved by [`rfl`](../../../Glossary/rfl.md).

**Images and intersections: one inclusion.**

- `rintro y ⟨x, ⟨hS, hT⟩, rfl⟩` introduces `y` and its triple, and also splits `x ∈ S ∩ T` into `hS : x ∈ S` and `hT : x ∈ T`.
- The goal `f x ∈ f '' S ∩ f '' T` is a pair of image memberships. Each uses the same witness `x`: `⟨x, hS, rfl⟩` and `⟨x, hT, rfl⟩`.

**The reverse inclusion fails.**

- `intro h` assumes the reverse inclusion for squaring on `{-1}` and `{1}`, and leaves `False` to prove.
- [`have`](../../../Glossary/have.md) `h1` shows `1` is in both images. For `1 ∈ s '' {-1}`, `use -1` supplies the witness, and [`norm_num`](../../../Glossary/norm_num.md) checks `-1 ∈ {-1}` and `(-1)^2 = 1`. The witness for `1 ∈ s '' {1}` is `1`. These are two *different* witnesses.
- `h h1` puts `1` into the image of `{-1} ∩ {1}`. [`obtain`](../../../Glossary/obtain.md) `⟨x, ⟨hx1, hx2⟩, -⟩` takes out a witness `x` with `hx1 : x ∈ {-1}` and `hx2 : x ∈ {1}`. The pattern `-` drops the equation `x ^ 2 = 1`, which is not needed.
- [`Set.mem_singleton_iff`](../../../Glossary/Set.insert-singleton.md) turns these into `x = -1` and `x = 1`. Rewriting the first into the second gives `-1 = 1`, which `norm_num at hx2` reduces to `False`.

## Back-link

- [Module 8 – Sets](../08-Sets.md)
