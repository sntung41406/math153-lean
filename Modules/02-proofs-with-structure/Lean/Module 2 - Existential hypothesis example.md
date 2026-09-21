# Module 2 - Existential hypothesis example

## Statement

Use `obtain` to extract a witness and its property from a "there exists" hypothesis.

## Code

```lean
import Mathlib

example {a : ℚ} (h : ∃ b : ℚ, a = b ^ 2 + 1) : a > 0 := by
  obtain ⟨b, hb⟩ := h
  calc
    a = b ^ 2 + 1 := hb
    _ > 0          := by positivity
```

## Walkthrough

- `h : ∃ b : ℚ, a = b ^ 2 + 1` says some rational `b` makes `a = b ^ 2 + 1` true, without saying which one.
- `obtain ⟨b, hb⟩ := h` uses the same angle-bracket pattern as for "and"; it introduces a fresh variable `b` standing for that unknown witness, along with `hb : a = b ^ 2 + 1` recording its defining property.
- The rest of the proof works with `b` as an ordinary (if unspecified) rational number; `positivity` recognizes from its form that `b ^ 2 + 1` is a sum of a nonnegative square and a positive number, hence positive.

## Back-link

- [Module 2 – Proofs with Structure](../02-Proofs%20with%20Structure.md)
