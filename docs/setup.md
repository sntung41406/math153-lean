# Setup

## 1. Install Lean 4

Install [`elan`](https://github.com/leanprover/elan), the Lean version manager, following the instructions at [lean-lang.org/lean4/doc/quickstart.html](https://lean-lang.org/lean4/doc/quickstart.html). You do not need to install a specific Lean version yourself — this repository pins one in [`lean-toolchain`](../lean-toolchain), and `elan` will fetch it automatically the first time you open the project.

## 2. Install VS Code and the Lean 4 extension

Install [Visual Studio Code](https://code.visualstudio.com/), then install the **Lean 4** extension from the Extensions panel (search for "lean4", publisher `leanprover`).

## 3. Open this repository as the project folder

Clone or download this repository, then in VS Code use **File → Open Folder…** and select the repository's root folder — the one containing `lakefile.toml`. This is the "course project folder" the lecture notes refer to; `import Mathlib` only resolves inside it.

The first time you open it, run, from a terminal in that folder:

```sh
lake exe cache get
tools/build_examples.sh
```

`lake exe cache get` downloads prebuilt Mathlib binaries instead of compiling Mathlib from source, which would otherwise take a long time. `tools/build_examples.sh` then compiles every example in `Examples/` — use this instead of plain `lake build`, which currently fails on this project (see the comment at the top of that script for why); it isn't a problem with the examples themselves.

## 4. Try it

Open [`Examples/Module0EvalAndCheckExample.lean`](../Examples/Module0EvalAndCheckExample.lean), place your cursor on the first `#eval` line, and open the Lean Infoview (Command Palette → *Lean 4: InfoView: Toggle InfoView*). You should see `4`.

## Troubleshooting

- **`import Mathlib` reports an unknown package**: you opened a single file or a different folder instead of this repository's root. Reopen the folder containing `lakefile.toml`.
- **The Infoview stays empty**: check the open file has a `.lean` extension, that your cursor is on the line you care about, and give Lean a moment to finish loading (the status bar shows progress).
- **`tools/build_examples.sh` fails**: run `lake update` to re-resolve the Mathlib dependency against the pinned toolchain, then retry `lake exe cache get && tools/build_examples.sh`.
- **Plain `lake build` fails with "some modules have bad imports"**: expected on this project right now — use `tools/build_examples.sh` instead (see that script's header comment). It does not affect editing files or using the Infoview in VS Code.
