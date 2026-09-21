# `rfl`

**Meaning.** `rfl` is the proof that anything equals itself, once both sides are unfolded to the same value.

**Example.**
```lean
theorem easy : 2 + 2 = 4 := rfl
```

**Use it when** both sides of an equality goal compute to the same value. Note: `rfl` also works inside tactic mode (`by rfl`), not just as a standalone term.

**Reference.** [Lean 4 documentation — `rfl`](https://lean4.dev/tactics/core/rfl)
