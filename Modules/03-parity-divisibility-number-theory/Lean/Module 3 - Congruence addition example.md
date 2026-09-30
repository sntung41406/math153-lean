# Module 3 - Congruence addition example

## Statement

Prove that if $a\equiv b$ and $c\equiv d\pmod n$, then $a+c\equiv b+d\pmod n$, by combining the two divisibility witnesses. (Additional reading.)

## Code

```lean
import Mathlib

example {n a b c d : ℤ} (h1 : a ≡ b [ZMOD n]) (h2 : c ≡ d [ZMOD n]) :
    a + c ≡ b + d [ZMOD n] := by
  rw [Int.modEq_iff_dvd] at *
  obtain ⟨x, hx⟩ := h1
  obtain ⟨y, hy⟩ := h2
  use x + y
  calc
    b + d - (a + c) = (b - a) + (d - c) := by ring
    _ = n * x + n * y                   := by rw [hx, hy]
    _ = n * (x + y)                     := by ring
```

The same fact is already in Mathlib, so in later proofs you can simply cite it:

```lean
import Mathlib

example {n a b c d : ℤ} (h1 : a ≡ b [ZMOD n]) (h2 : c ≡ d [ZMOD n]) :
    a + c ≡ b + d [ZMOD n] :=
  Int.ModEq.add h1 h2
```

## Walkthrough

- `rw [Int.modEq_iff_dvd] at *` rewrites the two hypotheses *and* the goal with [`Int.modEq_iff_dvd`](../../../Glossary/Int.modEq_iff_dvd.md). Now `h1 : n ∣ b - a`, `h2 : n ∣ d - c`, and the goal is `n ∣ b + d - (a + c)`. (`at *` means "everywhere".)
- [`obtain`](../../../Glossary/obtain.md) takes out the witnesses: `hx : b - a = n * x` and `hy : d - c = n * y`.
- The goal needs its own witness. Adding the two differences gives `n * x + n * y = n * (x + y)`, so [`use`](../../../Glossary/use.md) `x + y`.
- The `calc` block checks this: first regroup the difference with `ring`, then substitute `hx` and `hy`, then factor out `n`.
- Mathlib subtracts in the order `b - a`, while the handwritten proof in the main note uses `a - b`. The steps are the same; only the signs of the witnesses change.
- In the second code block, [`Int.ModEq.add`](../../../Glossary/Int.ModEq.add.md) is the Mathlib version of this exact fact. `rel` (used in the substitution examples) uses facts like this one behind the scenes.

## Back-link

- [Module 3 – Parity, Divisibility & Number Theory](../03-Parity%20Divisibility%20%26%20Number%20Theory.md)
