# Module 4 - Using an iff example

## Statement

Once $3a+1\le 7 \iff a\le 2$ is proved, use it in each direction, and use it to rewrite a goal or a hypothesis.

## Code

```lean
import Mathlib

theorem three_mul_add_one_le_seven_iff {a : ℚ} : 3 * a + 1 ≤ 7 ↔ a ≤ 2 := by
  constructor
  · intro h
    linarith
  · intro h
    linarith

example {a : ℚ} (h : 3 * a + 1 ≤ 7) : a ≤ 2 := by
  exact three_mul_add_one_le_seven_iff.mp h

example {a : ℚ} (h : a ≤ 2) : 3 * a + 1 ≤ 7 := by
  exact three_mul_add_one_le_seven_iff.mpr h

example {a : ℚ} (h : a ≤ 2) : 3 * a + 1 ≤ 7 := by
  rw [three_mul_add_one_le_seven_iff]
  exact h

example {a : ℚ} (h : 3 * a + 1 ≤ 7) : a ≤ 2 := by
  rw [three_mul_add_one_le_seven_iff] at h
  exact h
```

## Walkthrough

- The first block proves the equivalence and gives it a name with [`theorem`](../../../Glossary/theorem.md), so that later proofs can cite it. (The [Iff example](Module%204%20-%20Iff%20example.md) proves the same statement with a full calculation.)
- An [`↔`](../../../Glossary/iff.md) statement contains two implications. `.mp` selects the direction from left to right: here `3 * a + 1 ≤ 7 → a ≤ 2`. Giving it `h : 3 * a + 1 ≤ 7` produces `a ≤ 2`.
- `.mpr` selects the direction from right to left: `a ≤ 2 → 3 * a + 1 ≤ 7`.
- Check the direction before you choose. If you use `.mp` where `.mpr` is needed, Lean reports a type mismatch: the hypothesis you gave is the wrong side of the equivalence.
- [`rw`](../../../Glossary/rw.md) treats an `↔` like an equation between statements. In the third example, the goal `3 * a + 1 ≤ 7` is the left side, so `rw` replaces it by the right side `a ≤ 2`, and `exact h` closes it.
- `rw [...] at h` does the same replacement inside a hypothesis: `h : 3 * a + 1 ≤ 7` becomes `h : a ≤ 2`.

## Back-link

- [Module 4 – Proofs with Structure, II](../04-Proofs%20with%20Structure%20II.md)
