# `rel`

**Meaning.** `rel [h]` substitutes the relation `h` into an expression — for example a congruence `h : x ≡ 1 [ZMOD 4]` — the way `rw` substitutes an equation. It is part of Mathlib, in the same family as [`gcongr`](gcongr.md).

**Example.**
```lean
import Mathlib

example {x : ℤ} (hx : x ≡ 1 [ZMOD 4]) : x ^ 2 + x ≡ 2 [ZMOD 4] :=
  calc
    x ^ 2 + x ≡ 1 ^ 2 + 1 [ZMOD 4] := by rel [hx]
    _ = 2                          := by norm_num
```

**Use it when** you have written the new expression yourself (for example in a `calc` step) and want to justify it by substituting hypotheses. Unlike `gcongr`, `rel` fails instead of leaving new goals.

**Version note.** math2001 ships its own `rel`. This course uses Mathlib's. The name is the same, and the course examples are checked against Mathlib.

**Reference.** [Mathlib documentation — `Mathlib.Tactic.GCongr`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Tactic/GCongr/Core.html)
