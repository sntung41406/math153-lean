-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/Int.even_or_odd.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (n : ℤ) : Even (n * (n + 1)) := by
  obtain h | h := Int.even_or_odd n
  · obtain ⟨k, hk⟩ := h
    use k * (n + 1)
    rw [hk]
    ring
  · obtain ⟨k, hk⟩ := h
    use (2 * k + 1) * (k + 1)
    rw [hk]
    ring
