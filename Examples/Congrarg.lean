-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/congrArg.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

example (a b : ℤ) (h : a = b) : a + 1 = b + 1 := congrArg (fun x ↦ x + 1) h
