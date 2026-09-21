# `·` (focusing dot)

**Meaning.** The focusing dot `·` starts the proof of one goal when there are several. The indented lines after it must close that goal completely.

**Example.**
```lean
import Mathlib

example {a b : ℝ} (ha : a = 9) (hb : b = 1) : a = 9 ∧ b = 1 := by
  constructor
  · exact ha
  · exact hb
```

**Use it when** a tactic such as `constructor` or `obtain h | h` has created more than one goal. Using one `·` per goal keeps the cases visibly separate. Type it as `\.` or `\cdot` in VS Code.

**Reference.** [Theorem Proving in Lean 4 — Tactics](https://lean-lang.org/theorem_proving_in_lean4/Tactics/)
