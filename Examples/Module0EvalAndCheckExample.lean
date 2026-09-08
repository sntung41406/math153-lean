-- GENERATED FILE — do not edit by hand.
-- Extracted from Modules/00-preface/Lean/Module 0 - eval and check example.md by scripts/extract_lean_examples.py.
-- Edit the Markdown source and re-run the publication pipeline instead.

import Mathlib

-- Computational evaluation
#eval 2 + 2
#eval "Hello, World!"
#eval 15 * 6 - 10

-- Type checking: object vs proposition
#check 2 + 2               -- an object: a natural number
#check 2 + 2 = 4           -- a proposition: a statement that could be true or false

-- Giving a proposition a name
def MyStatement : Prop := 2 + 2 = 4

#check MyStatement         -- MyStatement : Prop
