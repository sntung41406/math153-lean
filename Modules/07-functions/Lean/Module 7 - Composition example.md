# Module 7 - Composition example

## Statement

Given $f(a) = a+3$, $g(b) = 2b$, $h(c) = 2c+6$ on $\mathbb{R}$, prove $g \circ f = h$ and $f \circ g \ne h$.

## Code

```lean
import Mathlib

def f (a : ℝ) : ℝ := a + 3
def g (b : ℝ) : ℝ := 2 * b
def h (c : ℝ) : ℝ := 2 * c + 6

example : g ∘ f = h := by
  ext x
  show g (f x) = h x
  dsimp only [f, g, h]
  ring

example : f ∘ g ≠ h := by
  intro H
  have H0 : f (g 0) = h 0 := congrFun H 0
  dsimp only [f, g, h] at H0
  norm_num at H0
```

## Walkthrough

- The goal `g ∘ f = h` is an equality of *functions*. [`ext`](../../../Glossary/ext.md) `x` uses function extensionality: it reduces the goal to proving the two sides agree at an arbitrary point `x`, leaving the goal `(g ∘ f) x = h x`.
- [`show`](../../../Glossary/show.md) `g (f x) = h x` restates the goal in its unfolded form — `(g ∘ f) x` and `g (f x)` are definitionally the same thing, since `∘` is defined exactly that way.
- `dsimp only [f, g, h]` unfolds all three definitions, turning the goal into `2 * (x + 3) = 2 * x + 6`, which `ring` closes.
- **Reversing the order.** The goal `f ∘ g ≠ h` means "`f ∘ g = h` is false", so `intro H` assumes `H : f ∘ g = h` and leaves `False` to prove.
- An equation between functions can be evaluated at any input. [`congrFun`](../../../Glossary/congrFun.md) `H 0` evaluates both sides at `0`, giving `f (g 0) = h 0`.
- After unfolding, `H0` is `2 * 0 + 3 = 2 * 0 + 6`, that is `3 = 6`. [`norm_num`](../../../Glossary/norm_num.md) `at H0` sees that this is false and closes the goal. One input where the functions disagree is enough.

## Back-link

- [Module 7 – Functions](../07-Functions.md)
