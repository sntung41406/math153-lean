# Module 5 – Logic

## Learning goals

By the end of this lecture, you can:
- State what ∧, ∨, ¬, →, and ↔ mean, build a truth table for a compound statement, and decide whether two statements are logically equivalent.
- Prove and use quantified statements with ∀ and ∃, and explain why swapping a ∀ with an ∃ changes the meaning of a statement.
- Apply the law of excluded middle (`by_cases`) to split a proof into cases on whether some proposition holds.
- Push a negation inward through ∧, ∨, →, ∀, and ∃, by hand and with `push Not`, and use the result to disprove a statement.

## Motivation

Every proof so far has combined "and", "or", "not", "for all", and "there exists" informally, relying on intuition — "P or Q, but not Q, so P" feels obvious. Logic makes that intuition precise: connectives and quantifiers are themselves objects with fixed rules for introducing and using them, and Lean holds you to those rules exactly. Getting comfortable with this vocabulary now pays off everywhere later in the course, especially once quantifiers start nesting inside definitions like continuity or convergence.

## Definition

### Propositional connectives

A **proposition** is a statement that is either true or false. For propositions $P,Q$:

| Connective | Read as | True exactly when |
| :--- | :--- | :--- |
| $P \wedge Q$ | "P and Q" | both $P$ and $Q$ are true |
| $P \vee Q$ | "P or Q" | at least one of $P,Q$ is true |
| $\neg P$ | "not P" | $P$ is false |
| $P \to Q$ | "P implies Q" | $P$ is false, or $Q$ is true |
| $P \leftrightarrow Q$ | "P if and only if Q" | $P$ and $Q$ have the same truth value |

A **truth table** lists every combination of truth values for $P$ and $Q$, and the value of each connective in that row. Two propositions give $2 \times 2 = 4$ rows (T = true, F = false):

| $P$ | $Q$ | $P \wedge Q$ | $P \vee Q$ | $P \to Q$ | $P \leftrightarrow Q$ |
| :---: | :---: | :---: | :---: | :---: | :---: |
| T | T | T | T | T | T |
| T | F | F | T | F | F |
| F | T | F | T | T | F |
| F | F | F | F | T | T |

Two rows need care, because they differ from everyday English:
- **"Or" is inclusive.** In the first row both $P$ and $Q$ are true, and $P \vee Q$ is true. Mathematical "or" means "at least one", never "exactly one".
- **An implication with a false premise is true.** In the last two rows $P$ is false, and $P \to Q$ is true whatever $Q$ is. The implication only promises something when $P$ holds; if $P$ fails, the promise cannot be broken. This is called **vacuous truth**.

In Lean, a proposition has type `Prop`. You don't prove a compound proposition by checking its truth table — you build it piece by piece with tactics: `constructor` splits a $\wedge$ or $\leftrightarrow$ goal into its two parts, `left`/`right` choose a side of a $\vee$ goal, and `obtain` breaks a $\wedge$ or $\vee$ *hypothesis* into cases.

**Example.** From $P \vee Q$ and $\neg Q$, conclude $P$.

**Proof.** Use the hypothesis $P \vee Q$ by cases. If $P$ holds, we are done. If $Q$ holds, this contradicts $\neg Q$, so this case cannot happen.

See this proof formalized in Lean: [Module 5 - Disjunction elimination example](Lean/Module%205%20-%20Disjunction%20elimination%20example.md)

### Logical equivalence

The truth table of a compound statement is built one connective at a time, from the inside out. For $\neg(P \wedge \neg Q)$, first compute $\neg Q$, then $P \wedge \neg Q$, then the outer $\neg$:

| $P$ | $Q$ | $\neg Q$ | $P \wedge \neg Q$ | $\neg(P \wedge \neg Q)$ |
| :---: | :---: | :---: | :---: | :---: |
| T | T | F | F | T |
| T | F | T | T | F |
| F | T | F | F | T |
| F | F | T | F | T |

The last column is the same as the column for $P \to Q$ in the first table. This kind of match has a name:
- A **tautology** is a statement that is true in every row of its truth table, such as $P \vee \neg P$.
- A **contradiction** is a statement that is false in every row, such as $P \wedge \neg P$.
- Two statements are **logically equivalent** if they have the same truth value in every row. Then $A \leftrightarrow B$ is a tautology, and we may replace $A$ by $B$ in any argument.

So $\neg(P \wedge \neg Q)$ and $P \to Q$ are logically equivalent. A logical equivalence holds because of the connectives alone, whatever the propositions $P$ and $Q$ say.

**Example.** Show $(P \vee P) \leftrightarrow P$.

**Proof.** Forward: if $P \vee P$, then in either case $P$ holds. Backward: if $P$ holds, then $P \vee P$ holds, using the left side. (In a truth table, both sides have the column T, F.)

See this proof formalized in Lean: [Module 5 - Elementary logical equivalence example](Lean/Module%205%20-%20Elementary%20logical%20equivalence%20example.md)

**Example.** Show $P \wedge (Q \vee R) \leftrightarrow (P \wedge Q) \vee (P \wedge R)$.

**Proof.** Forward: given $P$ and ($Q$ or $R$), if $Q$ holds then $P\wedge Q$ holds, so the left disjunct holds; if $R$ holds, the right disjunct holds instead. Backward: given $P\wedge Q$, both $P$ and $Q\vee R$ hold (since $Q$ holds); the case $P \wedge R$ is symmetric. This is a **distributive law**: $\wedge$ distributes over $\vee$, as multiplication distributes over addition.

See this proof formalized in Lean: [Module 5 - Conjunction disjunction distributivity example](Lean/Module%205%20-%20Conjunction%20disjunction%20distributivity%20example.md)

### Implications, converse and contrapositive

The basic way to *use* an implication is **modus ponens**: if $P \to Q$ is true and $P$ is true, then $Q$ is true. For example, "if $n > 3$ then $n^2 > 9$" together with "$7 > 3$" gives "$49 > 9$". In Lean, a hypothesis `h : P → Q` applied to `hP : P` gives `h hP : Q`.

Vacuous truth explains the other rows. The statement "for every integer $n$, if $n^2 < 0$ then $n = 5$" is true: no integer has $n^2 < 0$, so the premise is never true, and the implication is never broken.

Given an implication $P \to Q$, its **converse** is $Q \to P$, and its **contrapositive** is $\neg Q \to \neg P$. The contrapositive is logically equivalent to the original implication — they are true together and false together — so proving one proves the other, and sometimes the contrapositive is the easier one to prove directly. The converse is a genuinely different statement: it is not implied by $P \to Q$, and can easily be false even when $P \to Q$ is true.

**Example.** For integers $n$, consider "if $n > 3$ then $n^2 > 9$". Show that its contrapositive is true and its converse is false.

**Proof.** The original statement is true: if $n > 3$ then $n \ge 4$, so $n^2 \ge 16 > 9$. Its contrapositive, "if $n^2 \le 9$ then $n \le 3$", is logically equivalent to it, so it is also true. Its converse, "if $n^2 > 9$ then $n > 3$", is false: $n = -4$ gives $n^2 = 16 > 9$ but $n \le 3$.

Mixing up an implication with its converse is a frequent source of bad arguments. Sometimes a converse is true, but that isn't automatic: it needs its own proof. It's true that if $n$ is even then $n^2$ is even, and the converse is also true. The easiest route to the converse is through *its* contrapositive. In Lean, the tactic `contrapose!` replaces a goal by its contrapositive.

**Example.** For an integer $n$, show that if $n^2$ is even then $n$ is even.

**Proof.** We prove the contrapositive: if $n$ is odd then $n^2$ is odd. Write $n = 2k+1$. Then $n^2 = 4k^2+4k+1 = 2(2k^2+2k)+1$, which is odd.

See this proof formalized in Lean: [Module 5 - Converse via contrapositive example](Lean/Module%205%20-%20Converse%20via%20contrapositive%20example.md)

### Predicates and quantifiers

A **predicate** is a statement $P\,x$ that depends on a variable $x$, such as "$x^2 \ge x$". It has no truth value until $x$ is fixed. The **domain** is the set the variable ranges over: $\mathbb{N}$, $\mathbb{Z}$, $\mathbb{R}$, and so on. The same predicate can be true over one domain and false over another; "$x^2 \ge x$" holds for every integer but not for every real number.

$\forall x, P\,x$ reads "for every $x$, $P\,x$ holds"; $\exists x, P\,x$ reads "there is some $x$ for which $P\,x$ holds". Proving them calls for opposite strategies:
- To prove $\forall x \in A, P\,x$, take an **arbitrary** $x \in A$ — one you know nothing about except that it lies in $A$ — and prove $P\,x$. Since nothing special was assumed, the argument works for every $x$. For example, $\forall n \in \mathbb{Z},\ n^2+1 \ge 1$ is true because for *any* integer $n$, $n^2 \ge 0$.
- To prove $\exists x \in A, P\,x$, one **witness** is enough: a specific value that you name and check. For example, $\exists n \in \mathbb{Z}$ such that $\tfrac{7n-6}{3} \in \mathbb{Z}$ is true, since $n=3$ gives $\tfrac{7(3)-6}{3} = 5 \in \mathbb{Z}$.

**Example.** If $P\,x$ holds for every $x$ and $Q\,x$ holds for every $x$, then $P\,x \wedge Q\,x$ holds for every $x$.

**Proof.** Take an arbitrary $x$. The first hypothesis, used at this $x$, gives $P\,x$; the second gives $Q\,x$. So $P\,x \wedge Q\,x$ holds, and since $x$ was arbitrary, it holds for every $x$.

See this proof formalized in Lean: [Module 5 - Quantified conjunction example](Lean/Module%205%20-%20Quantified%20conjunction%20example.md)

Two quantifiers **of the same kind** can be swapped: $\forall x\,\forall y, P\,x\,y$ and $\forall y\,\forall x, P\,x\,y$ both say "$P\,x\,y$ holds for every pair", and $\exists x\,\exists y$ and $\exists y\,\exists x$ both say "some pair works".

A ∀ and an ∃ **cannot** be swapped. A statement with mixed quantifiers is like a game between two players, played from left to right. For $\forall z \in \mathbb{Z},\ \exists w \in \mathbb{N},\ z^2 < w$, the first player chooses any integer $z$; the second player sees $z$ and then chooses $w$. Here $w = z^2 + 1$ wins, so the statement is true. The witness $w$ **depends on** $z$: it may use every variable chosen before it. In $\exists w \in \mathbb{N},\ \forall z \in \mathbb{Z},\ z^2 < w$ the order is reversed: one $w$ must be chosen first and must work for every $z$. That is impossible — $z = w$ gives $z^2 = w^2 \ge w$ — so this statement is false.

In general $\exists x\,\forall y, P\,x\,y$ says one $x$ works for every $y$, while $\forall y\,\exists x, P\,x\,y$ only asks that some $x$ (possibly depending on $y$) works for each $y$. The first is a stronger claim than the second — it implies the second, but not conversely. Module 4 showed this on a concrete pair of statements ([Module 4 - Nested quantifiers example](../04-proofs-with-structure-ii/Lean/Module%204%20-%20Nested%20quantifiers%20example.md)); here is the general rule.

**Example.** Show $\big(\exists x\,\forall y, P\,x\,y\big) \to \forall y\,\exists x, P\,x\,y$.

**Proof.** Suppose some $x_0$ satisfies $P\,x_0\,y$ for every $y$. Then for any particular $y$, that same $x_0$ witnesses $\exists x, P\,x\,y$.

See this proof formalized in Lean: [Module 5 - Quantifier order example](Lean/Module%205%20-%20Quantifier%20order%20example.md)

### The law of excluded middle

Classical logic asserts that for any proposition $P$, either $P$ holds or $\neg P$ holds — there is no third option. In Lean, the tactic `by_cases h : P` uses this to split a proof into two branches: one where you may assume $P$, one where you may assume $\neg P$. This is what lets you remove a double negation. Knowing how to prove and how to use statements built with $\wedge$, $\vee$, $\to$, and $\neg$ is not enough for this step.

You have already relied on this principle. In Module 4, a positive claim $P$ was proved by assuming $\neg P$ and deriving a contradiction (`by_contra`; see [Module 4 - Ruling out a case example](../04-proofs-with-structure-ii/Lean/Module%204%20-%20Ruling%20out%20a%20case%20example.md)). Deriving a contradiction from $\neg P$ proves $\neg\neg P$; the final step from $\neg\neg P$ to $P$ is exactly double-negation elimination, and that is what the law of excluded middle provides.

**Example.** Show $\neg\neg P \to P$.

**Proof.** Case on whether $P$ holds. If it does, we're done. If it doesn't, then $\neg P$ holds, which together with the hypothesis $\neg\neg P$ is a contradiction — so this case is impossible.

See this proof formalized in Lean: [Module 5 - Double negation elimination example](Lean/Module%205%20-%20Double%20negation%20elimination%20example.md)

### The negation algorithm

Negation can always be pushed inward until it sits directly on an atomic statement, following a fixed set of rules:

- $\neg(P \wedge Q) \leftrightarrow \neg P \vee \neg Q$
- $\neg(P \vee Q) \leftrightarrow \neg P \wedge \neg Q$
- $\neg(P \to Q) \leftrightarrow P \wedge \neg Q$
- $\neg\neg P \leftrightarrow P$
- $\neg\forall x \in A, P\,x \leftrightarrow \exists x \in A, \neg P\,x$
- $\neg\exists x \in A, P\,x \leftrightarrow \forall x \in A, \neg P\,x$

The first two are **De Morgan's laws**; the last two are their quantifier analogues. Notice that $\neg$ turns $\wedge$ into $\vee$ and $\vee$ into $\wedge$, and turns $\forall$ into $\exists$ and $\exists$ into $\forall$. The third rule says an implication fails exactly when the premise holds and the conclusion does not — the second row of the truth table. In the quantifier rules, **the domain $A$ does not change**: the negation of "every $x \in A$ has property $P$" is "some $x \in A$ fails $P$", not a statement about elements outside $A$.

The first four rules involve only connectives, so each can be checked with a truth table. The two quantifier rules cannot: a domain such as $\mathbb{Z}$ has infinitely many elements, so there is no finite table to check. Every rule can instead be proved from the meanings of the connectives and quantifiers.

Most directions need nothing extra. Four directions need the law of excluded middle:
- from $\neg(P \wedge Q)$ to $\neg P \vee \neg Q$,
- from $\neg(P \to Q)$ to $P \wedge \neg Q$,
- from $\neg\neg P$ to $P$, as in the previous section,
- from $\neg\forall x, P\,x$ to $\exists x, \neg P\,x$.

In each of them, a positive fact has to be produced from a negative hypothesis. In the last one, the hypothesis only says that $P$ does not hold everywhere; it does not name an $x$ where it fails, yet the conclusion asks for such a witness.

**Example.** Show $\neg(\exists x, P\,x) \leftrightarrow \forall x, \neg P\,x$.

**Proof.** Forward: assume no $x$ satisfies $P$, and take any $x$. If $P\,x$ held, $x$ would be a witness for $\exists x, P\,x$, which is impossible; so $\neg P\,x$. Backward: assume every $x$ fails $P$. If some $x$ satisfied $P\,x$, then $P\,x$ and $\neg P\,x$ would both hold; so no such $x$ exists.

See this proof, De Morgan's laws, and the rule for $\neg(P \to Q)$ formalized in Lean: [Module 5 - Negation rules by hand example](Lean/Module%205%20-%20Negation%20rules%20by%20hand%20example.md)

The **negation algorithm** applies the rules from the outside in, one connective at a time, until every $\neg$ sits on an atomic statement such as $n^2 = m$, which then becomes $n^2 \ne m$. For natural numbers, integers, rational numbers, and real numbers, a negated inequality flips: $\neg(a < b)$ becomes $a \ge b$, and $\neg(a \le b)$ becomes $a > b$.

**Example.** Negate $\forall m \in \mathbb{Z},\ m \ne 2 \to \exists n \in \mathbb{Z},\ n^2 = m$.

**Proof.** Apply the rules from the outside in: first $\neg\forall$, then $\neg(P \to Q)$, then $\neg\exists$.

$$
\begin{aligned}
&\neg\big(\forall m \in \mathbb{Z},\ m \ne 2 \to \exists n \in \mathbb{Z},\ n^2 = m\big)\\
\leftrightarrow\ &\exists m \in \mathbb{Z},\ \neg\big(m \ne 2 \to \exists n \in \mathbb{Z},\ n^2 = m\big)\\
\leftrightarrow\ &\exists m \in \mathbb{Z},\ m \ne 2 \wedge \neg\big(\exists n \in \mathbb{Z},\ n^2 = m\big)\\
\leftrightarrow\ &\exists m \in \mathbb{Z},\ m \ne 2 \wedge \forall n \in \mathbb{Z},\ n^2 \ne m.
\end{aligned}
$$

The original says "every integer other than $2$ is a perfect square", which is false. The negation says "some integer other than $2$ is not a perfect square", and $m = 3$ is a witness: no integer $n$ has $n^2 = 3$, since $n^2 \le 1$ when $|n| \le 1$ and $n^2 \ge 4$ when $|n| \ge 2$.

See this proof formalized in Lean: [Module 5 - Nested negation example](Lean/Module%205%20-%20Nested%20negation%20example.md)

In Lean, the `push Not` tactic applies all of these rules mechanically to a goal, or to a hypothesis with `push Not at h`, turning something like $\neg\forall x, x \ge 0$ into $\exists x, x < 0$ in one step (also flipping $\ge$ to $<$, $\le$ to $>$, and so on, for natural numbers, integers, rational numbers, and real numbers). One output differs from the list above: by default `push Not` turns $\neg(P \wedge Q)$ into $P \to \neg Q$, not $\neg P \vee \neg Q$. The two forms are logically equivalent ("if $P$ holds then $Q$ fails"), and the implication form needs no excluded middle. To get De Morgan's form instead, write `push +distrib Not`. Older Lean code, including *The Mechanics of Proof* and *Mathematics in Lean*, calls this tactic `push_neg`. Current Mathlib still accepts that name but marks it as deprecated, so this course uses `push Not`.

**Example.** Show $\neg\big(\forall x \in \mathbb{R}, x^2 \ge x\big)$.

**Proof.** Pushing the negation inward turns the goal into $\exists x, x^2 < x$. Taking $x = \tfrac12$ works, since $\big(\tfrac12\big)^2 = \tfrac14 < \tfrac12$.

Module 4 proved this same statement by assuming the universal claim and using it at $x=\tfrac12$ ([Module 4 - Refuting a universal statement example](../04-proofs-with-structure-ii/Lean/Module%204%20-%20Refuting%20a%20universal%20statement%20example.md)). The counterexample is the same in both proofs. The negation algorithm turns "refute a $\forall$" into "prove an $\exists$", so the counterexample becomes an ordinary witness. In the same way it turns "refute an $\exists$" into "prove a $\forall$": Module 4's proof that no real $c$ satisfies $b < c$ for every $b$ becomes a direct proof that every $c$ has some $b \ge c$.

See these proofs formalized in Lean, together with an example of `push Not at h`: [Module 5 - Negation algorithm example](Lean/Module%205%20-%20Negation%20algorithm%20example.md)

### Disproof

To **disprove** a statement is to prove its negation. The negation algorithm shows how much work that takes, and the answer depends on the outer quantifier:
- To disprove $\forall x \in A, P\,x$, prove $\exists x \in A, \neg P\,x$. **One counterexample is enough.** For example, $\forall n \in \mathbb{Z},\ \tfrac{7n-6}{3} \in \mathbb{Z}$ is false, since $n=1$ gives $\tfrac{1}{3} \notin \mathbb{Z}$.
- To disprove $\exists x \in A, P\,x$, prove $\forall x \in A, \neg P\,x$. **No single example is enough**: the argument must rule out every possible witness, so it has to work for an arbitrary $x$. For example, $\exists n \in \mathbb{Z},\ n^2 < 0$ is false, because for *every* integer $n$ we have $n^2 \ge 0$. Checking $n = 0, 1, 2, \dots$ one at a time would never finish.

**Example.** Disprove "for all natural numbers $a,b,c$, if $a \mid bc$ then $a \mid b$ or $a \mid c$".

**Proof.** The statement is a $\forall$, so we need one counterexample. Its negation is "there are $a,b,c$ with $a \mid bc$, $a \nmid b$, and $a \nmid c$". Take $a = 4$ and $b = c = 2$: then $bc = 4$, so $4 \mid bc$, but $4 \nmid 2$.

See this proof formalized in Lean: [Module 5 - Divisibility counterexample](Lean/Module%205%20-%20Divisibility%20counterexample.md)

## Common pitfalls

- **Treating $\to$ as if it meant $\leftrightarrow$.** $P \to Q$ says nothing about what happens when $P$ is false — proving $Q \to P$ (the converse) doesn't prove $P \to Q$.
- **Assuming a true implication's converse is automatically true.** "If $n > 3$ then $n^2 > 9$" is true for integers, but "if $n^2 > 9$ then $n > 3$" fails at $n = -4$ — the converse always needs its own, separate proof.
- **Reading "or" as "exactly one".** $P \vee Q$ is true when both hold. To disprove $P \vee Q$ you must show that *both* $P$ and $Q$ fail.
- **Assuming $\exists x\,\forall y$ and $\forall y\,\exists x$ are interchangeable.** Only one direction holds in general; a single witness that works for everyone is a much stronger claim than a possibly-different witness for each $y$.
- **Changing the domain when negating.** The negation of $\forall x > 0,\ P\,x$ is $\exists x > 0,\ \neg P\,x$, not $\exists x \le 0,\ P\,x$. Only the quantifier and the predicate change.
- **Negating an implication as another implication.** $\neg(P \to Q)$ is $P \wedge \neg Q$, not $P \to \neg Q$ or $\neg P \to \neg Q$.
- **Stopping the negation halfway.** Pushing a negation only partway through a statement (e.g. past the quantifier but not into the inequality) leaves a goal like $\exists x, \neg(x^2 \ge x)$ instead of the fully simplified $\exists x, x^2 < x$ — always let `push Not` finish before reading off the new goal.
- **Disproving an $\exists$ with examples.** Checking many values that fail does not disprove $\exists x, P\,x$; you need an argument that covers every $x$.
- **Forgetting `by_cases` needs no side proof.** Classically, every proposition is decidable in this sense — `by_cases h : P` never leaves an extra goal to show $P$ is "decidable"; it just produces the two cases.

## References

- Macbeth, Heather. *The Mechanics of Proof*, Chapter 5 (Logic), §§5.1–5.3. <https://hrmacbeth.github.io/math2001/05_Logic.html>
- Avigad, Jeremy, Patrick Massot, et al. *Mathematics in Lean*, Chapter 3 (Logic), §§3.1, 3.3. <https://leanprover-community.github.io/mathematics_in_lean/C03_Logic.html>
- UBC Math Department. *Prove It: A Structured Approach*, Topics 2, 5, 6, 10, 13, 14, 15, 17. <https://personal.math.ubc.ca/~PLP/>
