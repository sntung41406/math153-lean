# Glossary

Reusable Lean vocabulary pages. Each entry gives a plain-English meaning, a minimal example, when to use it, and one official documentation link. Module notes link to a glossary entry at its first meaningful use.

## Week 1

- [`#check`](check.md)
- [`#eval`](eval.md)
- [`rfl`](rfl.md)
- [`by`](by.md)
- [`sorry`](sorry.md)
- [Infoview](Infoview.md)

## Week 2

- [`calc`](calc.md)
- [`rw`](rw.md)
- [`norm_num`](norm_num.md)
- [`ring`](ring.md)
- [`linarith`](linarith.md)
- [`nlinarith`](nlinarith.md)
- [`add_le_add_left`](add_le_add_left.md)

## Week 3

Tactics and syntax:

- [`have`](have.md)
- [`apply`](apply.md)
- [`obtain`](obtain.md)
- [`·` (focusing dot)](focusing-dot.md)
- [`constructor`](constructor.md)
- [`left` and `right`](left-right.md)
- [`use`](use.md)
- [`exact`](exact.md)
- [`positivity`](positivity.md)
- [`omega`](omega.md)

Notation:

- [`∧` (and)](and.md)
- [`∨` (or)](or.md)
- [`∃` (there exists)](exists.md)
- [`≠` (not equal)](ne.md)

Named lemmas used by the Module 2 examples:

- [`ne_of_lt`](ne_of_lt.md)
- [`ne_of_gt`](ne_of_gt.md)
- [`le_antisymm`](le_antisymm.md)
- [`mul_right_cancel₀`](mul_right_cancel%E2%82%80.md)
- [`le_of_pow_le_pow_left₀`](le_of_pow_le_pow_left%E2%82%80.md)
- [`lt_or_ge`](lt_or_ge.md)
- [`eq_zero_or_eq_zero_of_mul_eq_zero`](eq_zero_or_eq_zero_of_mul_eq_zero.md)
- [`Nat.pow_le_pow_left`](Nat.pow_le_pow_left.md)
- [`sq_nonneg`](sq_nonneg.md)

## What gets an entry

Commands, tactics, syntax and editor features that the course teaches get an entry. A named Mathlib lemma gets an entry when students need it to read, reuse, or understand a released example — including a lemma that only supports the main idea, such as `sq_nonneg` inside an `nlinarith` call or `mul_right_cancel₀` behind a cancellation step. A lemma no released example mentions by name does not get an entry yet.
