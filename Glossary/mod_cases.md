# `mod_cases`

**Meaning.** `mod_cases h : x % n` splits the proof into `n` cases, one for each remainder. In each case you get `h : x ≡ 0 [ZMOD n]`, `h : x ≡ 1 [ZMOD n]`, and so on up to `n - 1`.

**Example.**
```lean
import Mathlib

example (x : ℤ) : x ^ 2 ≡ 0 [ZMOD 3] ∨ x ^ 2 ≡ 1 [ZMOD 3] := by
  mod_cases hx : x % 3
  · left
    calc
      x ^ 2 ≡ 0 ^ 2 [ZMOD 3] := by rel [hx]
      _ = 0                  := by norm_num
  · right
    calc
      x ^ 2 ≡ 1 ^ 2 [ZMOD 3] := by rel [hx]
      _ = 1                  := by norm_num
  · right
    calc
      x ^ 2 ≡ 2 ^ 2 [ZMOD 3] := by rel [hx]
      _ = 1 + 3 * 1          := by norm_num
      _ ≡ 1 [ZMOD 3]         := by decide
```

**Use it when** a claim about every integer can be checked remainder by remainder. Use [`rel`](rel.md) `[h]` in each case to replace `x` by its remainder.

**Reference.** [Mathlib documentation — `Mathlib.Tactic.ModCases`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Tactic/ModCases.html)
