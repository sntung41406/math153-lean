# `by`

**Meaning.** `by` switches from writing a term directly to writing a sequence of tactics that build the term for you.

**Example.**
```lean
theorem easy : 2 + 2 = 4 := by rfl
```

**Use it when** you want to build a proof step by step with tactics, inspecting the proof state along the way, instead of writing the finished term outright.

**Reference.** [Lean 4 documentation — Proof state](https://lean4.dev/tactics/intro/proof-state)
