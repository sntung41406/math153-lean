# Module 7 – Functions

## Learning goals

By the end of this lecture, you can:
- Read and write the plain-English and Lean definitions of injective and surjective, and prove or disprove each property, by hand and in Lean, for a function given by a formula or by a table.
- Prove a function is bijective, compose two functions, and explain how left and right inverses relate to injectivity, surjectivity and bijectivity.
- Compute the image and the preimage of a small set under a function, and explain why a preimage is not an inverse function.
- Analyze a function whose outputs are ordered pairs by working with each coordinate separately.

## Motivation

A function isn't the same thing as a formula — it's any well-defined rule that assigns each input exactly one output (a look-up table works just as well as an algebraic expression). What matters mathematically is how that assignment behaves: does it ever send two different inputs to the same output? Does every possible output actually get hit? These behaviors decide whether a function can be "undone" — whether it has an inverse — which is essential once we start comparing the sizes of sets in the next module.

## Definition

### Domain, codomain and range

A function $f : A \to B$ assigns to each element $x$ of $A$ exactly one element $f(x)$ of $B$.

- $A$ is the **domain**: the inputs.
- $B$ is the **codomain**: the place where the outputs live.
- The **range** is the collection of outputs that actually occur, $\{f(x) \mid x \in A\}$.

The range is part of the codomain, but it can be smaller. The codomain is part of the function's description, as much as the rule is. Changing it gives a different function, even when the rule stays the same.

A function does not need a formula. It can be given by a table.

**Example.** Take three inputs, *athos*, *porthos* and *aramis*, and define $f$ from this set to itself by the table below. Find the domain, codomain and range of $f$, and show that $f$ has a collision and a missed output.

| $x$ | athos | porthos | aramis |
|---|---|---|---|
| $f(x)$ | aramis | aramis | athos |

**Proof.** The domain and the codomain are both $\{\text{athos}, \text{porthos}, \text{aramis}\}$. The range is $\{\text{aramis}, \text{athos}\}$. Two things happen here, and we can read both off the table without any algebra:

- **A collision.** The different inputs athos and porthos have the same output, aramis.
- **A missed output.** No input has output porthos, so porthos is in the codomain but not in the range.

The next two subsections give these two behaviors names. In that language, $f$ is neither injective nor surjective.

See this proof formalized in Lean: [Module 7 - Finite lookup table example](Lean/Module%207%20-%20Finite%20lookup%20table%20example.md)

### Injective functions

A function $f : A \to B$ is **injective** (or *one-to-one*) if it never sends two different inputs to the same output:
$$f(x_1) = f(x_2) \implies x_1 = x_2.$$

**Example.** Show $q(x) = x+3$ is injective on $\mathbb{R}$.

**Proof.** Suppose $q(x_1) = q(x_2)$, i.e. $x_1+3 = x_2+3$. Subtracting $3$ from both sides gives $x_1 = x_2$.

See this proof formalized in Lean: [Module 7 - Injective example](Lean/Module%207%20-%20Injective%20example.md)

To show a function is *not* injective, it's enough to exhibit two different inputs with the same output — a collision, like athos and porthos in the table above. For instance, $f(x) = x^2$ on $\mathbb{R}$ is not injective, since $f(-1) = f(1) = 1$ but $-1 \ne 1$.

### Surjective functions

A function $f : A \to B$ is **surjective** (or *onto*) if every element of $B$ is actually hit by $f$:
$$\forall y \in B,\ \exists x \in A,\ f(x) = y.$$
In other words, $f$ is surjective exactly when its range is the whole codomain.

**Example.** Show $s(a) = 3a+2$ is surjective on $\mathbb{Q}$.

**Proof.** Given any $y \in \mathbb{Q}$, take $x = \dfrac{y-2}{3}$. Then $s(x) = 3\cdot\dfrac{y-2}{3}+2 = y$.

See this proof formalized in Lean: [Module 7 - Surjective example](Lean/Module%207%20-%20Surjective%20example.md)

To show a function is *not* surjective, exhibit one element of the codomain with no preimage — a missed output, like porthos in the table above. For instance, $f(x) = x^2$ on $\mathbb{R}$ is not surjective, since no real $x$ satisfies $x^2 = -1$ (squares are never negative).

See both of these non-examples proved in Lean: [Module 7 - Non-injective and non-surjective example](Lean/Module%207%20-%20Non-injective%20and%20non-surjective%20example.md)

### The same rule with a different domain and codomain

Whether a function is surjective depends on its domain and codomain, not only on its rule.

**Example.** Let $d(x) = 2x$. Show that $d$ is surjective as a function $\mathbb{R} \to \mathbb{R}$, but not as a function $\mathbb{Z} \to \mathbb{Z}$.

**Proof.**

- **On $\mathbb{R}$, doubling is surjective.** Given any real $y$, take $x = \dfrac{y}{2}$. This is a real number, and $d(x) = 2 \cdot \dfrac{y}{2} = y$.
- **On $\mathbb{Z}$, doubling is not surjective.** The target $1$ has no preimage. If $2x = 1$ for an integer $x$, then $1$ would be even, but $1$ is odd. The only candidate is $x = \tfrac12$, and that is not an integer.

The algebra is the same in both cases. What changes is whether the witness $\tfrac{y}{2}$ belongs to the domain. Doubling is injective in both cases: $2x_1 = 2x_2$ gives $x_1 = x_2$.

See this proof formalized in Lean: [Module 7 - Doubling over ℝ and ℤ example](Lean/Module%207%20-%20Doubling%20over%20%E2%84%9D%20and%20%E2%84%A4%20example.md)

### Images and preimages

Let $f : A \to B$. We can follow a whole collection of inputs forward, or ask which inputs land in a collection of outputs. (Module 8 treats sets in full. Here we only need the idea of a collection and of membership, written $x \in S$. For example, $x \in \{0, 1\}$ means $x = 0$ or $x = 1$.)

- The **image** of a set $S$ of inputs is the set of their outputs:
  $$f(S) = \{f(x) \mid x \in S\}.$$
  So $y \in f(S)$ means: there is a witness $x \in S$ with $f(x) = y$.
- The **preimage** of a set $T$ of outputs is the set of all inputs that land in $T$:
  $$f^{-1}(T) = \{x \in A \mid f(x) \in T\}.$$
  So $x \in f^{-1}(T)$ means: $f(x) \in T$.

The range of $f$ is the image of the whole domain, $f(A)$.

The notation $f^{-1}(T)$ makes sense for **every** function $f$, and it is applied to a *set* of outputs. It does not say that $f$ has an inverse function. A preimage can contain many inputs, or none at all.

**Example.** Let $s(x) = x^2$ on $\mathbb{R}$. Show that $s(\{0,1\}) = \{0,1\}$ and $s^{-1}(\{0,1\}) = \{-1,0,1\}$.

**Proof.**

- **Image.** $s(0) = 0$ and $s(1) = 1$, so $s(\{0,1\}) = \{0, 1\}$.
- **Preimage.** $x \in s^{-1}(\{0,1\})$ means $x^2 = 0$ or $x^2 = 1$. The first gives $x = 0$. The second gives $(x+1)(x-1) = 0$, so $x = -1$ or $x = 1$. So $s^{-1}(\{0,1\}) = \{-1, 0, 1\}$.

We started from $\{0, 1\}$, went forward and came back, and gained the new input $-1$. This happens because $(-1)^2 = 1^2$: the same collision that shows squaring is not injective ([Module 7 - Non-injective and non-surjective example](Lean/Module%207%20-%20Non-injective%20and%20non-surjective%20example.md)). Taking a preimage collects *all* inputs that land in a set. It does not undo the function.

See this proof formalized in Lean: [Module 7 - Images and preimages example](Lean/Module%207%20-%20Images%20and%20preimages%20example.md)

### Bijective functions

A function is **bijective** if it is both injective and surjective — every output is hit, and each one is hit exactly once. Bijective functions set up a perfect pairing between the elements of $A$ and the elements of $B$.

"Each output is hit exactly once" can be written with the unique-existence quantifier from Module 4:
$$\forall y \in B,\ \exists!\, x \in A,\ f(x) = y.$$
This says the same thing as bijectivity. The existence part is surjectivity. The uniqueness part is injectivity: two inputs with the same output $y$ would be two different preimages of $y$.

**Example.** Show $p(x) = 2x-5$ is bijective on $\mathbb{R}$, and show that every real $y$ has exactly one preimage under $p$.

**Proof.** Injective: if $2x_1-5 = 2x_2-5$ then $x_1 = x_2$. Surjective: given any $y$, $x = \dfrac{y+5}{2}$ satisfies $p(x) = y$.

In the $\exists!$ form, the same number appears in both parts. Fix $y$.

- **Existence.** The witness $x = \dfrac{y+5}{2}$ satisfies $p(x) = y$.
- **Uniqueness.** If $p(x') = y$, then $2x' - 5 = y$. Solving gives $x' = \dfrac{y+5}{2}$, which is the witness.

So the uniqueness proof finds the witness again: solving $p(x) = y$ leaves only one possible answer.

See this proof formalized in Lean: [Module 7 - Bijective example](Lean/Module%207%20-%20Bijective%20example.md)

### Composition

Given $f : A \to B$ and $g : B \to C$, their **composition** $g \circ f : A \to C$ applies $f$ first and then $g$: $(g\circ f)(x) = g(f(x))$.

Two functions $u, v : A \to C$ are **equal** when they agree at every input: $u(x) = v(x)$ for all $x \in A$. This principle is called *function extensionality*. So to prove an equation between functions, fix an arbitrary input and prove an equation between numbers. To prove two functions are *different*, find one input where they disagree.

**Example.** Let $f(a) = a+3$, $g(b) = 2b$, $h(c) = 2c+6$, all $\mathbb{R}\to\mathbb{R}$. Show $g \circ f = h$, and show that $f \circ g \ne h$.

**Proof.** For any $x$: $(g\circ f)(x) = g(f(x)) = g(x+3) = 2(x+3) = 2x+6 = h(x)$. So $g \circ f = h$.
In the other order, $(f \circ g)(x) = f(2x) = 2x + 3$. At $x = 0$ this gives $(f\circ g)(0) = 3$, but $h(0) = 6$. So $f \circ g \ne h$: reversing the order changes the function.

See this proof formalized in Lean: [Module 7 - Composition example](Lean/Module%207%20-%20Composition%20example.md)

Composition keeps both properties from the previous subsections. Let $f : A \to B$ and $g : B \to C$.

- If $f$ and $g$ are both injective, then $g \circ f$ is injective.
- If $f$ and $g$ are both surjective, then $g \circ f$ is surjective.

Proofs of both facts are in *Prove It*, Topic 34.

### Inverse functions

Let $f : A \to B$ and $g : B \to A$. There are two identities to check, one on each side.

- $g$ is a **left inverse** of $f$ if $g(f(x)) = x$ for every $x \in A$: applying $f$ and then $g$ returns the input.
- $g$ is a **right inverse** of $f$ if $f(g(y)) = y$ for every $y \in B$: applying $g$ and then $f$ returns the output.

$f$ and $g$ are **inverse** to each other when both hold. By function extensionality, the two identities say exactly that $g \circ f = \mathrm{id}_A$ and $f \circ g = \mathrm{id}_B$, where $\mathrm{id}$ is the identity function $x \mapsto x$.

Each identity gives one property of $f$.

- **A left inverse makes $f$ injective.** If $f(x_1) = f(x_2)$, apply $g$ to both sides: $x_1 = g(f(x_1)) = g(f(x_2)) = x_2$.
- **A right inverse makes $f$ surjective.** Given $y \in B$, the input $x = g(y)$ works, because $f(g(y)) = y$.

So a function with an inverse is bijective.

**Example.** Show $p(x) = 2x-5$ and $p^{-1}(y) = \dfrac{y+5}{2}$ are inverse to each other, and conclude that $p$ is bijective.

**Proof.** Left inverse: $p^{-1}(p(x)) = \dfrac{(2x-5)+5}{2} = x$. Right inverse: $p(p^{-1}(y)) = 2\cdot\dfrac{y+5}{2}-5 = y$. The first identity makes $p$ injective and the second makes it surjective, so $p$ is bijective.

See this proof formalized in Lean: [Module 7 - Inverse example](Lean/Module%207%20-%20Inverse%20example.md)

The converse also holds: **every bijective function has an inverse.**

**Proof.** Let $f : A \to B$ be bijective. By the $\exists!$ form of bijectivity, each $y \in B$ has exactly one preimage. Define $g(y)$ to be that preimage.

- **Right inverse.** $g(y)$ is a preimage of $y$, so $f(g(y)) = y$. This part only uses surjectivity: we need *some* preimage to choose.
- **Left inverse.** Fix $x \in A$. Both $g(f(x))$ and $x$ are preimages of $f(x)$, because $f(g(f(x))) = f(x)$ by the right-inverse identity. Since $f$ is injective, $g(f(x)) = x$.

Together with the previous paragraph: a function has an inverse exactly when it is bijective. Notice that $g$ is defined without a formula, by choosing a preimage for each output. This is one reason we treat functions as rules or tables, not only as formulas.

See this proof formalized in Lean: [Module 7 - Bijectivity and inverses example](Lean/Module%207%20-%20Bijectivity%20and%20inverses%20example.md)

### Functions into a product

The **product** $A \times B$ is the set of **ordered pairs** $(a, b)$ with $a \in A$ and $b \in B$. Order matters: $(1, 2) \ne (2, 1)$. Two pairs are equal exactly when both coordinates are equal:
$$(a, b) = (c, d) \iff a = c \text{ and } b = d.$$
The two **projections** read off the coordinates: the first projection sends $(a, b)$ to $a$, and the second sends $(a, b)$ to $b$.

A function into a product produces two coordinates at once. To study it, look at one coordinate at a time.

**Example.** Let $q : \mathbb{Z} \to \mathbb{Z} \times \mathbb{Z}$ be $q(m) = (m+1,\ 2-m)$. Show $q$ is injective but not surjective.

**Proof.**

- **Injective.** Suppose $q(m) = q(n)$. The first coordinates are equal, so $m + 1 = n + 1$, and $m = n$. The first coordinate alone is enough.
- **Not surjective.** We show the pair $(0, 1)$ is missed. Suppose $q(m) = (0, 1)$. The first coordinate gives $m + 1 = 0$, so $m = -1$. Then the second coordinate is $2 - (-1) = 3$, not $1$. Contradiction.

The two coordinates of $q(m)$ always add up to $3$, so $q$ only reaches pairs on the line $a + b = 3$. Every other pair is missed.

See this proof formalized in Lean: [Module 7 - Functions into a product example](Lean/Module%207%20-%20Functions%20into%20a%20product%20example.md)

## Common pitfalls

- **Confusing injective and surjective.** Injective is about inputs never colliding; surjective is about outputs never being missed. A function can have either property without the other — $x \mapsto x^2$ on $\mathbb{R}$ has neither.
- **Forgetting that domain and codomain matter.** The same rule can be surjective on one pair of sets and not on another. See doubling on $\mathbb{R}$ and on $\mathbb{Z}$ above.
- **Reading $g \circ f$ in the wrong order.** $g \circ f$ applies $f$ *first*, even though $f$ is written on the right. Reversing the order usually gives a different function, as $f \circ g \ne g \circ f$ shows in the composition example.
- **Writing $f^{-1}$ without checking $f$ is bijective.** The inverse *function* $f^{-1}$ only exists when $f$ is bijective. For any function, $f^{-1}(T)$ is the preimage of a *set* $T$ — and as the squaring example shows, it can contain more than you started with.
- **Proving $\exists$ by picking a formula that doesn't typecheck.** When constructing a witness for surjectivity (like $x = (y-2)/3$), always double check it actually satisfies $f(x) = y$ by substitution — don't just guess the shape and move on. Also check that the witness lies in the domain: $\tfrac{y}{2}$ works over $\mathbb{R}$ but not over $\mathbb{Z}$.

## References

- Macbeth, Heather. *The Mechanics of Proof*, Chapter 8 (Functions), Sections 8.1–8.4. <https://hrmacbeth.github.io/math2001/08_Functions.html>
- Avigad, Jeremy, Patrick Massot, et al. *Mathematics in Lean*, Chapter 4 (Sets and Functions), Section 4.2 (Functions). <https://leanprover-community.github.io/mathematics_in_lean/C04_Sets_and_Functions.html>
- UBC Math Department. *Prove It: A Structured Approach*, Topics 31, 32, 33, 34, 35. <https://personal.math.ubc.ca/~PLP/>
