# Module 6 - Square root of two by descent

## Statement

Prove that there are no integers $a,b$ with $b\ne0$ and $a^2=2b^2$, and conclude that $\sqrt2$ is irrational.

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

- This is the helper from [Module 4 - Coprime core of the √2 argument](../../04-proofs-with-structure-ii/Lean/Module%204%20-%20Coprime%20core%20of%20the%20sqrt%202%20argument.md), which explains it line by line. It is repeated here because each page is compiled as its own file.

## Descent

### Code

```lean
theorem no_pair (n : ℕ) : ∀ a b : ℤ, b.natAbs = n → b ≠ 0 → a ^ 2 ≠ 2 * b ^ 2 := by
  induction n using Nat.strong_induction_on with
  | _ n IH =>
    intro a b hbn hb h2
    have ha : Even a := by
      apply even_of_even_sq
      use b ^ 2
      rw [h2]
      ring
    obtain ⟨c, hc⟩ := ha
    have hbeven : Even b := by
      apply even_of_even_sq
      use c ^ 2
      rw [hc] at h2
      linarith
    obtain ⟨d, hd⟩ := hbeven
    have hcd : c ^ 2 = 2 * d ^ 2 := by
      rw [hc, hd] at h2
      linarith
    have hd0 : d ≠ 0 := by omega
    have hlt : d.natAbs < n := by omega
    exact IH d.natAbs hlt c d rfl hd0 hcd
```

### Walkthrough

- The measure of a pair is `b.natAbs`, the absolute value $|b|$ as a natural number ([`Int.natAbs`](../../../Glossary/Int.natAbs.md)).
- **The hypothesis is quantified over all pairs.** The statement $P(n)$ is `∀ a b : ℤ, b.natAbs = n → b ≠ 0 → a ^ 2 ≠ 2 * b ^ 2`. If `a` and `b` were fixed before the induction, `IH` would talk only about those two numbers, and we could not apply it to the smaller pair `c`, `d`.
- [`Nat.strong_induction_on`](../../../Glossary/Nat.strong_induction_on.md) gives `IH`, which states $P(m)$ for every $m<n$.
- The goal ends in [`≠`](../../../Glossary/ne.md), so [`intro`](../../../Glossary/intro.md) can also introduce `h2 : a ^ 2 = 2 * b ^ 2`. From here we prove `False`.
- As in Module 4, `h2` shows that `a` and then `b` are [even](../../../Glossary/Even.md), which gives `hc : a = c + c` and `hd : b = d + d`.
- Substituting both into `h2` gives $4c^2=8d^2$, and [`linarith`](../../../Glossary/linarith.md) gets `hcd : c ^ 2 = 2 * d ^ 2`. This is the same equation for a smaller pair.
- [`omega`](../../../Glossary/omega.md) understands `natAbs`. From `hb`, `hd`, and `hbn` it proves `hd0 : d ≠ 0` and `hlt : d.natAbs < n`.
- The last line applies `IH` at the measure `d.natAbs` to the pair `c`, `d`. The [`rfl`](../../../Glossary/rfl.md) proves `d.natAbs = d.natAbs`. The result contradicts `hcd`, which closes the goal.

## From $\sqrt2$ to an integer pair

### Code

```lean
example : Irrational (√2) := by
  rintro ⟨q, hq⟩
  have hq2 : (q : ℝ) ^ 2 = 2 := by
    rw [hq]
    exact Real.sq_sqrt (by norm_num)
  have hq3 : q ^ 2 = 2 := by exact_mod_cast hq2
  have hmul : q * q.den = q.num := Rat.mul_den_eq_num q
  have hkey : (q.num : ℚ) ^ 2 = 2 * (q.den : ℚ) ^ 2 := by
    rw [← hmul, mul_pow, hq3]
  have hint : q.num ^ 2 = 2 * (q.den : ℤ) ^ 2 := by exact_mod_cast hkey
  have hden : (q.den : ℤ) ≠ 0 := by exact_mod_cast q.den_nz
  exact no_pair _ q.num q.den rfl hden hint
```

### Walkthrough

- [`Irrational`](../../../Glossary/Irrational.md) `x` means that `x` is not equal to any rational number. So [`rintro`](../../../Glossary/rintro.md) `⟨q, hq⟩` assumes a rational `q` with `hq : (q : ℝ) = √2`, and the goal is `False`.
- [`Real.sq_sqrt`](../../../Glossary/Real.sq_sqrt.md) says that squaring $\sqrt x$ gives back $x$, for $x\ge0$. This gives `hq2`, a statement in `ℝ`.
- [`exact_mod_cast`](../../../Glossary/exact_mod_cast.md) moves a statement between number systems when only casts differ. Here it moves `hq2` from `ℝ` to `ℚ`, then later moves `hkey` from `ℚ` to `ℤ`.
- [`q.num` and `q.den`](../../../Glossary/Rat.num-den.md) are the numerator and denominator of `q`. [`Rat.mul_den_eq_num`](../../../Glossary/Rat.mul_den_eq_num.md) gives $q\cdot\text{den}=\text{num}$.
- `hkey` is the calculation $\text{num}^2=(q\cdot\text{den})^2=q^2\,\text{den}^2=2\,\text{den}^2$, using [`mul_pow`](../../../Glossary/mul_pow.md) and `hq3`.
- [`q.den_nz`](../../../Glossary/Rat.den_nz.md) says the denominator is not $0$. The last line applies `no_pair` to the pair `q.num`, `q.den`, and the underscore lets Lean fill in the measure. The result contradicts `hint`.
- The proof does not use that `q.num` and `q.den` are coprime. Descent does not need it.
- Mathlib also has this result as a single named theorem. We prove it here because the proof is the point of this page.
- These blocks build on each other, so they belong in the same file, in this order.

## Back-link

- [Module 6 – Induction](../06-Induction.md)
