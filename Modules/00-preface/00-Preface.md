# Module 0 – Preface

## Learning goals

By the end of this lecture, you can:
- Explain why we check proofs with Lean instead of only writing them in words.
- Tell apart the three roles an expression can play in Lean: mathematical object, proposition (`Prop`), and proof.
- Open a `.lean` file in VS Code, enter common Unicode symbols, and read the **Lean Infoview** panel to tell what `#check` reports from what `#eval` runs.
- Recognize what `sorry` means and why a proof containing it is not finished.

## Motivation

A proof written only in words can hide a small mistake — a dropped minus sign, a division by zero, a missing case. One small slip can make the rest of the proof meaningless. Lean checks every step for you: it shows what you know and what you still need to prove at all times, and it will not let an unjustified step pass silently. A proof is fully verified only when every step is justified — in particular, when it contains no `sorry` or other admitted step (see below).

## Definition

Lean 4 operates on **Dependent Type Theory**, a formal system where every expression has a type (verifiable with the `#check` command):

### Entering symbols

Lean writes mathematical notation in Unicode, not ASCII. In the editor, type a backslash command; when the completion menu appears, press Space or Enter to insert the symbol.

| Input | Symbol | Meaning |
|---|---:|---|
| `\N` | `ℕ` | natural numbers |
| `\Z` | `ℤ` | integers |
| `\R` | `ℝ` | real numbers |
| `\to` | `→` | function or implication |
| `\le` | `≤` | less than or equal to |

You don't need to memorize this table. If you forget a symbol, type `\` followed by a likely English name and check the completion menu.

### 1. Three Roles an Expression Can Play

Everything below is an *expression*; these are not three separate species of thing. What distinguishes them is each expression's **type**, and types stack: a proposition is an expression whose type is `Prop`, and a proof is an expression whose type is that proposition.

- **Mathematical Objects**: expressions denoting values or data — numbers, vectors, functions.
  - `#check 2 + 2` reports that `2 + 2` is a natural number (Lean prints the type as `Nat`; `ℕ` is the same type in prettier notation).
  - `#check fun n : Nat => n + 1` reports a function from natural numbers to natural numbers: `Nat → Nat`, which `import Mathlib` lets you also write as `ℕ → ℕ`.
- **Propositions (`Prop`)**: expressions that *assert* something — statements that could be true or false.
  - `#check 2 + 2 = 4` yields `2 + 2 = 4 : Prop`.
  - A proposition can be named like anything else: after `def MyStatement : Prop := 2 + 2 = 4`, `#check MyStatement` yields `MyStatement : Prop`.
- **Proofs**: an expression `p` whose type is a proposition `P` (written `p : P`) *is* a proof of `P`.
  - `theorem easy : 2 + 2 = 4 := rfl` records `rfl` as a proof of `2 + 2 = 4`, and names that proof `easy`.
  - So the same expression can be described two ways depending on where you stand: `2 + 2 = 4` is a proposition when you ask for *its* type, and it is the *type of* `easy`. Stating something and proving it are one level apart, not two different worlds.

A quick distinction worth fixing now: `#check` reports an expression's type, while `#eval` actually executes computable data and prints the result. The concrete example page below works through both side by side.

A note on reading output: comments in these notes describe what Lean reports, but they are not a transcript. The exact wording in the Infoview (`Nat` vs `ℕ`, for instance) can differ — trust the Infoview.

### 2. Proof Styles: Term Mode vs. Tactic Mode
- **Term-Style Proofs**: Directly writing a functional code term that fulfills the proposition type (e.g., using lambda abstractions `fun m n ↦ ...`).
- **Tactic-Style Proofs**: Writing interactive commands inside a `by` block. Each line in a `by` block transforms the current proof state inside the Infoview until no goals remain.

### 3. Proof State & Infoview Mechanics
While a tactic proof is in progress, the Lean Infoview pane separates the situation into two parts, divided by the symbol `⊢`:
- **Context** (above `⊢`): what is available to you right now — the variables, assumptions, and previously proven facts you can use (e.g., `h1 : a ≤ b`). Think of it as the "Given" side of a written proof.
- **Goal** (below `⊢`): what remains to be shown (e.g., `⊢ a ≤ c`). Think of it as the "Prove" side.
- A single tactic can split one goal into several. When that happens, the Infoview lists multiple goals, and Lean accepts the proof only once every one of them is closed.
- **Completion Marker**: When all goals are resolved, Lean displays `Goals accomplished 🎉`.

### 4. The `sorry` Placeholder
The `sorry` keyword tells Lean to temporarily bypass proving a goal. Lean accepts the declaration, but emits a warning (`declaration uses 'sorry'`) marking it as unproved. This is exactly why "the file has no errors" is not the same as "the theorem is proved": a proof counts as verified only when it contains no `sorry`, and depends on nothing that does. `sorry` is a drafting tool — useful for sketching a proof's structure before filling in the steps.

## First interaction in VS Code

Before any of the examples, get one command running on your own machine — and start a habit you'll use all semester: **predict, then inspect**. Before you ask Lean anything, guess what it will display; then check whether you were right. A wrong guess caught on the first line is quick to correct; the same mistake discovered twenty lines later is harder to trace.

1. **Open the course project folder** provided for this class in VS Code (installation and setup are covered in the first lab lecture), then create a new file named `scratch.lean` **inside that folder**. Two things matter here: the `.lean` extension is what activates the Lean extension, and the course folder is a configured Lean/Mathlib project — later examples that write `import Mathlib` only work inside it, not in an arbitrary folder somewhere on your machine.
2. **Wait for Lean to start.** The status bar shows Lean loading; the first start on a project takes a while. Don't type until it settles.
3. **Type one line**, exactly: `#eval 2 + 2`

   Before moving on, predict what it will display.
4. **Put the text cursor on that line.** Lean reports about the code *at the cursor* — this is the habit to build now.
5. **Open the Infoview** if it isn't already visible: command palette (`Ctrl+Shift+P` / `Cmd+Shift+P`) → *Lean 4: InfoView: Toggle InfoView*. The panel opens beside the editor and shows `4`. Compare it against your prediction.

Where things appear:
- **Infoview panel (right)** — output of `#eval` / `#check`, and, inside a proof, the hypotheses and the remaining goal at your cursor.
- **Squiggles in the editor** — red for errors, yellow/blue for warnings (this is where `declaration uses 'sorry'` shows up).
- **Problems panel** (`Ctrl+Shift+M` / `Cmd+Shift+M`) — the same errors and warnings as a list.

If the Infoview stays empty: check the file is saved with a `.lean` extension, check the cursor is actually on the line, and give Lean time to finish loading. If instead `import Mathlib` reports an unknown package, the file is almost certainly outside the course project folder — move it inside and reopen.

## Concrete example

Let's see the object/proposition distinction, the term-vs-tactic distinction, and `sorry` in action, each on its own page:

- `#eval` and `#check`, telling objects and propositions apart: [Module 0 - eval and check example](Lean/Module%200%20-%20eval%20and%20check%20example.md)
- The same proof written as a term and as a tactic block: [Module 0 - term vs tactic proof example](Lean/Module%200%20-%20term%20vs%20tactic%20proof%20example.md)
- Leaving a goal open with the `sorry` placeholder: [Module 0 - sorry placeholder example](Lean/Module%200%20-%20sorry%20placeholder%20example.md)

## Common pitfalls

- **Confusing Objects, Propositions, and Proofs**: Mistaking a numerical expression (object `2 + 2`) for a truth assertion (`Prop` statement `2 + 2 = 4`) or for a proof of it (`rfl`). Naming a proposition, as with `def MyStatement : Prop := 2 + 2 = 4`, does not prove it.
- **Ignoring the Live Infoview**: Writing tactics blindly without moving the cursor to inspect how the hypothesis context and goal state change after each tactic.
- **Relying on `sorry`**: Forgetting that a proof containing `sorry` is not verified by Lean and will not count as a complete proof. A yellow warning is not a pass.
- **Reusing a Mathlib name**: `import Mathlib` brings thousands of names into scope. If Lean complains that a definition has already been declared, rename yours (this is why the examples use names like `MyStatement`).
- **Syntax Sensitivity & Unicode**: Lean requires exact syntax (e.g., `:=` for definitions, `::` for lists, `→` for implication). Misplaced colons or mismatched parentheses trigger parser errors before Lean can evaluate logic.

## References

- Macbeth, Heather. *The Mechanics of Proof*, Chapter 0: Introduction. <https://hrmacbeth.github.io/math2001/00_Introduction.html>
- Avigad, Jeremy, Patrick Massot, et al. *Mathematics in Lean*, Chapter 1: Introduction. <https://leanprover-community.github.io/mathematics_in_lean/C01_Introduction.html>
