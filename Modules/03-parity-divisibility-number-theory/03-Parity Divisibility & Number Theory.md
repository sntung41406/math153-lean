# Module 3 – Parity, Divisibility & Number Theory

## Learning goals

By the end of this lecture, you can:
- State the definitions of even, odd, divisibility, and congruence modulo $n$ as existence statements, and prove or disprove instances of them using an explicit witness.
- Settle a claim about every integer by splitting into parity cases or into cases on the residue mod $n$, and substitute a congruence into a polynomial expression.
- Explain, using witnesses, why adding two congruences gives a congruence.
- State Bézout's identity and use it to cancel a coprime factor from a divisibility statement.

## Motivation

Parity, divisibility, and congruence are properties you've used informally since grade school, but each hides a precise existence statement once you try to prove something about it rigorously. This module is lighter on new proof *machinery* than Module 2 — think of it as a chance to consolidate `have`, case splits, and witnesses on a very concrete class of problems before Module 4 builds further structure on top.

## Definition

### Parity

An integer $a$ is **even** if there is an integer $k$ with $a=2k$, and **odd** if there is an integer $k$ with $a=2k+1$. The number $k$ is called a **witness**. Every integer is either even or odd, never both.

**Example.** Show that $-3$ is odd and $26$ is even.

**Proof.** To find a witness, write down the equation from the definition and solve it for $k$. For $-3=2k+1$ we need $2k=-4$, so $k=-2$: indeed $-3=2\cdot(-2)+1$. For $26=2k$ we need $k=13$: indeed $26=2\cdot 13$. A witness can be negative — the definition only asks for *some* integer $k$.

See this proof formalized in Lean: [Module 3 - Numeric witnesses](Lean/Module%203%20-%20Numeric%20witnesses.md#Parity)

When the number is a variable, the witness is found the same way, but it is an expression instead of a number.

**Example.** Let $n$ be odd. Show $3n+2$ is odd.

**Proof.** Since $n$ is odd, $n=2k+1$ for some integer $k$. To find the witness, expand and pull out a factor of $2$: $3n+2 = 3(2k+1)+2 = 6k+5 = 2(3k+2)+1$. So the witness is $3k+2$, and $3n+2$ is odd.

See this proof formalized in Lean: [Module 3 - Parity example](Lean/Module%203%20-%20Parity%20example.md)

Because every integer is even or odd, you can settle a claim about *all* integers by checking it separately in each of the two cases.

**Example.** Show that $n^2+n+4$ is even for every integer $n$.

**Proof.** If $n=2x$ is even: $n^2+n+4 = (2x)^2+2x+4 = 2(2x^2+x+2)$. If $n=2x+1$ is odd: $n^2+n+4=(2x+1)^2+(2x+1)+4=2(2x^2+3x+3)$. Either way, the result is even.

See this proof formalized in Lean: [Module 3 - Parity case split example](Lean/Module%203%20-%20Parity%20case%20split%20example.md)

### Divisibility

For integers $a,b$, "$a$ divides $b$" (written $a\mid b$) means there is an integer $k$ with $b=ak$. The witness $k$ is the same kind of number as $a$ and $b$: when we work with natural numbers ($0,1,2,\dots$), $k$ must be a natural number too; when we work with integers, $k$ may be negative.

**Example.** Show $11\mid 88$, $-2\mid 6$, and $a\mid 0$ for every integer $a$.

**Proof.** The witnesses are $88=11\cdot 8$, then $6=(-2)\cdot(-3)$, then $0=a\cdot 0$. The first statement makes sense for natural numbers. The second only makes sense for integers, since $-2$ and the witness $-3$ are not natural numbers. The third shows that every number divides $0$, with witness $0$.

See this proof formalized in Lean: [Module 3 - Numeric witnesses](Lean/Module%203%20-%20Numeric%20witnesses.md#Divisibility)

To show that $a$ does *not* divide $b$, we cannot give a single witness. Instead, assume a witness exists and show that this leads to something impossible.

**Example.** Show that $5\nmid 12$.

**Proof.** Suppose $12=5k$ for some integer $k$. The number $12$ lies strictly between two consecutive multiples of $5$: $5\cdot 2=10<12<15=5\cdot 3$. So $5\cdot 2<5k<5\cdot 3$, which gives $2<k<3$. No integer lies strictly between $2$ and $3$, so no such $k$ exists.

See this proof formalized in Lean: [Module 3 - Non-divisibility example](Lean/Module%203%20-%20Non-divisibility%20example.md)

With variables, a witness for the hypothesis helps to build a witness for the goal.

**Example.** Suppose $a\mid b$. Show $a\mid b^2+2b$.

**Proof.** Since $a\mid b$, $b=ak$ for some integer $k$. Then $b^2+2b = (ak)^2+2(ak) = a\big(k(ak+2)\big)$, so $a\mid b^2+2b$.

See this proof formalized in Lean: [Module 3 - Divisibility example](Lean/Module%203%20-%20Divisibility%20example.md)

**Additional reading.** For natural numbers, a divisor of a positive number can never exceed it.

**Example.** Let $a,b$ be natural numbers with $b>0$ and $a\mid b$. Show $a\le b$.

**Proof.** Since $a\mid b$, $b=ak$ for some $k$; since $b>0$, also $k\ge 1$. Then $a = a\cdot 1 \le a\cdot k = b$.

See this proof formalized in Lean: [Module 3 - Divisibility bound example](Lean/Module%203%20-%20Divisibility%20bound%20example.md)

### Modular congruence

Fix a positive integer $n$. Two integers $a,b$ are **congruent modulo&#x20;**$n$ (written $a\equiv b \pmod n$) if $n$ divides their difference, i.e. $a-b=nk$ for some integer $k$.

**Example.** Show $11\equiv 3\pmod 4$.

**Proof.** The difference is $11-3=8=4\cdot 2$, so the witness is $2$.

It does not matter which way round you subtract. Since $3-11=-8=4\cdot(-2)$, the other order works too, with witness $-2$. In general $n\mid x$ exactly when $n\mid -x$, so reversing the difference only changes the sign of the witness.

See this proof formalized in Lean: [Module 3 - Congruence from divisibility](Lean/Module%203%20-%20Congruence%20from%20divisibility.md)

Congruence behaves like equality under addition. Suppose $a\equiv b$ and $c\equiv d\pmod n$, so $a-b=nx$ and $c-d=ny$ for some integers $x,y$. Then
$$(a+c)-(b+d) = (a-b)+(c-d) = nx+ny = n(x+y),$$
so $a+c\equiv b+d\pmod n$, with witness $x+y$. A similar calculation, $ac-bd=(a-b)c+b(c-d)=n(xc+by)$, shows $ac\equiv bd\pmod n$. The same holds for subtraction and powers. So a congruence can be substituted into an expression built from $+$, $-$, $\times$ and powers, just like an equation.

**Additional reading.** The addition proof above, formalized in Lean: [Module 3 - Congruence addition example](Lean/Module%203%20-%20Congruence%20addition%20example.md)

**Example.** Suppose $a\equiv 4$ and $b\equiv 3\pmod 5$. Show $ab+b^3+3\equiv 2\pmod 5$.

**Proof.** $ab+b^3+3 \equiv 4b+b^3+3 \equiv 4\cdot 3+3^3+3 = 42 = 2+5\cdot 8 \equiv 2 \pmod 5$.

See this proof formalized in Lean: [Module 3 - Congruence substitution example](Lean/Module%203%20-%20Congruence%20substitution%20example.md)

Since $n>0$, every integer is congruent mod $n$ to exactly one of $0,1,\dots,n-1$ — its remainder when divided by $n$. This gives another way to settle a claim about every integer: check it for each possible remainder.

**Example.** Show $x^3\equiv x\pmod 3$ for every integer $x$.

**Proof.** If $x\equiv r\pmod 3$, then $x^3\equiv r^3\pmod 3$, so it is enough to check one representative $r$ for each residue:

| Representative $r$ | $r^3$ | Remainder of $r^3$ | Same as $r$? |
| :---: | :---: | :---: | :---: |
| $0$ | $0$ | $0$ | yes |
| $1$ | $1$ | $1$ | yes |
| $2$ | $8$ | $2$ | yes |

The table is about congruence, not equality: for $x=5$ the representative is $r=2$, and $x^3=125$ is not $8$, but $125\equiv 8\equiv 2\equiv 5\pmod 3$.

In words: if $x\equiv 0$, $x^3\equiv 0^3=0\equiv x$; if $x\equiv 1$, $x^3\equiv 1^3=1\equiv x$; if $x\equiv 2$, $x^3\equiv 2^3=8=2+3\cdot2\equiv 2\equiv x$.

See this proof formalized in Lean: [Module 3 - Residue case split example](Lean/Module%203%20-%20Residue%20case%20split%20example.md)

### Coprimality and Bézout's identity

The **greatest common divisor** $\gcd(a,b)$ of two integers, not both zero, is the largest positive integer that divides both of them. For example, $\gcd(8,12)=4$ and $\gcd(8,5)=1$. Two integers are **coprime** if their greatest common divisor is $1$ — their only common positive divisor is $1$.

**Bézout's identity** states that for integers $a,b$, not both zero, there are integers $x,y$ with $ax+by=\gcd(a,b)$. When $a$ and $b$ are coprime, this means $ax+by=1$.

To find $x$ and $y$ for small numbers, list multiples of one number and look for one that is $1$ away from a multiple of the other. For $8$ and $5$: the multiples of $5$ are $5, 10, 15, \dots$, and $15=16-1$. So $8\cdot 2+5\cdot(-3)=1$.

This gives a cancellation rule: **if $a$ and $b$ are coprime and $a\mid bc$, then $a\mid c$.** To see why, multiply $ax+by=1$ by $c$: $c = a(cx)+y(bc)$. Both terms on the right are multiples of $a$, so $a\mid c$.

**Example.** Suppose $8\mid 5n$. Show $8\mid n$.

**Proof.** Write $5n=8a$. Multiply $8\cdot 2+5\cdot(-3)=1$ by $n$: $n = 16n-3(5n) = 16n-3(8a) = 8(2n-3a)$. So $8\mid n$, with witness $2n-3a$.

See this proof formalized in Lean: [Module 3 - Coprime cancellation example](Lean/Module%203%20-%20Coprime%20cancellation%20example.md)

**Additional reading.** The same idea combines two coprime divisors into one.

**Example.** Suppose $8\mid m$ and $5\mid m$. Show $40\mid m$.

**Proof.** Write $m=8a$ and $m=5b$. Multiply $8\cdot 2+5\cdot(-3)=1$ by $m$: $m = 16m-15m$. Use $m=5b$ in the first term and $m=8a$ in the second: $m = 16\cdot 5b-15\cdot 8a = 40\cdot 2b-40\cdot 3a = 40(2b-3a)$. So $40\mid m$.

See this proof formalized in Lean: [Module 3 - Combining coprime divisors example](Lean/Module%203%20-%20Combining%20coprime%20divisors%20example.md)

### Looking ahead

A **prime** is an integer $p>1$ whose only positive divisors are $1$ and $p$. The ideas of this module lead to three famous number-theory results, which we state now and prove later. **Euclid's lemma** says that if a prime $p$ divides $ab$, then $p\mid a$ or $p\mid b$; its proof is the coprime cancellation rule above, once Bézout's identity is known for all integers. **There are infinitely many primes**; the usual proof needs the fact that every integer $n\ge 2$ has a prime factor, which is proved by strong induction (Module 6). **$\sqrt2$ is irrational**; the usual proof is by *descent* — from $a^2=2b^2$ with $b\ne 0$ you can build a smaller pair with the same property, which cannot go on forever — and making it precise also uses induction (Module 6).

## Common pitfalls

- **Mixing up the direction of division.** "$a\mid b$" means $a$ divides $b$ (i.e. $b=ak$), not the other way around.
- **Looking only for positive witnesses.** $-3$ is odd with witness $-2$, and $-2\mid 6$ with witness $-3$. Solve the defining equation for $k$ instead of guessing.
- **Using the wrong witness shape in Lean.** Mathlib's `Even n` means $n=r+r$, not $n=2r$, while `Odd n` means $n=2k+1$. The witness is the same number, but the equation Lean asks you to check looks different.
- **Getting the sign of a congruence witness wrong.** On paper we use $n\mid a-b$; Mathlib's `Int.modEq_iff_dvd` uses $n\mid b-a$. For $11\equiv 3\pmod 4$, the paper witness is $2$ but the Lean witness is $-2$.
- **Forgetting the positivity condition on the divisibility bound.** "$a\mid b\Rightarrow a\le b$" only holds when $b>0$; if $b\le 0$, a divisor can certainly be larger.
- **Assuming the coprime cancellation trick always applies.** Cancelling a factor out of $a\mid bc$ down to $a\mid c$ is only valid when $a$ and $b$ are coprime — it fails in general: $4\mid 2\cdot 6$, but $4\nmid 6$.
- **Treating congruence as if it were equality everywhere.** "$x\equiv y\pmod n$" supports substitution into $+,-,\times,\wedge$ just like an equation, but not into division or into an inequality.

## References

- Macbeth, Heather. *The Mechanics of Proof*, Chapter 3 (Parity & Divisibility) and Chapter 7 (Number Theory). <https://hrmacbeth.github.io/math2001/03_Parity_and_Divisibility.html>
- Avigad, Jeremy, Patrick Massot, et al. *Mathematics in Lean*, Chapter 5: Elementary Number Theory. <https://leanprover-community.github.io/mathematics_in_lean/C05_Elementary_Number_Theory.html>
- UBC Math Department. *Prove It: A Structured Approach*, Topic 30 (Integers modulo $n$). <https://personal.math.ubc.ca/~PLP/>
