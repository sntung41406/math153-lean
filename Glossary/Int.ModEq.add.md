# `Int.ModEq.add`

**Meaning.** The Mathlib lemma `Int.ModEq.add : a ≡ b [ZMOD n] → c ≡ d [ZMOD n] → a + c ≡ b + d [ZMOD n]` — two congruences can be added. `Int.ModEq.mul`, `Int.ModEq.sub` and `Int.ModEq.pow` do the same for `*`, `-` and powers.

**Example.**
```lean
import Mathlib

example {a b c d : ℤ} (h1 : a ≡ b [ZMOD 7]) (h2 : c ≡ d [ZMOD 7]) :
    a + c ≡ b + d [ZMOD 7] :=
  Int.ModEq.add h1 h2
```

**Use it when** you want to combine two congruences in one step. For longer expressions, [`rel`](rel.md) applies these lemmas for you.

**Reference.** [Mathlib documentation — `Int.ModEq.add`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Int/ModEq.html#Int.ModEq.add)
