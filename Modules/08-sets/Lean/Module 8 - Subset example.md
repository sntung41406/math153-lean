# Module 8 - Subset example

## Statement

Prove $\{a \in \mathbb{N} \mid 4 \mid a\} \subseteq \{b \in \mathbb{N} \mid 2 \mid b\}$, and prove that the reverse inclusion fails.

## Code

```lean
import Mathlib

example : {a : ℕ | 4 ∣ a} ⊆ {b : ℕ | 2 ∣ b} := by
  intro a ha
  obtain ⟨k, hk⟩ := ha
  use 2 * k
  rw [hk]
  ring

example : ¬ {b : ℕ | 2 ∣ b} ⊆ {a : ℕ | 4 ∣ a} := by
  intro h
  have h6 : 6 ∈ {a : ℕ | 4 ∣ a} := h (by norm_num)
  norm_num at h6
```

## Walkthrough

**The inclusion.**

- [`A ⊆ B`](../../../Glossary/Set.md) unfolds to `∀ x, x ∈ A → x ∈ B`, so [`intro`](../../../Glossary/intro.md) `a ha` introduces an arbitrary `a` and the hypothesis `ha : a ∈ {a | 4 ∣ a}`, i.e. `4 ∣ a`.
- [`obtain`](../../../Glossary/obtain.md) `⟨k, hk⟩ := ha` unpacks that [divisibility](../../../Glossary/dvd.md) fact into a witness `k` and `hk : a = 4 * k`.
- The goal `a ∈ {b | 2 ∣ b}` is `2 ∣ a`, i.e. `∃ c, a = 2 * c`. [`use`](../../../Glossary/use.md) `2 * k` supplies that witness, and [`rw`](../../../Glossary/rw.md) `[hk]` followed by [`ring`](../../../Glossary/ring.md) verifies `4 * k = 2 * (2 * k)`.

**The reverse inclusion fails.**

- The goal is a negation, so `intro h` assumes `h : {b | 2 ∣ b} ⊆ {a | 4 ∣ a}` and leaves `False` to prove.
- `h` is a function: given a proof that `6 ∈ {b | 2 ∣ b}`, it returns a proof that `6 ∈ {a | 4 ∣ a}`. The argument `(by norm_num)` proves `6 ∈ {b | 2 ∣ b}`, which is `2 ∣ 6`. [`have`](../../../Glossary/have.md) records the result as `h6 : 6 ∈ {a | 4 ∣ a}`.
- `h6` says `4 ∣ 6`, which is false. [`norm_num`](../../../Glossary/norm_num.md) `at h6` evaluates it to `False` and closes the goal.
- One element, `6`, is enough to disprove a subset claim. The same element shows the two sets are not equal.

## Back-link

- [Module 8 – Sets](../08-Sets.md)
