import VersoBlog
import Lang.Components.Team
import Lang.Components.TeamData
open Verso.Output Html
open Lang Components
open Verso.Genre.Blog (Page page_link)

#doc (Page) "CSLib Initiative" =>

%%%
showInNav := false
%%%

# Opening

The CSLib Initiative is a programme by [Renaissance Philanthropy](https://www.renaissancephilanthropy.org). Its mission is to support the growth of the CSLib open-source project, in the same way that the [Mathlib Initiative](https://mathlib-initiative.org/) supports Mathlib. The Initiative has active management: a Director, a team of RenPhil employees and contractors, and a Strategic Advisory Board that helps set direction and priorities.

# Team at RenPhil

The CSLib Initiative provides the professional resources to help the open-source project grow: funding, coordination, and strategic focus.

## Employees

:::teamDiv "renphilTeam"
:::

## Strategic Advisory Board

The Strategic Advisory Board helps set the Initiative's direction and priorities. It is composed of the same members as the CSLib project's {page_link Lang.Pages.Governance "steering-committee"}[steering committee].

# Our Approach

The CSLib Initiative provides the professional resources — funding, staffing, coordination, and strategic focus — that enable the open-source project to grow faster and more sustainably than a volunteer effort alone could. Rather than replacing the community's work, the Initiative amplifies it: funding formalization efforts, supporting maintainers and reviewers, investing in documentation and educational resources, and coordinating with partners across the Lean ecosystem.

# Roadmap

CSLib is past its early bootstrapping phase. It is an active contributor community, a steady flow of pull requests, and ongoing public design discussion on Zulip.

The CSLib Initiative has secured dedicated funding to accelerate progress over the next couple of years. That funding is organized around four operational goals. In the near term, effort is allocated across the pillars as follows:

- *Sustaining organic growth.* Process, tooling, and documentation that keep contribution and review healthy as the community scales, benefitting both pillars.
- *Visibility through external applications.* A small number of high-visibility projects built on CSLib that stress-test both pillars, demand new primitives, and contribute general results back into the library.
- *Focused foundational investment.* Directly funded work on parts of each pillar that need sustained effort to mature — foundational semantics and specification infrastructure on the Pillar 1 side, the Boole verification pipeline on the Pillar 2 side.
- *Coordination with the wider ecosystem.* Working alongside related Lean and formal-methods efforts so the primitives they need are in place, and so that their results feed back into CSLib.

Concrete milestones and progress reports will be shared as this work matures. The [GitHub repository](https://github.com/leanprover/cslib) and our [Zulip channel](https://leanprover.zulipchat.com/#narrow/channel/513188-CSLib) are the best places to see what's actively being worked on. See also the [open-source library roadmap](/roadmap).
