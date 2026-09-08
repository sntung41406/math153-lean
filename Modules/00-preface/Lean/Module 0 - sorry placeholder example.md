# Module 0 - sorry placeholder example

## Statement

Use the `sorry` placeholder to leave a goal temporarily unproved, and see the warning Lean emits when a proof relies on it.

## Code

```lean
import Mathlib

def MyStatement : Prop := 2 + 2 = 4

theorem my_statement_unfinished : MyStatement := by
  sorry
```

## Walkthrough

- Writing `sorry` tells Lean "accept this goal as proved for now, without a real justification."
- Lean still accepts the file, but it attaches a warning to `my_statement_unfinished`: `declaration uses 'sorry'`.
- So "no red error" is not the same as "proved". A declaration counts as fully verified only when it contains **no** `sorry` and depends on nothing that does.
- `sorry` is genuinely useful while drafting: you can lay out the shape of a long proof, leave the hard steps as `sorry`, and fill them in one at a time. Just never hand in a proof that still has one.

## Back-link

- [Module 0 – Preface](../00-Preface.md)
