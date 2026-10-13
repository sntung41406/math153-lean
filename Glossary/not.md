# `¬` (not)

**Meaning.** `¬ P` means "`P` is false". In Lean, `¬ P` means `P → False`: assuming `P` leads to something impossible. Type it in VS Code with `\not` or `\neg`. `a ≠ b` is short for `¬ (a = b)`.

**Example.**
```lean
import Mathlib

example : ¬ (3 : ℤ) = 4 := by norm_num
```

**Use it when** you want to state that something fails. To prove `¬ P` by hand, start with [`intro`](intro.md) `h` to assume `P`; the goal becomes [`False`](False.md), and you then reach a contradiction. [`rintro`](rintro.md) does the same and takes the assumption apart in one step.

**Reference.** [Lean documentation — `Not`](https://leanprover-community.github.io/mathlib4_docs/Init/Prelude.html#Not)
