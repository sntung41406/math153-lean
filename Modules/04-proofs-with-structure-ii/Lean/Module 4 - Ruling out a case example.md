# Module 4 - Ruling out a case example

## Statement

Let $x,y$ be real numbers with $0<xy$ and $0\le x$. Prove $0<y$.

## With a case split

### Code

```lean
import Mathlib

example {y : ℝ} (x : ℝ) (h : 0 < x * y) (hx : 0 ≤ x) : 0 < y := by
  obtain hpos | hneg := lt_or_ge 0 y
  · exact hpos
  · have H : x * y ≤ 0 := by
      calc
        x * y ≤ x * 0 := by gcongr
        _ = 0 := by ring
    linarith
```

### Walkthrough

- [`lt_or_ge`](../../../Glossary/lt_or_ge.md) `0 y` states `0 < y ∨ 0 ≥ y`, and [`obtain`](../../../Glossary/obtain.md) splits it into two cases.
- In the case `hpos : 0 < y`, the goal is exactly `hpos`.
- The case `hneg : 0 ≥ y` cannot really happen. Multiplying `y ≤ 0` by the nonnegative number `x` gives `H : x * y ≤ 0`. Together with `h : 0 < x * y` this is impossible, so [`linarith`](../../../Glossary/linarith.md) closes the goal. We did not prove `0 < y` in this case; we showed that the case contradicts the hypotheses, and then any goal follows.

## With `by_contra`

### Code

```lean
import Mathlib

example {y : ℝ} (x : ℝ) (h : 0 < x * y) (hx : 0 ≤ x) : 0 < y := by
  by_contra hy
  have hy' : y ≤ 0 := not_lt.mp hy
  have H : x * y ≤ 0 := by
    calc
      x * y ≤ x * 0 := by gcongr
      _ = 0 := by ring
  linarith
```

### Walkthrough

- The goal `0 < y` is a *positive* claim: it contains no `¬`. [`by_contra`](../../../Glossary/by_contra.md) `hy` assumes its negation, `hy : ¬0 < y`, and changes the goal to [`False`](../../../Glossary/False.md).
- [`not_lt`](../../../Glossary/not_lt.md) `: ¬a < b ↔ b ≤ a` turns the negated inequality into a usable one. It is an [`↔`](../../../Glossary/iff.md), and `.mp` uses it from left to right: `hy' : y ≤ 0`.
- The rest is the same calculation as before: `H : x * y ≤ 0` contradicts `h : 0 < x * y`.
- Compare the two proofs. The case split considers both possibilities and closes the impossible one. `by_contra` goes straight to the impossible one. The mathematics is the same.
- Compare also with [`intro`](../../../Glossary/intro.md). To prove a goal `¬ P`, use `intro h`: this is just the meaning of `¬`. Use `by_contra` when the goal is *not* a negation and you want to assume it is false.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
