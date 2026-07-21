import VersoBlog

import Lang.Components.Container
import Lang.Components.ZulipInfo

open Verso.Genre Blog Theme Template
open Verso.Output Html
open Lang.Components

open Verso.Genre.Blog (Page)

#doc (Page) "Roadmap" =>

# Two pillars, four directions

CSLib is built around two pillars, first laid out in the [white paper](https://arxiv.org/abs/2602.04846):

*Pillar 1 — Formalizing computer science in Lean.* A unified, coherent
formal treatment of the field's essential concepts: models of computation, algorithms and data structures, programming-language semantics, concurrency, and the specification logics used to reason about them.

*Pillar 2 — Reasoning about everyday code.* Infrastructure that makes Lean practical for verifying real programs, centered on Boole — an intermediate verification language into which mainstream imperative code can be translated and then checked using CSLib's Lean-based machinery.

The pillars are the library's stable scientific identity: they describe what CSLib is independently of any funding phase or milestone. Together, they unpack into four long-term directions the project keeps advancing:

- *Formalizing CS foundations* — deepening the coverage of models, semantics,
  and logics under Pillar 1.
- *Reasoning about code* — both algorithms written and verified directly in
  Lean, and the Boole path for imperative code under Pillar 2.
- *A repository of verified code* — the concrete output of both pillars:
  a growing library of algorithms and data structures with machine-checked
  correctness and complexity proofs, in Lean and in Boole.
- *AI integration* — making CSLib available as high-quality data and
  infrastructure for AI-assisted theorem proving, following the model
  Mathlib has established.

# Where things stand

CSLib is past its early bootstrapping phase. It is an active contributor community, a steady flow of pull requests, and ongoing public design discussion on Zulip. The project has also secured dedicated funding to accelerate progress over the next couple of years.

That funding is organized around four operational goals. In the near term, effort is allocated across the pillars as follows:

- *Sustaining organic growth.* Process, tooling, and documentation that keep contribution and review healthy as the community scales, benefitting both pillars.
- *Visibility through external applications.* A small number of high-visibility projects built on CSLib that stress-test both pillars, demand new primitives, and contribute general results back into the library.
- *Focused foundational investment.* Directly funded work on parts of each pillar that need sustained effort to mature — foundational semantics and specification infrastructure on the Pillar 1 side, the Boole verification pipeline on the Pillar 2 side.
- *Coordination with the wider ecosystem.* Working alongside related Lean and formal-methods efforts so the primitives they need are in place, and so that their results feed back into CSLib.

Concrete milestones and progress reports will be shared as this work matures. The [GitHub repository](https://github.com/leanprover/cslib) and our [Zulip channel](https://leanprover.zulipchat.com/#narrow/channel/513188-CSLib) are the best places to see what's actively being worked on.
