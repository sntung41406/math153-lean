# Module 8 – Sets

## Learning goals

By the end of this lecture, you can:
- Read and write set-builder notation, and decide whether a given element belongs to a set.
- Prove a subset claim or a set equality, using the `ext` tactic to reduce set equality to an iff, and disprove one with a single element.
- Prove facts about union, intersection, difference, complement, Cartesian products, images, and preimages by unpacking membership into the logic from Module 5.
- Describe what a power set is, compare the sizes of sets with injections and bijections, and explain why a set is always strictly smaller than its power set.

## Motivation

A set collects objects without regard to order or repetition, and "is this object in that set?" is itself just a proposition. Everything from Module 5 (logic) carries over directly: $x \in A \cup B$ *is* $x\in A \vee x\in B$; $A \subseteq B$ *is* $\forall x, x\in A \to x\in B$. Sets are also how we'll eventually compare the *sizes* of infinite collections — a question formulas alone can't answer, but functions (Module 7) can.

## Definition

### Sets and membership

A set is described either by listing its elements, like $\{1,2,3\}$, or with **set-builder notation** $\{x \mid P(x)\}$: the set of all $x$ (from some ambient type) for which the proposition $P(x)$ holds. Membership $a \in \{x \mid P(x)\}$ just *is* the proposition $P(a)$.

**Example.** Show $1 \in \{n \in \mathbb{Z} \mid n \le 3\}$ and $10 \notin \{n \in \mathbb{N} \mid n \text{ is odd}\}$.

**Proof.** The first claim unfolds to $1 \le 3$, which is true. The second unfolds to $\neg(10 \text{ is odd})$, which is true since $10 = 2\cdot 5$ is even.

See this proof formalized in Lean: [Module 8 - Membership example](Lean/Module%208%20-%20Membership%20example.md)

### Subsets and set equality

$A$ is a **subset** of $B$, written $A \subseteq B$, when every element of $A$ is also an element of $B$: $\forall x, x \in A \to x \in B$. Two sets are **equal** exactly when each is a subset of the other — $A = B \iff (A\subseteq B) \wedge (B \subseteq A)$ — which is why proving $A=B$ almost always means proving an iff, one element at a time.

A subset claim is a "for all" statement, so one element is enough to disprove it. To show $A \not\subseteq B$, give one element of $A$ that is not in $B$. The same element also shows $A \ne B$, because equal sets have the same elements.

**Example.** Show $\{a \in \mathbb{N} \mid 4 \mid a\} \subseteq \{b \in \mathbb{N} \mid 2 \mid b\}$, and show that the reverse inclusion fails.

**Proof.**

- **Inclusion.** If $4 \mid a$, write $a = 4k$. Then $a = 2(2k)$, so $2 \mid a$.
- **The reverse inclusion fails.** The number $6$ is in the second set, since $6 = 2 \cdot 3$. It is not in the first set, since $4 \nmid 6$. So $\{b \mid 2 \mid b\} \not\subseteq \{a \mid 4 \mid a\}$, and the two sets are not equal.

See this proof formalized in Lean: [Module 8 - Subset example](Lean/Module%208%20-%20Subset%20example.md)

**Example.** Show $\{x \in \mathbb{Z} \mid x \text{ is odd}\} = \{a \in \mathbb{Z} \mid \exists k,\ a = 2k-1\}$.

**Proof.** If $x = 2l+1$ for some $l$, then $x = 2(l+1)-1$. Conversely, if $x = 2k-1$, then $x = 2(k-1)+1$, so $x$ is odd.

See this proof formalized in Lean: [Module 8 - Set equality example](Lean/Module%208%20-%20Set%20equality%20example.md)

### Set operations

Given sets $A, B$ (from the same ambient type), the standard operations translate directly into logic:

| Operation | Notation | Membership |
| :--- | :--- | :--- |
| Union | $A \cup B$ | $x \in A \vee x \in B$ |
| Intersection | $A \cap B$ | $x \in A \wedge x \in B$ |
| Difference | $A \setminus B$ | $x \in A \wedge x \notin B$ |
| Complement | $A^c$ | $x \notin A$ |
| Empty set | $\emptyset$ | never true |
| Universal set | $U$ (or `univ`) | always true |

To prove a claim about these operations, replace each membership by its row in the table, and then use the logic from Module 5.

**Example.** Show $\{n \in \mathbb{N} \mid 4 \le n\} \cap \{n \in \mathbb{N} \mid n \le 6\} = \{4, 5, 6\}$.

**Proof.** By the table, $n$ is in the left side exactly when $4 \le n$ and $n \le 6$. The natural numbers with $4 \le n \le 6$ are $4$, $5$, and $6$, so this holds exactly when $n = 4$, $n = 5$, or $n = 6$.

See this proof formalized in Lean: [Module 8 - Bounded intersection example](Lean/Module%208%20-%20Bounded%20intersection%20example.md)

**Example.** Show that for all sets $A, B, C$, $A \cap (B \cup C) = (A \cap B) \cup (A \cap C)$.

**Proof.** We show that $x$ is in the left side exactly when it is in the right side.

- **Left to right.** Let $x \in A \cap (B \cup C)$. Then $x \in A$, and $x \in B$ or $x \in C$. If $x \in B$, then $x \in A \cap B$. If $x \in C$, then $x \in A \cap C$. Either way, $x \in (A \cap B) \cup (A \cap C)$.
- **Right to left.** Let $x \in (A \cap B) \cup (A \cap C)$. If $x \in A \cap B$, then $x \in A$ and $x \in B \cup C$. If $x \in A \cap C$, then $x \in A$ and $x \in B \cup C$. Either way, $x \in A \cap (B \cup C)$.

This is the set version of the logical law $P \wedge (Q \vee R) \iff (P \wedge Q) \vee (P \wedge R)$.

See this proof formalized in Lean: [Module 8 - Distributive law example](Lean/Module%208%20-%20Distributive%20law%20example.md)

**Example.** Show $\{x \in \mathbb{R} \mid -1 < x\} \cup \{x \in \mathbb{R} \mid x < 1\} = \mathbb{R}$, the universal set of real numbers.

**Proof.** Every set of real numbers is a subset of $\mathbb{R}$, so we only need to show that every real number $t$ is in the union. If $t < 0$, then $t < 1$. If $t \ge 0$, then $t > -1$. Either way $t$ lands in one of the two sets.

See this proof formalized in Lean: [Module 8 - Union example](Lean/Module%208%20-%20Union%20example.md)

**Example.** Show $\{n \in \mathbb{Z} \mid n \text{ is even}\}^c = \{n \in \mathbb{Z} \mid n \text{ is odd}\}$.

**Proof.** By definition $n \in A^c \iff n \notin A$, and "not even" is exactly "odd" for integers.

See this proof formalized in Lean: [Module 8 - Complement example](Lean/Module%208%20-%20Complement%20example.md)

### Cartesian products

The operations above combine two sets from the *same* ambient type. The **Cartesian product** $A \times B$ can combine sets of different types: it is the set of ordered pairs whose first coordinate is in $A$ and whose second coordinate is in $B$,
$$(a, b) \in A \times B \iff a \in A \wedge b \in B.$$
Module 7 introduced pairs and the product $A \times B$ ([Module 7 - Functions into a product example](../07-functions/Lean/Module%207%20-%20Functions%20into%20a%20product%20example.md)). Here the product is a *set* of pairs, so membership in it reduces to one membership claim for each coordinate. In Lean, the product of two sets is written `A ×ˢ B`.

**Example.** Show $(3, -2) \in \{n \in \mathbb{N} \mid n \text{ is odd}\} \times \{z \in \mathbb{Z} \mid z < 0\}$.

**Proof.** We check one coordinate at a time. The first coordinate $3 = 2 \cdot 1 + 1$ is an odd natural number. The second coordinate $-2$ is a negative integer.

See this proof formalized in Lean: [Module 8 - Cartesian product example](Lean/Module%208%20-%20Cartesian%20product%20example.md)

### Images and preimages

Module 7 defined the image and the preimage of a set under a function $f : A \to B$:
$$y \in f(S) \iff \exists x,\ x \in S \wedge f(x) = y, \qquad x \in f^{-1}(T) \iff f(x) \in T.$$
Now that we have set operations, we can ask how images and preimages interact with them.

**Example.** Let $f : A \to B$ and let $S, T$ be sets of outputs. Show that $f^{-1}(S \cup T) = f^{-1}(S) \cup f^{-1}(T)$ and $f^{-1}(S \cap T) = f^{-1}(S) \cap f^{-1}(T)$.

**Proof.** For the union, unpack each side:
$$x \in f^{-1}(S \cup T) \iff f(x) \in S \cup T \iff f(x) \in S \vee f(x) \in T \iff x \in f^{-1}(S) \cup f^{-1}(T).$$
The proof for the intersection is the same, with $\wedge$ in place of $\vee$.

See this proof formalized in Lean: [Module 8 - Preimage laws example](Lean/Module%208%20-%20Preimage%20laws%20example.md)

Images behave well with unions, but only partly with intersections.

**Example.** Let $f : A \to B$ and let $S, T$ be sets of inputs. Show that $f(S \cup T) = f(S) \cup f(T)$ and $f(S \cap T) \subseteq f(S) \cap f(T)$. Then show that the reverse inclusion $f(S) \cap f(T) \subseteq f(S \cap T)$ can fail.

**Proof.**

- **Union, left to right.** Let $y \in f(S \cup T)$. Then $y = f(x)$ for some $x \in S \cup T$. If $x \in S$, then $y \in f(S)$. If $x \in T$, then $y \in f(T)$.
- **Union, right to left.** If $y \in f(S)$, then $y = f(x)$ for some $x \in S$. This $x$ is also in $S \cup T$, so $y \in f(S \cup T)$. The case $y \in f(T)$ is the same.
- **Intersection.** Let $y \in f(S \cap T)$. Then $y = f(x)$ for some $x$ in both $S$ and $T$. The same witness $x$ shows $y \in f(S)$ and $y \in f(T)$.
- **The reverse inclusion fails.** Let $s(x) = x^2$ on $\mathbb{R}$, $S = \{-1\}$, and $T = \{1\}$. Then $s(S) = \{1\}$ and $s(T) = \{1\}$, so $1 \in s(S) \cap s(T)$. But $S \cap T = \emptyset$, so $s(S \cap T) = \emptyset$, and $1 \notin s(S \cap T)$.

The proof of the intersection inclusion breaks in the reverse direction. From $y \in f(S)$ and $y \in f(T)$ we get two witnesses, one in $S$ and one in $T$, and they need not be the same input. In the counterexample, $-1$ and $1$ are different inputs with the same output: the collision that shows squaring is not injective in Module 7. When $f$ is injective, the two witnesses must be equal, and the reverse inclusion does hold.

See this proof formalized in Lean: [Module 8 - Image laws example](Lean/Module%208%20-%20Image%20laws%20example.md)

### Power sets

The **power set** of $A$, written $\mathcal{P}(A)$, is the set of *all* subsets of $A$ — including $\emptyset$ and $A$ itself. So for a set $S$,
$$S \in \mathcal{P}(A) \iff S \subseteq A.$$
The elements of $\mathcal{P}(A)$ are sets. To prove $S \in \mathcal{P}(A)$, prove the subset claim $S \subseteq A$.

**Example.** Show $\mathcal{P}(\{0,1\}) = \{\emptyset,\ \{0\},\ \{1\},\ \{0,1\}\}$.

**Proof.** Each of the four sets on the right is a subset of $\{0,1\}$, so each is in $\mathcal{P}(\{0,1\})$. Conversely, let $S \subseteq \{0,1\}$. The only possible elements of $S$ are $0$ and $1$, so $S$ is decided by whether $0 \in S$ and whether $1 \in S$. There are four cases:

| $0 \in S$? | $1 \in S$? | $S$ |
| :--- | :--- | :--- |
| no | no | $\emptyset$ |
| yes | no | $\{0\}$ |
| no | yes | $\{1\}$ |
| yes | yes | $\{0,1\}$ |

In every case $S$ is one of the four sets on the right.

The Lean page formalizes the membership $\{0\}\in\mathcal P(\{0,1\})$: [Module 8 - Power set example](Lean/Module%208%20-%20Power%20set%20example.md)

**Example.** Show that for all sets $A, B$, $\mathcal{P}(A) \cup \mathcal{P}(B) \subseteq \mathcal{P}(A \cup B)$. Then show that the reverse inclusion can fail.

**Proof.**

- **Inclusion.** Let $S \in \mathcal{P}(A) \cup \mathcal{P}(B)$. If $S \in \mathcal{P}(A)$, then $S \subseteq A \subseteq A \cup B$. If $S \in \mathcal{P}(B)$, then $S \subseteq B \subseteq A \cup B$. Either way $S \subseteq A \cup B$, so $S \in \mathcal{P}(A \cup B)$.
- **The reverse inclusion fails.** Let $A = \{0\}$ and $B = \{1\}$. The set $\{0, 1\} = A \cup B$ is in $\mathcal{P}(A \cup B)$. It is not a subset of $\{0\}$, since $1 \notin \{0\}$, and it is not a subset of $\{1\}$, since $0 \notin \{1\}$. So $\{0,1\} \notin \mathcal{P}(A) \cup \mathcal{P}(B)$.

A subset of $A \cup B$ can take some elements from $A$ and some from $B$. A set in $\mathcal{P}(A) \cup \mathcal{P}(B)$ must take all of its elements from one side.

See this proof formalized in Lean: [Module 8 - Power set inclusion example](Lean/Module%208%20-%20Power%20set%20inclusion%20example.md)

### Cardinality and countability

For finite sets, comparing sizes just means comparing counts. For *infinite* sets, "size" is defined instead through functions from Module 7:

- $A$ and $B$ have the same **cardinality**, written $|A| = |B|$, when there is a bijection $A \to B$.
- $|A| \le |B|$ when there is an injection $A \to B$.
- $|A| < |B|$ when $|A| \le |B|$ but $|A| \ne |B|$: there is an injection $A \to B$, but no bijection.

A set is **finite** when it has a bijection with $\{1, 2, \dots, n\}$ for some natural number $n$ (with $n = 0$ for $\emptyset$). A set is **countably infinite** when it has a bijection with $\mathbb{N}$: its elements can be listed as a first, a second, a third, and so on, with every element appearing exactly once. A set is **countable** when it is finite or countably infinite, and **uncountable** otherwise.

A countably infinite set can be "the same size" as a set that seems larger.

**Example.** Show that $\mathbb{Z}$ is countably infinite.

**Proof.** List the integers as $0, -1, 1, -2, 2, -3, 3, \dots$. As a function $e : \mathbb{N} \to \mathbb{Z}$, this is
$$e(n) = \begin{cases} n/2 & n \text{ even}, \\ -(n+1)/2 & n \text{ odd}. \end{cases}$$
To show $e$ is a bijection, we give an inverse $d : \mathbb{Z} \to \mathbb{N}$:
$$d(z) = \begin{cases} 2z & z \ge 0, \\ -2z - 1 & z < 0. \end{cases}$$

- **Left inverse.** If $n$ is even, then $e(n) = n/2 \ge 0$, so $d(e(n)) = 2 \cdot \tfrac n2 = n$. If $n$ is odd, then $n \ge 1$ and $e(n) = -\tfrac{n+1}{2} < 0$, so $d(e(n)) = (n+1) - 1 = n$.
- **Right inverse.** If $z \ge 0$, then $d(z) = 2z$ is even, so $e(d(z)) = z$. If $z < 0$, then $d(z) = -2z - 1$ is odd, so $e(d(z)) = -\tfrac{-2z}{2} = z$.

A function with a left inverse and a right inverse is bijective (Module 7), so $|\mathbb{N}| = |\mathbb{Z}|$.

See this proof formalized in Lean: [Module 8 - Integer enumeration example](Lean/Module%208%20-%20Integer%20enumeration%20example.md)

This definition has a surprising consequence: some infinities are strictly bigger than others. **Cantor's theorem** says that for *any* set $X$, there is no surjection from $X$ onto its own power set $\mathcal{P}(X)$.

**Example.** Show there is no surjective function $f : X \to \mathcal{P}(X)$, for any set $X$.

**Proof.** Suppose $f$ were surjective. Consider $S = \{x \in X \mid x \notin f(x)\}$; since $f$ is surjective, $S = f(x_0)$ for some $x_0$. Ask whether $x_0 \in S$. If it is, then by definition of $S$, $x_0 \notin f(x_0) = S$, a contradiction. If it isn't, then $x_0 \notin f(x_0)$ holds, which is exactly what puts $x_0$ into $S$ — also a contradiction. Either way, no such $f$ can exist.

From Cantor's theorem we get the strict inequality $|X| < |\mathcal{P}(X)|$ in two steps.

- **No bijection.** A bijection is in particular surjective, and there is no surjection $X \to \mathcal{P}(X)$. So $|X| \ne |\mathcal{P}(X)|$.
- **An injection.** The singleton map $x \mapsto \{x\}$ sends each element of $X$ to a subset of $X$. It is injective: if $\{x\} = \{y\}$, then $x \in \{y\}$, so $x = y$. So $|X| \le |\mathcal{P}(X)|$.

For $X = \mathbb{N}$, this shows $\mathcal{P}(\mathbb{N})$ is uncountable. It is not countably infinite, since there is no bijection from $\mathbb{N}$. It is not finite either, since it contains the infinitely many different sets $\{0\}, \{1\}, \{2\}, \dots$.

The Lean page formalizes Cantor's theorem (no surjection $X \to \mathcal{P}(X)$), the absence of a bijection, and the injectivity of $x \mapsto \{x\}$: [Module 8 - Cantor's theorem example](Lean/Module%208%20-%20Cantor%27s%20theorem%20example.md)

## Common pitfalls

- **Confusing $\in$ and $\subseteq$.** $x \in A$ says $x$ is *one element* of $A$; $B \subseteq A$ says *every element* of $B$ is in $A$. Writing $x \subseteq A$ or $\{x\} \in A$ when the other was meant is a common slip.
- **Trying to prove $A = B$ without splitting into two directions.** Since equality unfolds to a $\iff$ after `ext`, most proofs need both a forward and a backward argument, exactly like proving a biconditional in Module 5.
- **Assuming a law holds in both directions.** $f(S \cap T) \subseteq f(S) \cap f(T)$ and $\mathcal{P}(A) \cup \mathcal{P}(B) \subseteq \mathcal{P}(A \cup B)$ hold for all sets, but the reverse inclusions can fail. Before proving an equality, check each direction; when one fails, a single element shows it.
- **Forgetting the power set's elements are themselves sets.** $\mathcal{P}(A)$ doesn't contain the elements of $A$ — it contains *subsets* of $A$. $\emptyset$ and $A$ itself always belong to $\mathcal{P}(A)$, even though neither is (in general) an element of $A$.
- **Assuming all infinite sets are the same size.** $\mathbb{N}$ and $\mathbb{Z}$ have the same cardinality, as the integer enumeration shows, but Cantor's theorem gives $|\mathbb{N}| < |\mathcal{P}(\mathbb{N})|$. It is also true that $|\mathcal{P}(\mathbb{N})| = |\mathbb{R}|$, so $\mathbb{R}$ is uncountable; we state this without proof.

## References

- Macbeth, Heather. *The Mechanics of Proof*, Chapter 9 (Sets), Sections 9.1 (Introduction), 9.2 (Set operations), and 9.3 (The type of sets). <https://hrmacbeth.github.io/math2001/09_Sets.html>
- Avigad, Jeremy, Patrick Massot, et al. *Mathematics in Lean*, Chapter 4 (Sets and Functions), Sections 4.1 (Sets) and 4.2 (Functions). <https://leanprover-community.github.io/mathematics_in_lean/C04_Sets_and_Functions.html>
- UBC Math Department. *Prove It: A Structured Approach*, Topics 1, 22, 23, 24, 25, 39, 40, 41, 43. <https://personal.math.ubc.ca/~PLP/>
