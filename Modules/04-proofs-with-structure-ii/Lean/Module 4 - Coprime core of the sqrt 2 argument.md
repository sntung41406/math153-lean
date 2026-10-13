# Module 4 - Coprime core of the √2 argument

## Statement

Prove that no coprime integers $a,b$ satisfy $a^2=2b^2$. This is the central step in the proof that $\sqrt2$ is irrational; it is not yet the complete proof.

## Helper: an even square has an even base

### Code

```lean
import Mathlib

theorem even_of_even_sq {a : ℤ} (h : Even (a ^ 2)) : Even a := by
  obtain ha | ha := Int.even_or_odd a
  · exact ha
  · obtain ⟨k, hk⟩ := ha
    obtain ⟨m, hm⟩ := h
    have h1 : a ^ 2 = 2 * (2 * k ^ 2 + 2 * k) + 1 := by
      rw [hk]
      ring
    omega
```

### Walkthrough

- [`Int.even_or_odd`](../../../Glossary/Int.even_or_odd.md) splits into two cases. If `a` is even, we are done.
- If `a` is odd, write `hk : a = 2 * k + 1`. Then $a^2 = 4k^2+4k+1 = 2(2k^2+2k)+1$ is odd: this is `h1`.
- But `hm : a ^ 2 = m + m` says $a^2$ is even. A number cannot be both even and odd, and [`omega`](../../../Glossary/omega.md) finds this contradiction from `h1` and `hm`. So the odd case is impossible.

## The main argument

### Code

```lean
example : ¬ ∃ a b : ℤ, IsCoprime a b ∧ a ^ 2 = 2 * b ^ 2 := by
  intro h
  obtain ⟨a, b, hab, h2⟩ := h
  have ha : Even a := by
    apply even_of_even_sq
    use b ^ 2
    rw [h2]
    ring
  obtain ⟨c, hc⟩ := ha
  have hb : Even b := by
    apply even_of_even_sq
    use c ^ 2
    rw [hc] at h2
    linarith
  obtain ⟨d, hd⟩ := hb
  obtain ⟨u, v, huv⟩ := hab
  have h3 : 2 * (u * c + v * d) = 1 := by
    rw [← huv, hc, hd]
    ring
  omega
```

### Walkthrough

- The goal is a negation, so [`intro`](../../../Glossary/intro.md) `h` assumes that such `a` and `b` exist, and [`obtain`](../../../Glossary/obtain.md) names the pieces: `hab : IsCoprime a b` and `h2 : a ^ 2 = 2 * b ^ 2`.
- **`a` is even.** `h2` says $a^2=2b^2=b^2+b^2$, so $a^2$ is even with witness `b ^ 2`, and the helper gives `Even a`. Write `hc : a = c + c`.
- **`b` is even.** Substituting `hc` into `h2` gives $(c+c)^2=2b^2$, that is $4c^2=2b^2$, so $b^2=c^2+c^2$. Again the helper applies. Write `hd : b = d + d`.
- **Contradiction.** [`IsCoprime`](../../../Glossary/IsCoprime.md) `a b` means there are integers `u`, `v` with `huv : u * a + v * b = 1`. This is the Bézout form of "coprime" from Module 3. Substituting `a = c + c` and `b = d + d` gives `h3 : 2 * (u * c + v * d) = 1`: the number $1$ would be even. `omega` closes the goal.
- In words: if $a^2=2b^2$ then $a$ and $b$ are both even, so they share the factor $2$ and cannot be coprime.
- What is still missing for "$\sqrt2$ is irrational": one must show that every fraction can be written with coprime numerator and denominator. That step is deferred, as Module 3 announced.
- This block uses `even_of_even_sq` from the first block, so the two blocks belong in the same file, in this order.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
