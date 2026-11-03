# Pattern matching and recursive definitions

**Meaning.** A function can be defined by listing cases, one per line, each starting with `|`. A case may use the function at a smaller input, which makes the definition recursive. A [`theorem`](theorem.md) can use the same form: each case proves the statement for that pattern, and using the theorem at a smaller input acts as an inductive hypothesis.

**Example.**
```lean
import Mathlib

def f : ℕ → ℕ
  | 0 => 1
  | n + 1 => 2 * f n

theorem f_pos : ∀ n, 0 < f n
  | 0 => by
      rw [f]
      norm_num
  | n + 1 => by
      have IH := f_pos n
      rw [f]
      omega
```

**Use it when** you define a recursive sequence with [`def`](def.md). Then [`rw`](rw.md) with the function's name unfolds one step of the definition. Lean accepts a recursive use only if it can see that the input gets smaller.

**Reference.** [Theorem Proving in Lean 4 — Induction and Recursion](https://lean-lang.org/theorem_proving_in_lean4/Induction-and-Recursion/)
