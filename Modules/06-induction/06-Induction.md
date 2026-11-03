# Module 6 – Induction

## Learning goals

By the end of this lecture, you can:
- State the induction principle, explain informally why it is valid, and set up a proof by writing down $P(n)$, the hypothesis $P(k)$, and the target $P(k+1)$.
- Prove a property of a recursively defined sequence by induction, and start an induction at a point other than $0$, including for claims about all sufficiently large $n$.
- Choose an induction hypothesis: use ordinary, two-step, or strong induction according to what the step needs, and strengthen a hypothesis that is too weak.
- Use descent, as strong induction on a decreasing natural number, to prove that $\sqrt2$ is irrational.

## Motivation

You can't check a claim about *every* natural number one at a time — there are infinitely many. Induction sidesteps this: prove the claim for the smallest case, then show that whenever it holds for one number it holds for the next, and it automatically holds for all of them.

## Definition

### The induction principle

To prove $\forall n \in \mathbb{N}, P(n)$ by **induction**, it suffices to show two things:

- **Base case**: $P(0)$ is true.
- **Inductive step**: for every $k$, $P(k) \to P(k+1)$ (assuming $P(k)$, called the *inductive hypothesis*, prove $P(k+1)$).

Think of it as a ladder: the base case gets you onto the bottom rung, and the inductive step says that from any rung you can always reach the next one — so you can climb as high as you like.

In this course $\mathbb{N}$ starts at $0$, as it does in Lean. Some books, including *Prove It*, start $\mathbb{N}$ at $1$ and so use the base case $P(1)$. The principle is the same; only the first rung changes.

Before starting a proof, write down three things:

1. the statement $P(n)$, with $n$ as its only free variable;
2. the hypothesis $P(k)$, which you may use in the step;
3. the target $P(k+1)$, which you must prove.

To get the target, replace every $n$ in $P(n)$ by $k+1$. Then look for a way to find $P(k)$ inside $P(k+1)$.

**Example.** Show $2^n \ge n+1$ for every natural number $n$.

**Proof.** Let $P(n)$ be the statement $2^n\ge n+1$. Base case ($n=0$): $2^0 = 1 \ge 0+1$. Inductive step: assume $2^k \ge k+1$. The target is $2^{k+1}\ge (k+1)+1$. We have $2^{k+1} = 2\cdot 2^k \ge 2(k+1) = (k+2)+k \ge k+2$, so the claim holds at $k+1$.

See this proof formalized in Lean: [Module 6 - Simple induction example](Lean/Module%206%20-%20Simple%20induction%20example.md)

**Why does this work?** Suppose the base case and inductive step both hold, but the claim is false for *some* natural number. Among all the numbers where it fails, there is a smallest one, $q$ — this uses the fact that every nonempty set of natural numbers has a least element. The base case says $q\ne0$. Since $q$ is smallest, $P(q-1)$ must be true. But then the inductive step gives $P(q-1) \to P(q)$, so $P(q)$ is true after all — contradiction. So no such $q$ exists, and $P(n)$ holds for every $n$.

The statement $P(n)$ can have any logical shape. When it is an "or", the inductive hypothesis is used by splitting into cases, exactly as in Module 5.

**Example.** Show that for every natural number $n$, $4^n\equiv1\pmod{15}$ or $4^n\equiv4\pmod{15}$.

**Proof.** Base case: $4^0=1\equiv1\pmod{15}$. Inductive step: assume $4^k\equiv1$ or $4^k\equiv4\pmod{15}$. There are two cases.

- If $4^k\equiv1\pmod{15}$, then $4^{k+1}=4\cdot4^k\equiv4\cdot1=4\pmod{15}$.
- If $4^k\equiv4\pmod{15}$, then $4^{k+1}=4\cdot4^k\equiv4\cdot4=16\equiv1\pmod{15}$.

In both cases $P(k+1)$ holds, although a different side of the "or" holds in each case.

See this proof formalized in Lean: [Module 6 - Induction with a disjunction example](Lean/Module%206%20-%20Induction%20with%20a%20disjunction%20example.md)

### Induction over recursively-defined sequences

A sequence defined **recursively** gives its first term(s) directly and each later term in terms of earlier ones. Proving a closed-form property of such a sequence is a natural fit for induction: the base case matches the sequence's own base value, and the inductive step matches its own recursive rule.

Three different activities are involved, and it helps to keep them apart:

- **Computing terms** applies the recursive rule. It proves nothing about later terms.
- **Conjecturing a formula** is a guess based on the terms you computed. It is not yet a proof.
- **Proving the formula** is the induction.

**Example.** Define $x_0=5$ and $x_{n+1}=2x_n-1$. The first terms are $5,9,17,33$. Each is one more than a power of $2$, which suggests the formula $x_n=2^{n+2}+1$. Show that this formula holds for every $n$.

**Proof.** Base case: $x_0=5=2^{0+2}+1$. Inductive step: assume $x_k=2^{k+2}+1$. Then $x_{k+1}=2x_k-1=2(2^{k+2}+1)-1=2^{k+3}+1$, which is the formula at $k+1$.

See this proof formalized in Lean: [Module 6 - Recurrence closed form example](Lean/Module%206%20-%20Recurrence%20closed%20form%20example.md)

**Example.** Define $A_0 = 0$ and $A_{n+1} = A_n + (n+1)$ (the sum $0+1+\cdots+n$). Show $A_n = \dfrac{n(n+1)}{2}$ for every $n$.

**Proof.** Base case: $A_0 = 0 = \tfrac{0\cdot 1}{2}$. Inductive step: assume $A_k = \tfrac{k(k+1)}{2}$. Then $A_{k+1} = A_k + (k+1) = \tfrac{k(k+1)}{2}+(k+1) = \tfrac{(k+1)(k+2)}{2}$.

See this proof formalized in Lean: [Module 6 - Recursive sequence example](Lean/Module%206%20-%20Recursive%20sequence%20example.md)

### Starting the induction elsewhere

The base case doesn't have to be $n=0$. If a claim $P(n)$ only makes sense (or only holds) from some starting point $\ell$ onward, induction still works: prove $P(\ell)$, then $P(k) \to P(k+1)$ for every $k \ge \ell$, and $P(n)$ follows for every $n \ge \ell$.

**Example.** Show $3^n \ge 2^n + 5$ for every $n \ge 2$.

**Proof.** Base case ($n=2$): $3^2 = 9 = 2^2+5$. Inductive step: assume $3^k \ge 2^k+5$ for some $k \ge 2$. Then $3^{k+1} = 3\cdot 3^k \ge 3(2^k+5) = 3\cdot 2^k + 15 \ge 2\cdot 2^k + 5 = 2^{k+1}+5$, using $2^k \ge 0$ for the last step.

See this proof formalized in Lean: [Module 6 - Induction from a starting point example](Lean/Module%206%20-%20Induction%20from%20a%20starting%20point%20example.md)

Recall from Module 4 that "$P(n)$ holds for all sufficiently large $n$" means $\exists N,\forall n\ge N,P(n)$. Induction from a starting point is a natural way to prove such a claim: choose the threshold $N$, then use $N$ as the base case.

The choice of threshold matters. Compare the two sides of $2^n\ge n^2$:

| $n$ | 0 | 1 | 2 | 3 | 4 | 5 |
|---|---|---|---|---|---|---|
| $2^n$ | 1 | 2 | 4 | 8 | 16 | 32 |
| $n^2$ | 0 | 1 | 4 | 9 | 16 | 25 |

The claim is true for $n=0,1,2$, false for $n=3$, and appears to be true from $n=4$ on. So we cannot start at $0$: the step from $2$ to $3$ must fail. We choose $N=4$.

**Example.** Show $2^n\ge n^2$ for all sufficiently large natural numbers $n$.

**Proof.** Take $N=4$. Base case ($n=4$): $2^4=16=4^2$. Inductive step: assume $2^k\ge k^2$ for some $k\ge4$. Then
$$2^{k+1}=2\cdot2^k\ge 2k^2=k^2+k\cdot k\ge k^2+4k\ge k^2+2k+1=(k+1)^2.$$

See this proof formalized in Lean: [Module 6 - Sufficiently large induction example](Lean/Module%206%20-%20Sufficiently%20large%20induction%20example.md)

### Two-step induction

Some recursive sequences — like the Fibonacci-style sequence below — define each term from the *two* preceding terms, not just one. Proving a property of such a sequence needs **two-step induction**: two base cases ($P(0)$ and $P(1)$), and an inductive step that assumes $P(k)$ *and* $P(k+1)$ to prove $P(k+2)$.

Two starting values are needed because of what the step can reach. The first use of the step is at $k=0$, and it gives $P(2)$. So no use of the step ever gives $P(0)$ or $P(1)$. Both must be proved directly.

**Example.** Define $F_0 = 1$, $F_1 = 1$, $F_{n+2} = F_{n+1}+F_n$ (the Fibonacci sequence). Show $F_n \le 2^n$ for every $n$.

**Proof.** Base cases: $F_0 = 1 \le 2^0$ and $F_1 = 1 \le 2^1$. Inductive step: assume $F_k \le 2^k$ and $F_{k+1} \le 2^{k+1}$. Then $F_{k+2} = F_{k+1}+F_k \le 2^{k+1}+2^k \le 2^{k+1}+2^{k+1} = 2^{k+2}$.

See this proof formalized in Lean: [Module 6 - Two-step induction example](Lean/Module%206%20-%20Two-step%20induction%20example.md)

**Example.** Define $a_0=2$, $a_1=1$, $a_{n+2}=a_{n+1}+2a_n$. Show $a_n=2^n+(-1)^n$ for every $n$.

**Proof.** Base cases: $a_0=2=2^0+(-1)^0$ and $a_1=1=2^1+(-1)^1$. Inductive step: assume the formula at $k$ and at $k+1$. Then
$$a_{k+2}=a_{k+1}+2a_k=2^{k+1}+(-1)^{k+1}+2\cdot2^k+2(-1)^k=2^{k+2}+(-1)^k\bigl(2-1\bigr)=2^{k+2}+(-1)^{k+2}.$$

Two-step induction is not a new logical principle. It follows from ordinary induction applied to a claim about a pair of neighbouring numbers. Let $Q(n)$ be the statement "$P(n)$ and $P(n+1)$".

- The base case $Q(0)$ is exactly the two base cases $P(0)$ and $P(1)$.
- For the step, assume $Q(k)$. It gives $P(k)$ and $P(k+1)$, so the two-step argument gives $P(k+2)$. Together with $P(k+1)$, this is $Q(k+1)$.

So $Q(n)$ holds for every $n$ by ordinary induction, and in particular $P(n)$ holds for every $n$.

See both forms of this proof formalized in Lean: [Module 6 - Two-step recurrence closed form example](Lean/Module%206%20-%20Two-step%20recurrence%20closed%20form%20example.md)

### Strengthening the induction hypothesis

Sometimes the step fails even though the claim is true. The hypothesis does not give enough information. It can help to prove a **stronger** claim: you must then prove more, but you may also assume more.

**Example.** For the same sequence $a_n$, show that $a_n\equiv1$ or $a_n\equiv5\pmod6$ for every $n\ge1$.

The bound $n\ge1$ is necessary: $a_0=2$ is neither $1$ nor $5$ modulo $6$. The first terms from $a_1$ on are $1,5,7,17,31$, with residues $1,5,1,5,1$.

Induction directly on this claim does not work, even with two-step induction. The two hypotheses would allow $a_k\equiv1$ and $a_{k+1}\equiv1$, and then $a_{k+2}\equiv1+2\cdot1=3\pmod6$, which is not allowed. This pair of residues never occurs, but the hypothesis does not say so. We need a claim that rules it out, by recording which residues occur *next to each other*.

**Proof.** For $n\ge1$, let $Q(n)$ be the statement
$$\bigl(a_n\equiv1\text{ and }a_{n+1}\equiv5\bigr)\quad\text{or}\quad\bigl(a_n\equiv5\text{ and }a_{n+1}\equiv1\bigr)\pmod6.$$
We prove $Q(n)$ by ordinary induction starting at $1$. Base case: $a_1=1$ and $a_2=5$. Inductive step: assume $Q(k)$ for some $k\ge1$.

- If $a_k\equiv1$ and $a_{k+1}\equiv5$, then $a_{k+2}=a_{k+1}+2a_k\equiv5+2=7\equiv1\pmod6$. So $a_{k+1}\equiv5$ and $a_{k+2}\equiv1$.
- If $a_k\equiv5$ and $a_{k+1}\equiv1$, then $a_{k+2}\equiv1+10=11\equiv5\pmod6$. So $a_{k+1}\equiv1$ and $a_{k+2}\equiv5$.

In both cases $Q(k+1)$ holds. Finally, the first part of $Q(n)$ says that $a_n\equiv1$ or $a_n\equiv5\pmod6$, as required.

See this proof formalized in Lean: [Module 6 - Strengthening the induction hypothesis example](Lean/Module%206%20-%20Strengthening%20the%20induction%20hypothesis%20example.md)

### Strong induction

In **strong induction**, the inductive step may use the claim at *every* smaller number:

- **Inductive step**: for every $n$, assume $P(m)$ for every $m<n$, and prove $P(n)$.

If this step holds, then $P(n)$ holds for every natural number $n$. There is no separate base case in this form. At $n=0$ there is no smaller number, so nothing may be assumed, and $P(0)$ must be proved directly.

This is useful when the natural proof strategy is "break $n$ down into something smaller, of no fixed size." The reason it is valid is the same as for ordinary induction: if $P$ failed somewhere, let $q$ be the smallest number where it fails. Then $P(m)$ holds for every $m<q$, so the step gives $P(q)$, a contradiction.

Two-step induction uses only $m=n-1$ and $m=n-2$. Strong induction allows any smaller $m$, and the proof may choose $m$ after looking at $n$.

**Example.** Show every natural number $n \ge 2$ has a prime factor.

**Proof.** Let $P(n)$ be the statement "if $n\ge2$, then $n$ has a prime factor". Fix $n\ge2$, and assume $P(m)$ for every $m<n$. If $n$ is prime, $n$ divides itself, done. Otherwise $n$ has a divisor $m$ with $2 \le m < n$. By the hypothesis, $m$ has a prime factor $p$, and $p \mid m \mid n$ gives $p \mid n$.

See this proof formalized in Lean: [Module 6 - Strong induction example](Lean/Module%206%20-%20Strong%20induction%20example.md)

### Further reading: descent and the irrationality of $\sqrt2$

Module 3 stated that $\sqrt2$ is irrational and promised a proof by *descent*. Module 4 carried out a related argument for coprime integers. We can now finish.

A proof by **descent** shows that no object of some kind exists. It attaches a natural number to each object, called its *measure*, and shows that each object produces another object with a smaller measure. Natural numbers cannot decrease forever, so there is no such object. Precisely, this is strong induction on the measure: let $P(n)$ say "no object has measure $n$".

We use the helper fact from Module 4: if $a^2$ is even, then $a$ is even ([Module 4 - Coprime core of the √2 argument](../04-proofs-with-structure-ii/Lean/Module%204%20-%20Coprime%20core%20of%20the%20sqrt%202%20argument.md)).

**Example.** Show that there are no integers $a,b$ with $b\ne0$ and $a^2=2b^2$.

**Proof.** The measure of a pair $(a,b)$ is $|b|$. Let $P(n)$ be the statement: *for all integers $a,b$ with $|b|=n$ and $b\ne0$, we have $a^2\ne2b^2$.* The words "for all integers $a,b$" must be inside $P(n)$, because the proof will apply the hypothesis to a different pair.

Fix $n$, and assume $P(m)$ for every $m<n$. Let $a,b$ be integers with $|b|=n$ and $b\ne0$, and suppose $a^2=2b^2$. Then $a^2$ is even, so $a=2c$ for some integer $c$. Substituting gives $4c^2=2b^2$, so $b^2=2c^2$ is even, and $b=2d$ for some integer $d$. Substituting again gives $4c^2=8d^2$, so $c^2=2d^2$.

Since $b\ne0$, we have $d\ne0$ and $|d|=|b|/2<n$. So $P(|d|)$ applies to the pair $(c,d)$ and says $c^2\ne2d^2$. This is a contradiction.

**Example.** Show that $\sqrt2$ is irrational.

**Proof.** Suppose $\sqrt2=a/b$ for integers $a,b$ with $b\ne0$. Squaring and multiplying by $b^2$ gives $a^2=2b^2$, which the previous example rules out.

This proof does not need the fraction $a/b$ to be in lowest terms. Descent does that work: it replaces the coprimality argument of Module 4.

See this proof formalized in Lean: [Module 6 - Square root of two by descent](Lean/Module%206%20-%20Square%20root%20of%20two%20by%20descent.md)

## Common pitfalls

- **Forgetting the base case.** The inductive step alone proves nothing — without a confirmed starting rung, there's no ladder to climb.
- **Choosing a false starting case.** For $2^n\ge n^2$, the algebra of the inductive step works for every $k\ge3$, but the claim is false at $n=3$ since $8<9$. A valid step from a false start proves nothing. Always check the base case itself.
- **Assuming the target.** In the step you may assume $P(k)$, and you must prove $P(k+1)$. Starting from $P(k+1)$ and simplifying until you reach something true does not prove $P(k+1)$, unless every step can be reversed.
- **Proving the inductive step for the wrong variable.** The inductive step must show $P(k) \to P(k+1)$ for an *arbitrary* $k$, not just verify $P(1) \to P(2)$ for one specific number.
- **Using two-step induction with only one base case.** If the recursive step for $F_{k+2}$ genuinely needs both $F_k$ and $F_{k+1}$, both $P(0)$ and $P(1)$ must be established directly — the inductive step can't supply the missing one.
- **Mismatching the induction to the recursion.** If a sequence is defined by a two-term recursion, ordinary one-step induction's inductive hypothesis ($P(k)$ alone) usually isn't strong enough to prove $P(k+1)$ — reach for two-step or strong induction instead.
- **Using a hypothesis that is too weak.** If the step fails, the claim may need more information, not a different algebra trick. The residues modulo $6$ needed a claim about neighbouring terms. In the descent proof, a hypothesis about one fixed pair $(a,b)$ could not be applied to the smaller pair $(c,d)$.

## References

- Macbeth, Heather. *The Mechanics of Proof*, Chapter 6 (Induction). <https://hrmacbeth.github.io/math2001/06_Induction.html>
- UBC Math Department. *Prove It: A Structured Approach*, Topics 18, 19, 20, 21. <https://personal.math.ubc.ca/~PLP/>
