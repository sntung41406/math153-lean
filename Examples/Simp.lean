-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/simp.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example {x : ℕ} (h : 0 < x * 0) : False := by
  simp at h
