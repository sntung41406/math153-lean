# `Int.even_or_odd`

**Meaning.** The Mathlib lemma `Int.even_or_odd (n : ℤ) : Even n ∨ Odd n` — every integer is even or odd.

**Example.**
```lean
import Mathlib

example (n : ℤ) : Even (n * (n + 1)) := by
  obtain h | h := Int.even_or_odd n
  · obtain ⟨k, hk⟩ := h
    use k * (n + 1)
    rw [hk]
    ring
  · obtain ⟨k, hk⟩ := h
    use (2 * k + 1) * (k + 1)
    rw [hk]
    ring
```

**Use it when** you want to prove something about every integer by splitting into an even case and an odd case. Combine it with `obtain h | h := Int.even_or_odd n`.

**Reference.** [Mathlib documentation — `Int.even_or_odd`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Int/Parity.html#Int.even_or_odd)
