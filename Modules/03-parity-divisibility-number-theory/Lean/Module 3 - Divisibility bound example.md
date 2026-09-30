# Module 3 - Divisibility bound example

## Statement

Prove that if $a\mid b$ and $b>0$ (naturals), then $a\le b$.

## Code

```lean
import Mathlib

example {a b : ℕ} (hb : 0 < b) (hab : a ∣ b) : a ≤ b := by
  obtain ⟨k, hk⟩ := hab
  have H1 : 0 < a * k := by rw [← hk]; exact hb
  have hk0 : k ≠ 0 := by rintro rfl; simp at H1
  have H : 1 ≤ k := Nat.one_le_iff_ne_zero.mpr hk0
  calc
    a = a * 1 := by ring
    _ ≤ a * k := by gcongr
    _ = b     := by rw [hk]
```

## Walkthrough

- From `a ∣ b` we get `b = a * k` for some `k`. Substituting into `0 < b` gives `H1 : 0 < a * k`.
- If `k` were `0`, `H1` would say `0 < 0`, so `k ≠ 0`. The line `rintro rfl; simp at H1` proves this: [`rintro`](../../../Glossary/rintro.md) `rfl` assumes `k = 0` and replaces `k` by `0` everywhere, and [`simp`](../../../Glossary/simp.md) `at H1` simplifies `H1` to `0 < 0`, which is false, so this case closes. Since `k` is a natural number, `k ≠ 0` gives `1 ≤ k`; the lemma [`Nat.one_le_iff_ne_zero`](../../../Glossary/Nat.one_le_iff_ne_zero.md) `: 1 ≤ n ↔ n ≠ 0` states this, and `.mpr` uses it from right to left.
- The final `calc` chain uses that bound: `a = a * 1 ≤ a * k = b`, where [`gcongr`](../../../Glossary/gcongr.md) closes the middle step by recognizing it only needs to know `1 ≤ k` (a common nonnegative factor `a` on both sides).
- This is why the hypothesis `0 < b` matters: without it, `k` could be `0`, and the bound would fail.

## Back-link

- [Module 3 – Parity, Divisibility & Number Theory](../03-Parity%20Divisibility%20%26%20Number%20Theory.md)
