-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/06-induction/Lean/Module 6 - Strengthening the induction hypothesis example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

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
