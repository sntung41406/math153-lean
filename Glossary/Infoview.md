# Infoview

**Meaning.** The Infoview is the VS Code panel that shows what Lean reports at your cursor — `#check`/`#eval` output, or the hypotheses and goal during a tactic proof.

**Example.** Open it via the command palette (`Ctrl+Shift+P` / `Cmd+Shift+P`) → *Lean 4: InfoView: Toggle InfoView*, then place the cursor on a line to see its output.

**Reading a proof state.** Inside a tactic proof, the Infoview shows the current proof state, for example:
```
a : ℤ
h : a = 2
⊢ a + 1 = 3
```
Everything above the `⊢` is the context: the variables and hypotheses you can use. The `⊢` (read "turnstile") separates that context from the goal, the statement still left to prove, which is on its right.

**Use it when** you want to see the result of a command, or check the current proof state while writing tactics.

**Reference.** [Lean 4 documentation — Environment](https://lean4.dev/language/foundations/environment)
