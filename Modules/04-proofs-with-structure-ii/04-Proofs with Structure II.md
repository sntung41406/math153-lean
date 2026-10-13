# Module 4 – Proofs with Structure, II

## Learning goals

By the end of this module, you can:
- Prove a "for all" or "if … then …" statement by introducing an arbitrary element and an assumption, and use such a hypothesis by supplying a value and the fact it asks for.
- Prove an "if and only if" statement by proving both directions, and use a known one in either direction or as a substitution.
- Prove a "there is a unique …" statement by giving a witness and showing every other candidate equals it, and use such a hypothesis to conclude that two candidates are equal.
- Recognise three uses of contradiction: hypotheses that already disagree, proving a negation $\neg P$ by assuming $P$, and proving a positive claim by assuming it is false.

## Motivation

Module 2 introduced "or", "and", and "there exists". This module rounds out the logical vocabulary with "for all", "if … then …", "if and only if", "unique existence", and contradiction-based reasoning. Each of these has two sides: how to **prove** a statement of that shape when it is the goal, and how to **use** one when it is a hypothesis. Real definitions nest several of these shapes inside each other, so the module ends each section with a longer example where the tools work together.

## Definition

### "For all" statements and implications

A statement "for all $x$, $P(x)$" (written $\forall x,\ P(x)$) is proved by introducing an arbitrary, unspecified element and proving $P$ holds for it — since the element was never assumed to be anything special, the proof works for every possible value. Conversely, a "for all" *hypothesis* can be applied to any specific value you choose, giving you $P$ for that value.

**Example (proving a "for all" statement).** Show there is a real number $b$ with $b\le x^2-2x$ for every real $x$.

**Proof.** Take $b=-1$. For an arbitrary real $x$: $-1 \le -1+(x-1)^2 = x^2-2x$.

See this proof formalized in Lean: [Module 4 - Universal statement example](Lean/Module%204%20-%20Universal%20statement%20example.md)

**Example (using a "for all" hypothesis).** Suppose $a\le x^2-2x$ for every real $x$. Show $a\le -1$.

**Proof.** The hypothesis holds in particular at $x=1$: $a \le 1^2-2\cdot1 = -1$.

See this proof formalized in Lean: [Module 4 - Using a universal hypothesis example](Lean/Module%204%20-%20Using%20a%20universal%20hypothesis%20example.md)

An **implication** "if $P$ then $Q$" (written $P\Rightarrow Q$) is proved by assuming $P$ and proving $Q$. Here $P$ is called the *antecedent* and $Q$ the *conclusion*. To use a hypothesis $P\Rightarrow Q$ you must first know $P$; only then does it give you $Q$.

Most "for all" statements in mathematics carry a condition: "for all $x$, **if** $P(x)$ **then** $Q(x)$". To prove one, introduce an arbitrary $x$ *and* assume $P(x)$, then prove $Q(x)$. To use one, you must supply two things: a value $x$, and the fact $P(x)$ for that value.

**Example (using a conditional "for all" hypothesis).** Let $a,b$ be real numbers with $a^2\le 2$ and $b^2\le 2$. Suppose every real $y$ with $y^2\le 2$ satisfies $y\le a$, and every real $y$ with $y^2\le 2$ satisfies $y\le b$. Show $a=b$.

**Proof.** It is enough to show $a\le b$ and $b\le a$. Use the second hypothesis at the value $y=a$: it asks for $a^2\le 2$, which we know, and returns $a\le b$. In the same way, the first hypothesis at $y=b$, together with $b^2\le 2$, returns $b\le a$.

See this proof formalized in Lean: [Module 4 - Conditional universal hypothesis example](Lean/Module%204%20-%20Conditional%20universal%20hypothesis%20example.md)

When "for all" and "there exists" appear together, read the statement from left to right. Each "there exists" asks you to choose a witness. Each "for all" hands you an arbitrary value that you may not choose. **A witness may depend only on the variables that come before it.**

**Example (nested quantifiers).** Show there is a real $a$ such that for every real $b$ there is a real $c$ with $a+b<c$.

**Proof.** Take $a=0$; at this point $b$ is not yet known, so $a$ cannot depend on it. Now let $b$ be an arbitrary real. Take $c=b+1$; this witness is allowed to depend on $b$, because $b$ came first. Then $a+b = b < b+1 = c$.

The order of the quantifiers changes the meaning. "For every real $b$ there is a real $c$ with $b<c$" is true: take $c=b+1$. "There is a real $c$ such that $b<c$ for every real $b$" is false: it would give $c<c$ at $b=c$. In the first statement $c$ may change with $b$; in the second, one $c$ must work for all $b$.

See this proof formalized in Lean: [Module 4 - Nested quantifiers example](Lean/Module%204%20-%20Nested%20quantifiers%20example.md)

**Further reading: "sufficiently large".** The phrase "$P(n)$ holds for all sufficiently large $n$" means: there is a threshold $N$ such that $P(n)$ holds for every $n\ge N$. It has the shape "there exists … for all … if … then …". The threshold is a witness, so it is one fixed number chosen first.

**Example.** Show $n^3\ge 4n^2+7$ for all sufficiently large integers $n$.

**Proof.** Take $N=5$. Let $n\ge 5$ be an integer. Then $n^3 = n\cdot n^2 \ge 5n^2 = 4n^2+n^2 \ge 4n^2+5^2 \ge 4n^2+7$. (The inequality is false at $n=4$, so some threshold is really needed.)

See this proof formalized in Lean: [Module 4 - Sufficiently large example](Lean/Module%204%20-%20Sufficiently%20large%20example.md)

**Further reading: reading a layered definition.** Module 3 defined a prime as an integer $p>1$ whose only positive divisors are $1$ and $p$. Written out for a natural number $p$, this is: $p\ge 2$, **and for all** $m$, **if** $m\mid p$ **then** $m=1$ **or** $m=p$. The definition uses four structures at once, and a proof handles them from the outside in.

**Example.** Show $2$ is prime.

**Proof.** First, $2\ge 2$. Next, let $m$ be an arbitrary natural number and assume $m\mid 2$. A divisor of a positive number is positive and at most that number, so $1\le m\le 2$. Hence $m=1$ or $m=2$.

See this proof formalized in Lean: [Module 4 - Prime example](Lean/Module%204%20-%20Prime%20example.md)

### "If and only if" statements

A statement "$P$ if and only if $Q$" ($P\iff Q$) asserts both directions at once: $P\Rightarrow Q$ and $Q\Rightarrow P$. Proving it means proving both implications separately.

**Example (proving an "iff").** Let $a$ be rational. Show $3a+1\le 7$ if and only if $a\le 2$.

**Proof.** ($\Rightarrow$) If $3a+1\le7$: $a = \big((3a+1)-1\big)/3 \le (7-1)/3 = 2$.
($\Leftarrow$) If $a\le 2$: $3a+1 \le 3\cdot2+1 = 7$.

See this proof formalized in Lean: [Module 4 - Iff example](Lean/Module%204%20-%20Iff%20example.md)

Once an "iff" is proved (or cited), it can be used in two ways. You can take one direction from it: knowing $P\iff Q$ and $P$ gives $Q$, and knowing $P\iff Q$ and $Q$ gives $P$. You can also substitute: anywhere the statement $P$ appears, you may replace it by $Q$, the same way an equation lets you replace one expression by another.

**Example (using an "iff").** We know $3a+1\le 7 \iff a\le 2$. So from $a\le 2$ we may conclude $3a+1\le 7$ (the direction $\Leftarrow$), and a goal "$3a+1\le 7$" may be replaced by the goal "$a\le 2$". Before using an "iff", check which side you have and which side you need.

See this proof formalized in Lean: [Module 4 - Using an iff example](Lean/Module%204%20-%20Using%20an%20iff%20example.md)

**Further reading: an "iff" about divisibility.** In Module 3 we proved that $8\mid 5n$ implies $8\mid n$. Together with the easy converse, this becomes an equivalence.

**Example.** Let $n$ be an integer. Show $8\mid 5n$ if and only if $8\mid n$.

**Proof.** ($\Rightarrow$) If $5n=8a$, then $n = -3(5n)+16n = -3(8a)+16n = 8(-3a+2n)$.
($\Leftarrow$) If $n=8a$, then $5n = 8(5a)$.
The two directions are separate arguments, and here they are not equally hard: ($\Leftarrow$) works for any multiplier, while ($\Rightarrow$) needs $5$ and $8$ to be coprime.

See this proof formalized in Lean: [Module 4 - Divisibility iff example](Lean/Module%204%20-%20Divisibility%20iff%20example.md)

### Unique existence

"There is a unique $x$ with $P(x)$" ($\exists!\, x,\ P(x)$) claims two things at once: some witness satisfies $P$, *and* every candidate satisfying $P$ must actually be that same witness. Proving it therefore has two parts: exhibit a witness and verify $P$ holds for it, then show any other candidate satisfying $P$ equals your witness.

**Example (proving unique existence).** Show there is a unique real number $a$ with $3a+1=7$.

**Proof.** Take $a=2$: indeed $3\cdot2+1=7$. For uniqueness, suppose $y$ also satisfies $3y+1=7$; then $y = \big((3y+1)-1\big)/3 = (7-1)/3 = 2$.

See this proof formalized in Lean: [Module 4 - Exists unique example](Lean/Module%204%20-%20Exists%20unique%20example.md)

A unique-existence *hypothesis* gives you three things: a witness $a$, the fact $P(a)$, and the uniqueness condition "every $y$ with $P(y)$ equals $a$". The uniqueness condition is a conditional "for all" statement, and it is used like one: produce a second candidate, check that it satisfies $P$, and conclude it equals $a$.

**Further reading (using unique existence).** Let $x$ be rational, and suppose there is a unique rational $a$ with $a^2=x$. Show $x=0$.

**Proof.** Let $a$ be the unique rational with $a^2=x$. The number $-a$ is a second candidate: $(-a)^2=a^2=x$. By uniqueness, $-a=a$, so $a=0$ and $x=a^2=0$.

See this proof formalized in Lean: [Module 4 - Using unique existence example](Lean/Module%204%20-%20Using%20unique%20existence%20example.md)

### Contradiction

A **contradiction** is a pair of facts that cannot both be true, such as $7<3$ together with what we know about numbers, or $P$ together with $\neg P$. Contradictions are used in three different ways, and it helps to keep them apart.

**1. The hypotheses already disagree.** If your hypotheses assert two things that cannot both be true, *anything* follows from them — including your current goal, however unrelated.

**Example.** Suppose $t<3$ and $t-1=6$. Show $t=13$.

**Proof.** From $t-1=6$ we get $t=7$; but $t<3$, so $7<3$. This is false, so the hypotheses are contradictory — and from a contradiction, any goal (including $t=13$) follows.

See this proof formalized in Lean: [Module 4 - Contradictory hypotheses example](Lean/Module%204%20-%20Contradictory%20hypotheses%20example.md)

**2. Proving a negation.** To prove "$\neg P$" (not $P$), assume $P$ and derive a contradiction. This is simply what "not $P$" means: $P$ leads to something impossible.

**Example.** Suppose $x+y=0$. Show it is not the case that $x>0$ and $y>0$.

**Proof.** Assume, for contradiction, that both $x>0$ and $y>0$. Then $0 = x+y > 0$, which is impossible.

See this proof formalized in Lean: [Module 4 - Proving a negation example](Lean/Module%204%20-%20Proving%20a%20negation%20example.md)

An important special case is the negation of a "for all" statement. A universal claim says something about every value, so a single value where it fails — a **counterexample** — refutes it.

**Example (refuting a universal statement).** Show it is not true that $x^2\ge x$ for every real $x$.

**Proof.** Assume $x^2\ge x$ for every real $x$. Use this at $x=\tfrac12$: it gives $\tfrac14\ge\tfrac12$, which is false.

See this proof formalized in Lean: [Module 4 - Refuting a universal statement example](Lean/Module%204%20-%20Refuting%20a%20universal%20statement%20example.md)

**3. Proving a positive claim by contradiction.** Sometimes the goal $P$ is not a negation, but no direct proof is visible. Then you may assume $\neg P$ and derive a contradiction; this shows $\neg P$ is impossible, so $P$ holds. This is the method usually called **proof by contradiction**.

**Example (ruling out a case).** Let $x,y$ be real numbers with $0<xy$ and $0\le x$. Show $0<y$.

**Proof.** Assume, for contradiction, that $0<y$ is false, that is, $y\le 0$. Multiplying by $x\ge 0$ gives $xy\le x\cdot 0=0$. This contradicts $0<xy$. So $0<y$.

The same argument can be written as a case split: either $0<y$, and we are done, or $y\le 0$, and that case is impossible. Both versions are on the Lean page.

See this proof formalized in Lean: [Module 4 - Ruling out a case example](Lean/Module%204%20-%20Ruling%20out%20a%20case%20example.md)

Uses 2 and 3 look alike but answer different goals. In use 2 the goal is "$\neg P$" and you assume $P$. In use 3 the goal is "$P$" and you assume $\neg P$. Module 5 explains the logical principle behind use 3.

**Further reading: the coprime core of the $\sqrt2$ argument.** Module 3 stated that $\sqrt2$ is irrational and promised a proof later. The heart of that proof is a contradiction argument we can already carry out. Recall from Module 3 that integers $a,b$ are coprime exactly when $ua+vb=1$ for some integers $u,v$.

**Example.** Show that no coprime integers $a,b$ satisfy $a^2=2b^2$.

**Proof.** We first note a helper fact: *if $a^2$ is even, then $a$ is even.* Indeed, if $a$ were odd, $a=2k+1$, then $a^2=2(2k^2+2k)+1$ would be odd.

Now assume, for contradiction, that $a,b$ are coprime and $a^2=2b^2$. Then $a^2$ is even, so $a$ is even: $a=2c$. Substituting, $4c^2=2b^2$, so $b^2=2c^2$ is even, and $b$ is even: $b=2d$. Since $a,b$ are coprime, $ua+vb=1$ for some integers $u,v$. But then $1 = u(2c)+v(2d) = 2(uc+vd)$ would be even, which is impossible.

This is not yet the full theorem. To conclude that $\sqrt2$ is irrational, one also needs that every fraction can be written with coprime numerator and denominator; that step comes later in the course.

See this proof formalized in Lean: [Module 4 - Coprime core of the √2 argument](Lean/Module%204%20-%20Coprime%20core%20of%20the%20sqrt%202%20argument.md)

## Common pitfalls

- **Reaching for contradiction first.** If a direct calculation already proves the goal, contradiction-based reasoning is unnecessary extra machinery — save it for when there is no direct path.
- **Forgetting the antecedent.** A hypothesis "for all $y$, if $y^2\le 2$ then $y\le a$" does not say $y\le a$ for every $y$. To use it at a value, you must also show that value satisfies $y^2\le 2$.
- **Mixing up quantifier order.** "For every $x$ there exists a $y$" (where $y$ may depend on $x$) is a very different claim from "there exists a $y$ that works for every $x$" — check which one is actually being asked for.
- **Letting a witness depend on a later variable.** In "there exists $a$ such that for all $b$ …", the witness $a$ is chosen before $b$ is known, so $a$ cannot be an expression in $b$.
- **Proving only one direction of an "iff".** Both implications are required; a proof of just $P\Rightarrow Q$ (or just $Q\Rightarrow P$) is an incomplete proof of $P\iff Q$.
- **Using an "iff" in the wrong direction.** $P\iff Q$ contains $P\Rightarrow Q$ and $Q\Rightarrow P$. Check which side you already know before choosing a direction.
- **Forgetting the uniqueness half of $\exists!$.** Exhibiting a witness only proves existence; "unique" additionally requires showing no other candidate could also satisfy the property.
- **Confusing "unique" with "exists".** Uniqueness alone means *at most one*: any two candidates are equal, but there might be none. Unique existence means *exactly one*: at least one, and at most one.
- **Confusing the two contradiction goals.** To prove $\neg P$, assume $P$. To prove a positive claim $P$ by contradiction, assume $\neg P$. Write down clearly which statement you are assuming.

## References

- Macbeth, Heather. *The Mechanics of Proof*, Chapter 4: Proofs with Structure II. <https://hrmacbeth.github.io/math2001/04_Proofs_with_Structure_II.html>
- UBC Math Department. *Prove It: A Structured Approach*, Topics 4, 13, 16, 36, 38. <https://personal.math.ubc.ca/~PLP/>
