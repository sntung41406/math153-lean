-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/07-functions/Lean/Module 7 - Finite lookup table example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

open Function

inductive Musketeer
  | athos
  | porthos
  | aramis
  deriving DecidableEq

open Musketeer

def f : Musketeer → Musketeer
  | athos => aramis
  | porthos => aramis
  | aramis => athos

example : ¬ Injective f := by
  intro h
  have h1 : athos = porthos := h rfl
  cases h1

example : ¬ Surjective f := by
  intro h
  obtain ⟨a, ha⟩ := h porthos
  cases a <;> cases ha
