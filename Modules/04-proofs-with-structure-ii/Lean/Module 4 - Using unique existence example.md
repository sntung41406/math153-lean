# Module 4 - Using unique existence example

## Statement

Let $x$ be a rational number. Suppose there is a unique rational $a$ with $a^2=x$. Prove $x=0$.

## Code

```lean
import Mathlib

example {x : ℚ} (hx : ∃! a : ℚ, a ^ 2 = x) : x = 0 := by
  obtain ⟨a, ha1, ha2⟩ := hx
  dsimp at ha2
  have h1 : -a = a := by
    apply ha2
    calc
      (-a) ^ 2 = a ^ 2 := by ring
      _ = x := ha1
  have h2 : a = 0 := by linarith
  calc
    x = a ^ 2 := by rw [ha1]
    _ = 0 ^ 2 := by rw [h2]
    _ = 0 := by norm_num
```

## Walkthrough

- A hypothesis [`∃!`](../../../Glossary/exists-unique.md) holds three pieces of information. [`obtain`](../../../Glossary/obtain.md) `⟨a, ha1, ha2⟩ := hx` extracts all three: the witness `a`, its property `ha1 : a ^ 2 = x`, and the uniqueness condition `ha2`.
- Straight after `obtain`, Lean displays `ha2` in a raw form: `∀ (y : ℚ), (fun a => a ^ 2 = x) y → y = a`. [`dsimp`](../../../Glossary/dsimp.md) `at ha2` tidies it to `ha2 : ∀ (y : ℚ), y ^ 2 = x → y = a`. It says: every `y` with the same property equals `a`.
- The idea of the proof: $-a$ has the same square as $a$, so by uniqueness $-a$ must *be* $a$.
- `apply ha2` matches the goal `-a = a` with the conclusion `y = a`, so `y` is `-a`. The new goal is the antecedent `(-a) ^ 2 = x`, proved by the short `calc`.
- From `h1 : -a = a`, [`linarith`](../../../Glossary/linarith.md) gets `a = 0`, and the final `calc` gives `x = a ^ 2 = 0`.
- Notice how uniqueness is *used*: we produce a second candidate and conclude that the two candidates are equal.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
