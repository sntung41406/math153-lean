# Module 8 - Cantor's theorem example

## Statement

Prove there is no surjective function $f : X \to \mathrm{Set}\,X$, for any type $X$. Then prove the two steps behind $|X| < |\mathcal{P}(X)|$: there is no bijection $X \to \mathrm{Set}\,X$, and the singleton map $x \mapsto \{x\}$ is injective.

## Code

```lean
import Mathlib

open Function

theorem no_surjection_to_powerset {X : Type*} :
    ¬ ∃ f : X → Set X, Surjective f := by
  intro h
  obtain ⟨f, hf⟩ := h
  let s : Set X := {x | x ∉ f x}
  obtain ⟨x, hx⟩ := hf s
  by_cases hxs : x ∈ s
  · have hfx : x ∉ f x := hxs
    rw [hx] at hfx
    contradiction
  · have hfx : ¬ x ∉ f x := hxs
    rw [hx] at hfx
    contradiction

example {X : Type*} : ¬ ∃ f : X → Set X, Bijective f := by
  intro h
  obtain ⟨f, hf⟩ := h
  exact no_surjection_to_powerset ⟨f, hf.2⟩

example {X : Type*} : Injective (fun x : X ↦ ({x} : Set X)) := by
  intro x1 x2 h
  dsimp only at h
  have hx : x1 ∈ ({x2} : Set X) := by
    rw [← h]
    exact Set.mem_singleton x1
  rw [Set.mem_singleton_iff] at hx
  exact hx
```

## Walkthrough

In Lean, the power set of a type `X` is the type `Set X` of all sets of elements of `X`.

**No surjection.**

- Assume for contradiction ([`intro`](../../../Glossary/intro.md) `h`) that a [surjective](../../../Glossary/Function.Surjective.md) `f : X → Set X` exists, and unpack it with [`obtain`](../../../Glossary/obtain.md) as `f` with `hf : Surjective f`.
- [`let`](../../../Glossary/let.md) `s : Set X := {x | x ∉ f x}` names the diagonal [set](../../../Glossary/Set.md): the set of elements that are *not* members of their own image under `f`. This is the same trick as Russell's paradox, applied to a specific function.
- Since `f` is surjective, `hf s` gives some `x` with `hx : f x = s`.
- [`by_cases`](../../../Glossary/by_cases.md) `hxs : x ∈ s` splits on whether `x` is in `s`. By the definition of `s`, `x ∈ s` means `x ∉ f x`.
  - **If `x ∈ s`.** Unfolding `hxs` gives `hfx : x ∉ f x`. Rewriting with `hx` turns it into `hfx : x ∉ s`, and [`contradiction`](../../../Glossary/contradiction.md) finds the clash with `hxs : x ∈ s`.
  - **If `x ∉ s`.** Now `hxs : x ∉ s`, which unfolds to `hfx : ¬ x ∉ f x`. Rewriting with `hx` turns it into `hfx : ¬ x ∉ s`. This is exactly the negation of `hxs`, so `contradiction` closes the goal directly.
- Either way is impossible, so no surjective `f : X → Set X` can exist. The result is a [`theorem`](../../../Glossary/theorem.md) with a name, so the next example can use it.

**No bijection.**

- A [bijection](../../../Glossary/Function.Bijective.md) is injective and surjective, so `hf : Bijective f` is a pair, and `hf.2 : Surjective f` is its second half.
- `⟨f, hf.2⟩` is then a proof of `∃ f : X → Set X, Surjective f`, which `no_surjection_to_powerset` rules out. So $|X| \ne |\mathcal{P}(X)|$.

**The singleton map is injective.**

- [`Injective`](../../../Glossary/Function.Injective.md) unfolds to `∀ x1 x2, f x1 = f x2 → x1 = x2`, so `intro x1 x2 h` gives `h`, and [`dsimp only`](../../../Glossary/dsimp.md) `at h` tidies it to `h : {x1} = {x2}`.
- To prove `hx : x1 ∈ {x2}`, rewrite the goal backwards with `h` to `x1 ∈ {x1}`, which is [`Set.mem_singleton`](../../../Glossary/Set.insert-singleton.md) `x1`.
- `Set.mem_singleton_iff` turns `x1 ∈ {x2}` into `x1 = x2`, which is the goal.
- An injection $X \to \mathcal{P}(X)$ gives $|X| \le |\mathcal{P}(X)|$. Together with the previous step, $|X| < |\mathcal{P}(X)|$.

## Back-link

- [Module 8 – Sets](../08-Sets.md)
