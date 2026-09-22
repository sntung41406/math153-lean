# Module 1 – Proofs by Calculation

## Learning goals

By the end of this lecture, you can:
- Read and construct a [`calc`](../../Glossary/calc.md) chain in which each step follows from the last.
- Use forward and reverse [`rw`](../../Glossary/rw.md) to substitute an equality.
- Use [`norm_num`](../../Glossary/norm_num.md), and recognise [`ring`](../../Glossary/ring.md) as a checker for a rearrangement already identified on paper.
- Check whether a simple inequality step has the correct direction.

## Motivation

On paper, calculational proofs are often written casually — substituting terms, rearranging equations, manipulating inequalities — and that casualness is exactly where subtle errors sneak in, like misplacing a minus sign or substituting an inequality under a negative multiplier without flipping it. Writing the proof as an explicit, justified chain of steps forces honesty about every part of the reasoning.

## Definition

A **proof by calculation** proves an equality or inequality by writing a single chain of expressions that starts at one side of the goal and ends at the other, where each link in the chain is justified by a calculation, an equality rewrite, or — for inequalities — a valid order rule.

### Reading a calculation chain

The simplest chain replaces a known value and then computes.

**Example.** Suppose $\text{total}=12$. Show $\text{total}-4=8$.

**Proof.** $\text{total}-4=12-4=8$.

Every line in a `calc` chain must follow from the line above it — that is the whole discipline, before any tactic choice matters.

In the Lean version linked below, `_` in later `calc` lines stands for the right-hand side of the preceding line. The proof after `:=` must close that one individual link. The Lean version states the goal with [`example`](../../Glossary/example.md) rather than a named `theorem`, since the result is not reused by name.

See this proof formalized in Lean: [Module 1 - Numeric calculation](Lean/Module%201%20-%20Numeric%20calculation.md)

### Creating a useful expression

Often, no hypothesis's side appears directly in the goal. The trick is to introduce the missing expression by adding and subtracting the same quantity, or — when that quantity is known to be nonzero — multiplying and dividing by it.

**Example.** Let $x$ be an integer with $x+4=2$. Show $x=-2$.

**Proof.** The hypothesis only mentions $x+4$, so first write $x=(x+4)-4$, then substitute:
$$x=(x+4)-4=2-4=-2.$$
The first equality is the mathematical idea — finding it is the actual work. `ring` only checks that the rearrangement is valid; it does not find it for you.

See this proof formalized in Lean: [Module 1 - Creating a useful expression](Lean/Module%201%20-%20Creating%20a%20useful%20expression.md)

### Forward and reverse rewriting

A hypothesis can substitute in either direction: forward, replacing its left-hand side with its right-hand side, or reverse, replacing its right-hand side with its left-hand side.

**Example.** Suppose $y=x+1$ and $z=x+1$. Show $y=z$.

**Proof.** Both sides equal $x+1$, so $y=x+1=z$ — using the first fact forward, and the second backward.

See this proof formalized in Lean, contrasting forward and reverse substitution: [Module 1 - Forward and reverse rewrite](Lean/Module%201%20-%20Forward%20and%20reverse%20rewrite.md)

### Guided practice: combining the pattern

**Example.** Let $r,s$ be integers with $r+2s=-1$ and $s=3$. Show $r=-7$.

**Proof.** Create the expression that matches the hypothesis, then substitute twice.
$$r=(r+2s)-2s=-1-2s=-1-2\cdot3=-7.$$

See this proof formalized in Lean: [Module 1 - Guided calculation practice](Lean/Module%201%20-%20Guided%20calculation%20practice.md)

### A longer challenge: algebra, substitution, algebra

Once the basic pattern is solid, the same ideas chain together into longer proofs: **algebra, substitution, algebra**.

**Example.** Let $a,b$ be rational numbers with $a-b=4$ and $ab=1$. Show $(a+b)^2=20$.

**Proof.**
$$(a+b)^2 = (a-b)^2+4ab = 4^2+4\cdot 1 = 20.$$
Step 1 is a pure algebraic rearrangement (expanding the square); step 2 substitutes the two given facts; step 3 is algebra again.

See this proof formalized in Lean: [Module 1 - Equality proof by calc](Lean/Module%201%20-%20Equality%20proof%20by%20calc.md)

### Chains of inequalities

The calculation technique works for inequalities too, using rules for how $<,\le,>,\ge$ behave under the same operations:
- adding or subtracting the same quantity from both sides preserves the inequality;
- multiplying both sides by a nonnegative number preserves it; multiplying by a negative number reverses it;
- steps chain transitively only when the directions agree ($A\ge B$ and $B>C$ combine to $A>C$).

**A step that looks like a chain but isn't.** From $A\ge B$ and $B\le C$, nothing follows about $A$ and $C$: both arrows point *at* $B$ rather than passing through it, so there is no chain from $A$ to $C$. The two facts alone imply neither direction — for example, $(A,B,C)=(5,1,100)$ satisfies both $A\ge B$ and $B\le C$ while giving $A<C$, but $(A,B,C)=(100,1,5)$ satisfies the same two facts while giving $A>C$.

**Example.** Let $x$ be an integer with $x\le 2$. Show $x+3\le 5$.

**Proof.** Adding $3$ to both sides of $x\le2$ preserves the inequality, giving $x+3\le5$ directly.

See this proof formalized in Lean: [Module 1 - Order-preserving step](Lean/Module%201%20-%20Order-preserving%20step.md)

See a longer inequality chain, reserved as challenge/practice material, formalized in Lean: [Module 1 - Inequality proof by calc](Lean/Module%201%20-%20Inequality%20proof%20by%20calc.md)

### Using nonnegativity to bound one side

A common trick for inequalities: since squares (and other manifestly nonnegative expressions) are $\ge 0$, adding a nonnegative quantity can only make it bigger — giving a free inequality step.

**Example.** Suppose $m^2+n\le 2$. Show $n\le 2$.

**Proof.** Since $m^2\ge 0$, we get $n\le m^2+n\le 2$.

See this proof formalized in Lean: [Module 1 - Linear and nonlinear automation](Lean/Module%201%20-%20nlinarith%20square%20example.md)

### Automation shortcuts: [`linarith`](../../Glossary/linarith.md) and [`nlinarith`](../../Glossary/nlinarith.md)

Once you can build a chain by hand, `linarith` and `nlinarith` automate steps that are purely linear (or, for `nlinarith`, a bounded amount of nonlinear reasoning) — they are shortcuts for a chain you already understand, not a replacement for understanding it. For example, from $a-2b=1$ we can conclude $a=2b+1$ directly, without spelling out an algebra step, and this covers more ground than it might look: even solving $3w+1=4$ for $w$ — which needs dividing by a coefficient — collapses to one step. The real limit of `linarith` is a product or power of unknowns (like `x * y` or `m ^ 2`), which it treats as an opaque term rather than reasoning about. Handing it a fact about that term can be enough: in the nonnegativity example above, `linarith [sq_nonneg m]` works — [`sq_nonneg`](../../Glossary/sq_nonneg.md) supplies exactly that fact — because `m ^ 2` only ever appears as one opaque term. When the reasoning genuinely multiplies facts together — from $0\le x$ and $0\le y$, conclude $0\le xy$ — `linarith` cannot help; `nlinarith` can close some of these goals, or you can plan the calculation by hand.

Try both tactics on today's examples as optional self-practice; they are revisited properly in the Week 2 Lecture 2 practice session for this module.

See these shortcuts formalized in Lean: [Module 1 - linarith shortcut](Lean/Module%201%20-%20linarith%20shortcut.md) and [Module 1 - Linear and nonlinear automation](Lean/Module%201%20-%20nlinarith%20square%20example.md)

## Common pitfalls

- **Choosing the number system too late.** Choose the number system before rearranging. On `ℕ`, subtraction stops at zero and division rounds down; calculations involving negative results or ordinary fractions usually belong in `ℤ`, `ℚ`, or `ℝ`.
- **Chaining inequalities that don't actually chain.** Before chaining inequalities, check that both arrows point from the first expression toward the last.
- **Forgetting to reverse an inequality under a negative multiplier or subtraction.** Multiplying (or dividing) both sides by a negative number flips the direction; subtracting from a fixed quantity also reverses which side is larger.
- **Confusing a linear deduction with one that involves a product of unknowns.** A deduction built only from addition, subtraction, and multiplication/division by *constants* — even one requiring you to divide by a coefficient, like solving $3w+1=4$ for $w$ — can be closed by `linarith` in a single step; a product or power of unknowns (like $xy$ or $m^2$) is an opaque term to `linarith`, so it succeeds only when you supply the needed fact about that term (such as `sq_nonneg m`); a step that multiplies facts together needs `nlinarith` or an explicit algebraic step instead.

## References

- Macbeth, Heather. *The Mechanics of Proof*, Chapter 1: Proofs by Calculation. <https://hrmacbeth.github.io/math2001/01_Proofs_by_Calculation.html>
- Avigad, Jeremy, Patrick Massot, et al. *Mathematics in Lean*, Chapter 2: Basics (§2.1 Calculating). <https://leanprover-community.github.io/mathematics_in_lean/C02_Basics.html>
