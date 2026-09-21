# `nlinarith`

**Meaning.** `nlinarith` extends `linarith` with a limited search over products of hypotheses, for goals that need a bit of nonlinear reasoning.

**Example.**
```lean
import Mathlib

example {x y : ℝ} (hx : 0 ≤ x) (hy : 0 ≤ y) : 0 ≤ x * y := by
  nlinarith
```

**Use it when** `linarith` fails because the proof needs to multiply hypotheses together, as here, where `0 ≤ x * y` comes from multiplying `0 ≤ x` and `0 ≤ y`. `linarith` never multiplies hypotheses; `nlinarith` also tries products of pairs of them.

**Reference.** [Lean 4 documentation — `nlinarith`](https://lean4.dev/tactics/mathlib/nlinarith)
