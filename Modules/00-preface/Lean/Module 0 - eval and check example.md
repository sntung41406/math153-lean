# Module 0 - eval and check example

## Statement

Use `#eval` to compute an expression's value, and `#check` to see an expression's type — distinguishing a mathematical **object** (like a number) from a **proposition** (`Prop`, a statement that could be true or false).

## Code

```lean
import Mathlib

-- Computational evaluation
#eval 2 + 2
#eval "Hello, World!"
#eval 15 * 6 - 10

-- Type checking: object vs proposition
#check 2 + 2               -- an object: a natural number
#check 2 + 2 = 4           -- a proposition: a statement that could be true or false

-- Giving a proposition a name
def MyStatement : Prop := 2 + 2 = 4

#check MyStatement         -- MyStatement : Prop
```

## Walkthrough

- **`#eval 2 + 2`**: asks Lean to compute the value (`4`) and print it in the Infoview.
- **`#check 2 + 2` vs `#check 2 + 2 = 4`**:
  - `#check 2 + 2` reports that `2 + 2` is an **object** — a natural number. Lean prints its type as `Nat` (`ℕ` is just prettier notation for the same type).
  - `#check 2 + 2 = 4` reports type `Prop` — the equality is a **statement**, something that could be true or false, not a number.
  - Note the difference is `=`, not the numbers: `2 + 2` names a value, `2 + 2 = 4` claims something about values.
- **`def MyStatement : Prop := 2 + 2 = 4`**: a proposition can be given a name, just like a number can. `MyStatement` is now an ordinary expression whose type is `Prop`; `#check MyStatement` confirms it.
- Naming a proposition does **not** prove it. `MyStatement` is the claim; a proof of it would be a separate expression whose type *is* `MyStatement` — see [Module 0 - term vs tactic proof example](Module%200%20-%20term%20vs%20tactic%20proof%20example.md).

## Back-link

- [Module 0 – Preface](../00-Preface.md)
