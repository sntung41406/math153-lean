# `¬` (not)

**Meaning.** `¬ P` means "`P` is false". In Lean, `¬ P` means `P → False`: assuming `P` leads to something impossible. Type it in VS Code with `\not` or `\neg`. `a ≠ b` is short for `¬ (a = b)`.

**Example.**
```lean
import Mathlib

example : ¬ (3 : ℤ) = 4 := by norm_num
```

**Use it when** you want to state that something fails. To prove `¬ P` by hand, start with [`rintro`](rintro.md) to assume `P`, then reach a contradiction.

**Reference.** [Lean documentation — `Not`](https://leanprover-community.github.io/mathlib4_docs/Init/Prelude.html#Not)
