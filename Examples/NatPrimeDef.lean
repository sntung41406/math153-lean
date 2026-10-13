-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Nat.prime_def.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {p : ℕ} (hp : Nat.Prime p) : 2 ≤ p := by
  rw [Nat.prime_def] at hp
  obtain ⟨h2, hdiv⟩ := hp
  exact h2
