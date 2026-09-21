# Module 2 – Proofs with Structure

## Learning goals

By the end of this lecture, you can:
- Break a proof into intermediate facts, each proved once and then reused later, instead of one long calculation.
- Invoke a previously-proved fact (a lemma) to reduce a goal to something simpler, and cancel a common factor or a shared exponent once you have proved the side condition that makes cancelling valid.
- Prove or use "or" statements by considering cases, and "and" statements by handling each part separately.
- Prove or use "there exists" statements by producing, or extracting, an explicit witness.

## Motivation

The calculations of Module 1 were single, self-contained chains. Real proofs are rarely that flat: you often need to nail down a fact partway through and reuse it later, lean on something already known to be true, or handle a statement built from "or", "and", or "there exists". This module introduces the vocabulary for that kind of multi-step, structured reasoning.

## Definition

A **structured proof** breaks a complex statement down into a sequence of smaller, named deductions, instead of one long calculation.

**Writing a proof for a reader.** A proof is written for someone else to read; it is not a record of how you found it. Start from what you are given, name each definition or known fact at the moment you use it, and move forward to the goal. Skip a step only when it is routine for your reader (such as simple arithmetic), never when it needs an idea.

### Intermediate steps

An intermediate step establishes a fact partway through a proof, under its own name, so it can be reused later — mirroring the everyday phrase "since ..., we have ...; therefore ...".

**Example.** Let $a,b$ be real numbers with $a-5b=4$ and $b+2=3$. Show $a=9$.

**Proof.** Since $b+2=3$, we have $b=1$. Therefore
$$a=(a-5b)+5b=4+5\cdot 1=9.$$
The fact $b=1$ is established first, given a name, and then substituted into the main calculation.

See this proof formalized in Lean: [Module 2 - Intermediate step example](Lean/Module%202%20-%20Intermediate%20step%20example.md)

### Invoking a known lemma

A **lemma** is a fact already proved, by you or someone else, that you're allowed to cite rather than re-derive. Invoking a lemma is a piece of *backward reasoning*: if a lemma's conclusion matches your goal, your goal reduces to proving the lemma's hypotheses instead.

**Example.** Let $x$ be rational with $3x=2$. Show $x\ne 1$.

**Proof.** A strictly smaller number cannot be equal to a larger one, so it suffices to show $x<1$. Indeed, $x = (3x)/3 = 2/3 < 1$.

See this proof formalized in Lean: [Module 2 - Lemma application example](Lean/Module%202%20-%20Lemma%20application%20example.md)

A lemma's hypotheses can themselves be more than one goal at once. The **antisymmetry** fact — if $a\le b$ and $b\le a$ then $a=b$ — turns one equality goal into two inequality goals to prove side by side.

**Example.** Let $a,b$ be real with $a^2+b^2=0$. Show $a^2=0$.

**Proof.** By antisymmetry, it suffices to show both $a^2\le 0$ and $0\le a^2$. The second holds because squares are nonnegative. For the first, $b^2\ge 0$, so $a^2\le a^2+b^2=0$.

See this proof formalized in Lean: [Module 2 - Antisymmetry example](Lean/Module%202%20-%20Antisymmetry%20example.md)

### Cancelling a common factor

Cancelling is itself an application of a lemma, and that lemma has a **side condition** you must prove first:

- **Products.** If $a\cdot c=b\cdot c$ and $c\ne 0$, then $a=b$. Without $c\ne0$ this fails: $5\cdot 0=7\cdot 0$, but $5\ne 7$.
- **Powers with the same exponent.** If $a^n\le b^n$ (for some $n\ge 1$) and $b\ge 0$, then $a\le b$. Without the sign condition this fails: $1^2\le(-2)^2$, but $1\not\le -2$.

**Example.** Let $t$ be real with $t^2=3t$ and $t\ge 1$. Show $t\ge 2$.

**Proof.** First, $t\cdot t=t^2=3\cdot t$. Since $t\ge 1>0$, we have $t\ne 0$, so we may cancel the factor $t$ from both sides, giving $t=3$. Hence $t\ge 2$.

See this proof formalized in Lean: [Module 2 - Cancellation example](Lean/Module%202%20-%20Cancellation%20example.md)

The next example combines both ideas so far: an intermediate step whose own proof is a calculation, followed by a cancellation.

**Example.** Let $a,b$ be real with $a^2=b^2+1$ and $a\ge 0$. Show $a\ge 1$.

**Proof.** First we show $a^2\ge 1^2$:
$$a^2=b^2+1\ge 1=1^2,$$
using $b^2\ge 0$. Since $a\ge 0$, we may cancel the shared exponent $2$ from $1^2\le a^2$, giving $1\le a$.

See this proof formalized in Lean: [Module 2 - Same-exponent cancellation example](Lean/Module%202%20-%20Same-exponent%20cancellation%20example.md)

### "Or" statements and proof by cases

A statement "$P$ or $Q$" ($P\lor Q$) holds when at least one alternative holds (possibly both). To **use** an "or" hypothesis, consider the two alternatives one at a time — a *proof by cases*. To **prove** an "or" goal, pick whichever alternative you can establish, and prove just that one.

**Example (using an "or" hypothesis).** Let $x,y$ be real with $x=1$ or $y=-1$. Show $xy+x=y+1$.

**Proof.** If $x=1$: $xy+x = 1\cdot y+1 = y+1$. If $y=-1$: $xy+x = x\cdot(-1)+x = 0 = -1+1 = y+1$. Either way, the goal holds.

See this proof formalized in Lean: [Module 2 - Or hypothesis case split](Lean/Module%202%20-%20Or%20hypothesis%20case%20split.md)

Most of the time, no hypothesis arrives pre-packaged as an "or" statement — you manufacture one yourself as an intermediate step, then case-split on it.

**Example.** Let $n$ be a natural number. Show $n^2\ne 2$.

**Proof.** Every natural number satisfies $n\le 1$ or $2\le n$ (an "or" fact about the natural numbers themselves). In the first case, $n^2\le 1^2<2$. In the second, $2<2^2\le n^2$. Either way, $n^2\ne 2$.

See this proof formalized in Lean: [Module 2 - Manufactured or-statement example](Lean/Module%202%20-%20Manufactured%20or-statement%20example.md)

**Example (proving an "or" goal).** Let $x$ be real with $2x+1=5$. Show $x=1$ or $x=2$.

**Proof.** We show the second alternative: $x = \big((2x+1)-1\big)/2 = (5-1)/2 = 2$.

See this proof formalized in Lean: [Module 2 - Or goal example](Lean/Module%202%20-%20Or%20goal%20example.md)

Often you must both use and prove an "or" statement in the same proof: split into cases, then choose a different alternative of the goal in each case.

**Example (using and proving "or" together).** Let $x$ be real with $x^2-3x+2=0$. Show $x=1$ or $x=2$.

**Proof.** First, $(x-1)(x-2)=x^2-3x+2=0$. A product of two numbers is zero only when one of the factors is zero, so $x-1=0$ or $x-2=0$. In the first case $x=1$, so the first alternative of the goal holds. In the second case $x=2$, so the second alternative holds.

See this proof formalized in Lean: [Module 2 - Factored or-goal example](Lean/Module%202%20-%20Factored%20or-goal%20example.md)

### "And" statements

A statement "$P$ and $Q$" ($P\land Q$) requires both parts to hold. To **use** an "and" hypothesis, split it into its two parts and use each as needed. To **prove** an "and" goal, prove each part separately.

**Example (using an "and" hypothesis).** Let $x,y$ be integers with $2x-y=4$ and $y-x+1=2$. Show $x=5$.

**Proof.** Splitting the hypothesis into its two facts, $x = (2x-y)+(y-x+1)-1 = 4+2-1 = 5$.

See this proof formalized in Lean: [Module 2 - And hypothesis split](Lean/Module%202%20-%20And%20hypothesis%20split.md)

**Example (proving an "and" goal).** Let $a,b$ be real with $a-5b=4$ and $b+2=3$. Show $a=9$ and $b=1$.

**Proof.** Each part is proved on its own: $b=1$ follows directly from $b+2=3$; then $a = (a-5b)+5b = 4+5\cdot 1 = 9$.

See this proof formalized in Lean: [Module 2 - And goal example](Lean/Module%202%20-%20And%20goal%20example.md)

### "There exists" statements

A statement "there exists $x$ such that $P(x)$" ($\exists x, P(x)$) is proved by producing one specific **witness** and checking $P$ holds for it. When such a statement appears as a hypothesis, you may extract a witness and its property from it, without knowing exactly which value it is.

**Example (proving an existence goal).** Let $x$ be real. Show there exists a real number $y$ with $y>x$.

**Proof.** Take the witness $y=x+1$. Then $y=x+1>x$.

The witness depends on $x$: there is no single number that works for every $x$. Finding a witness can take an idea; once you have one, checking it is usually routine.

See this proof formalized in Lean: [Module 2 - Existential goal example](Lean/Module%202%20-%20Existential%20goal%20example.md)

**Example (using an existential hypothesis).** Let $a$ be rational, and suppose there exists a rational $b$ with $a=b^2+1$. Show $a>0$.

**Proof.** Extract the witness $b$ and the fact $a=b^2+1$. Since $b^2\ge 0$, we get $a = b^2+1 > 0$.

See this proof formalized in Lean: [Module 2 - Existential hypothesis example](Lean/Module%202%20-%20Existential%20hypothesis%20example.md)

## Common pitfalls

- **A proof is not scratch work.** Scratch work often starts from the goal and works backward — for example, "suppose $a\ge 1$; then $a^2\ge 1$, which is true." That shows only that the goal *implies* something true, not that the goal *is* true. In the written proof, start from the hypotheses and move toward the goal, so each step follows from the ones before it. Backward reasoning is fine when you state it as such ("it suffices to show ..."), because each reduction then goes in the correct direction.
- **Proving an intermediate fact you never use.** An intermediate step only helps if it's actually substituted into the reasoning that follows — double-check every named fact gets used.
- **Cancelling without proving the required side condition.** A factor can only be cancelled from an equation once you know it's nonzero; a shared exponent can only be cancelled from an inequality once you know the relevant sign. Skipping this check silently produces an invalid deduction.
- **Picking the wrong side of an "or" goal.** If you assert the wrong alternative (the one that's actually false), the rest of the proof cannot go through — check which alternative is actually provable before committing to it.
- **Treating "or" and "and" as though they have the same proof shape.** An "or" hypothesis needs a case split (multiple subgoals with the *same* goal but different assumptions); an "and" hypothesis just hands you two facts at once, and an "and" goal needs each part proved separately.

## References

- Macbeth, Heather. *The Mechanics of Proof*, Chapter 2: Proofs with Structure. <https://hrmacbeth.github.io/math2001/02_Proofs_with_Structure.html>
- Avigad, Jeremy, Patrick Massot, et al. *Mathematics in Lean*, Chapter 2: Basics (§2.2-2.4: have/apply/exact). <https://leanprover-community.github.io/mathematics_in_lean/C02_Basics.html>
- UBC Math Department. *Prove It: A Structured Approach*, Topics 8 & 9. <https://personal.math.ubc.ca/~PLP/>
