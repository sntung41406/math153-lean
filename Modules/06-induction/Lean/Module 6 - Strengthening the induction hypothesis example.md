# Module 6 - Strengthening the induction hypothesis example

## Statement

Given $a_0=2$, $a_1=1$, $a_{n+2}=a_{n+1}+2a_n$, prove that $a_m\equiv1$ or $a_m\equiv5\pmod6$ for every $m\ge1$.

## Code

```lean
import Mathlib

def a : ℕ → ℤ
  | 0 => 2
  | 1 => 1
  | n + 2 => a (n + 1) + 2 * a n

example {m : ℕ} (hm : 1 ≤ m) : a m ≡ 1 [ZMOD 6] ∨ a m ≡ 5 [ZMOD 6] := by
  have H : ∀ n : ℕ, 1 ≤ n →
      (a n ≡ 1 [ZMOD 6] ∧ a (n + 1) ≡ 5 [ZMOD 6])
    ∨ (a n ≡ 5 [ZMOD 6] ∧ a (n + 1) ≡ 1 [ZMOD 6]) := by
    intro n hn
    induction n, hn using Nat.le_induction with
    | base =>
      left
      constructor
      · rw [a]
      · rw [a, a, a]
        norm_num
    | succ k hk IH =>
      obtain ⟨IH1, IH2⟩ | ⟨IH1, IH2⟩ := IH
      · right
        constructor
        · exact IH2
        · calc a (k + 1 + 1) = a (k + 1) + 2 * a k := by rw [a]
            _ ≡ 5 + 2 * 1 [ZMOD 6] := by rel [IH1, IH2]
            _ ≡ 1 [ZMOD 6] := by decide
      · left
        constructor
        · exact IH2
        · calc a (k + 1 + 1) = a (k + 1) + 2 * a k := by rw [a]
            _ ≡ 1 + 2 * 5 [ZMOD 6] := by rel [IH1, IH2]
            _ ≡ 5 [ZMOD 6] := by decide
  obtain ⟨H1, H2⟩ | ⟨H1, H2⟩ := H m hm
  · left
    exact H1
  · right
    exact H1
```

## Walkthrough

- The bound `1 ≤ m` is needed because $a_0=2$ is neither $1$ nor $5$ modulo $6$.
- **Why the plain claim is too weak.** Knowing only "$1$ or $5$" at $k$ and at $k+1$ allows the pair of residues $(1,1)$. Then $a_{k+2}\equiv3\pmod6$, and the step fails.
- **The stronger claim.** `H` tracks the ordered pair of neighbouring residues: it is either $(1,5)$ or $(5,1)$. The pair $(1,1)$ is now excluded. Each allowed pair produces the other one, so the claim passes from $k$ to $k+1$.
- [`Nat.le_induction`](../../../Glossary/Nat.le_induction.md) proves `H`, starting at $1$. This is ordinary one-step induction, because `H` already mentions two neighbouring terms.
- Base case: `rw [a]` shows $a_1=1$, and the congruence closes by reflexivity. `rw [a, a, a]` unfolds $a_2=a_1+2a_0$, and [`norm_num`](../../../Glossary/norm_num.md) finishes.
- Inductive step: [`obtain`](../../../Glossary/obtain.md) splits `IH` into the two allowed pairs. The first part of the target is `IH2`, since the old second term is the new first term. For the new term, [`rel`](../../../Glossary/rel.md) `[IH1, IH2]` substitutes both congruences, and [`decide`](../../../Glossary/decide.md) computes the residue.
- The last three lines recover the original claim. Each case of `H m hm` has `H1`, which is one side of the wanted [`∨`](../../../Glossary/or.md). The information about $a_{m+1}$ was needed for the induction, and it is not needed in the conclusion.

## Back-link

- [Module 6 – Induction](../06-Induction.md)
