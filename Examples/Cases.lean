-- GENERATED FILE — do not edit by hand.
-- Extracted from Glossary/cases.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

inductive Color
  | red
  | green

open Color

def swap : Color → Color
  | red => green
  | green => red

example (c : Color) : swap (swap c) = c := by
  cases c
  · rfl
  · rfl

example : red ≠ green := by
  intro h
  cases h
