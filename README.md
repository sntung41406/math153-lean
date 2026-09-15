# MATH 153: Introduction to Mathematics — Formalization & Proof Verification

*Fall 2026 · National Tsing Hua University*

MATH 153 is a gateway to modern mathematics: a mathematically sound framework for constructing and checking rigorous proofs. Over the semester, we bridge classical mathematical reasoning and interactive computer theorem proving using the **Lean** proof assistant, introducing students to an AI- and computer-assisted paradigm of modern mathematical research.

- **Instructor**: Shen-Ning Tung ([tung@math.nthu.edu.tw](mailto:tung@math.nthu.edu.tw))
- **Lecture Time**: Wednesdays, periods 3–4 and Fridays, periods 5–6
- **Office Hours**: After class / by appointment
- **Prerequisites**: None. No prior university-level mathematical background or programming experience is required — just a laptop capable of running VS Code and the Lean 4 toolchain.

This repository holds the student-facing lecture notes, slides, and Lean project for the course. It is a curated export of the course's internal authoring workspace — see [Contributing](#contributing) for what this repository is (and isn't) for.

## Start here

1. **Clone this repository** (or download it as a ZIP from the green *Code* button above) — this gives you both the notes and a working Lean/Mathlib project in one place.
2. **Install Lean 4 and VS Code**, following [`docs/setup.md`](docs/setup.md). Setup is also covered in the course's first lab lecture.
3. **Open this repository's folder** (not a subfolder) in VS Code — this is the configured Lean/Mathlib project the notes refer to as "the course project folder."
4. Start with [Module 0 — Preface](Modules/00-preface/00-Preface.md).

## Reading the notes

Every module note and Lean example page here is plain Markdown — it renders directly on GitHub, and every link between pages is a working relative Markdown link, so you can read the whole course by clicking through from [Module 0](Modules/00-preface/00-Preface.md).

The course is authored in [Obsidian](https://obsidian.md/) internally, with pages linked by backlinks and a shared vault. **Obsidian is not required** — no class activity depends on it. If you'd like linked, searchable notes with backlinks, cloning this repository and opening its folder as an Obsidian vault works too; if you'd rather just read on GitHub, this README and the module notes are the fully supported path.

## Course schedule

The curriculum is structured into four progressive phases, moving from basic computational proofs to advanced undergraduate mathematical structures: 13 content modules across 16 weeks, with three consolidation/buffer weeks built in so students have time to absorb material before moving on. Module notes are published here progressively as the term proceeds; unpublished modules are listed for reference and will link out once available.

| Week | Module | Topic |
|:---|:---|:---|
| 1 | 0 | [Preface](Modules/00-preface/00-Preface.md) |
| 2 | 1 | [Proofs by Calculation](Modules/01-proofs-by-calculation/01-Proofs%20by%20Calculation.md) |
| 3 | 2 | Proofs with Structure |
| 4 | 3 | Parity, Divisibility & Number Theory |
| 5 | 4 | Proofs with Structure, II |
| 6 | — | **Consolidation week** — extended practice across Modules 0–4 |
| 7 | 5 | Logic |
| 8 | 6 | Induction |
| 9 | 7 | Functions |
| 10 | 8 | Sets |
| 11 | 9 | Relations |
| 12 | — | **Consolidation week** — extended practice across Modules 7–9 |
| 13 | 10 | Groups and Rings |
| 14 | 11 | Linear Algebra |
| 15 | 12 | Differential Calculus (elementary, single-variable scope) |
| 16 | — | Review / buffer week |

### Course phases

- **Phase I — Foundations of Concrete Proofs** (Modules 0–4): Setting up the Lean environment; rewriting and evaluating expressions; assumptions, goals, and step-by-step reasoning; formalizing parity, divisibility, and basic number theory; deepening tactical control with nested proof states.
- **Phase II — Pure Logic & Metatheory** (Modules 5–6): Propositional logic, quantifiers ($\forall, \exists$), conjunctions, and implications; the induction principle and proofs over natural numbers.
- **Phase III — Classical Core Math** (Modules 7–9): Functions (injectivity, surjectivity, composition, inverses); sets (operations, subsets, power sets, cardinality, countability); relations (equivalence relations, partial orders, quotients).
- **Phase IV — Advanced Modern Structures** (Modules 10–12): Groups and rings; linear algebra (vector spaces, independence, bases); differential calculus (limits, continuity, and the derivative, scoped to the elementary single-variable case).

## Evaluation

| Assessment | Weight | Description |
|:---|:---:|:---|
| In-class Test & Practice | 100% | Weekly in-class computational problem sets. Students work out mathematical proofs manually, then translate and formally verify them using Lean. Spot checks will be conducted where selected students present and explain their interactive proof tactics to the class. |
| Oral Re-evaluation Exam | Optional | Reserved at the instructor's discretion for individual students who exhibit insufficient evidence of learning progress or to resolve academic integrity discrepancies. |

- **Submission Format**: Written proofs are submitted as Markdown, and Lean code as a separate Lean script (`.lean` file) — all in English.
- **AI-Use Policy**: AI may be used for preparation and study outside graded in-class activities, unless a task explicitly permits its use. Students must be able to explain and defend every submitted proof.

This repository is not a channel for submitting coursework — see [Contributing](#contributing).

## Course materials

- **Primary Texts**: *The Mechanics of Proof* by Heather Macbeth ([hrmacbeth.github.io/math2001](https://hrmacbeth.github.io/math2001/)) and *Mathematics in Lean* by the Lean Community ([leanprover-community.github.io/mathematics_in_lean](https://leanprover-community.github.io/mathematics_in_lean/)).
- **Supplementary**: *Prove It: A Structured Approach* (UBC) — [personal.math.ubc.ca/~PLP](https://personal.math.ubc.ca/~PLP/)
- **Software Stack**: [Lean 4 Theorem Prover](https://lean-lang.org/) with Visual Studio Code and the official Lean 4 extension.

## Slides

- [Lecture 1 — Introduction](Slides/0-Introduction-slides.html)
- [Module 1 — Proofs by Calculation](Slides/1-Proofs-by-Calculation-slides.html)

Slides are published once each deck has had its presenter notes stripped and reviewed for student-safe content.

## Contributing

This repository publishes finished, reviewed course material; it does not take outside contributions, and issues/pull requests aimed at changing course content will generally be closed. Found an actual error (a typo, a broken link, a Lean snippet that no longer compiles)? Open an issue describing it — the instructor will fix it in the internal source and republish.

Do not use this repository, its issues, or its pull requests to submit coursework. Submissions follow the process described in class, not GitHub.

## License

- Lecture notes and slides (`Modules/`, `Slides/`) are licensed [CC BY-NC-SA 4.0](LICENSE-DOCS).
- Lean code (`Examples/`, project files) is licensed [Apache License 2.0](LICENSE), matching [Mathlib](https://github.com/leanprover-community/mathlib4)'s own license.
