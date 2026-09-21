# `sorry`

**Meaning.** `sorry` admits the current goal without proving it, letting the file compile (with a warning) so you can sketch the rest of a proof.

**Example.**
```text
theorem easy : 2 + 2 = 4 := by sorry
```

**Use it when** drafting a proof's structure before filling in every step — never leave it in a finished proof.

**Reference.** [Lean 4 documentation — Debugging & Troubleshooting](https://lean4.dev/language/foundations/debugging)
