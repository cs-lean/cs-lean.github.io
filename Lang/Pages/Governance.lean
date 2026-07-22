import VersoBlog
import Lang.Components.Team
open Verso.Output Html
open Lang Components
open Verso.Genre.Blog (Page page_link)

def leo : Member := {
  url := "/static/team/leo.jpg",
  name := "Leo de Moura",
  role := "Lean Chief Architect, Co-Founder of Lean FRO, and Amazon",
}

def swarat : Member := {
  url := "/static/team/swarat.jpg",
  name := "Swarat Chaudhuri",
  role := "Google DeepMind and UT Austin",
}

def clark : Member := {
  url := "/static/team/clark-barrett.jpg",
  name := "Clark Barrett",
  role := "Stanford University and Amazon",
}

def fabrizio : Member := {
  url := "/static/team/fabrizio-mini.jpg",
  name := "Fabrizio Montesi",
  role := "University of Southern Denmark and Danish Institute for Advanced Study",
}

def jim : Member := {
  url := "/static/team/jim.jpg",
  name := "Jim Grundy",
  role := "Amazon",
}

def kohli : Member := {
  url := "/static/team/pushmeet-kohli.jpg",
  name := "Pushmeet Kohli",
  role := "Google DeepMind",
}

def sorrachai : Member := {
  url := "/static/team/sorrachai.jpg",
  name := "Sorrachai Yingchareonthawornchai",
  role := "ETH Zurich",
}

def arademaker : Member := {
  url := "/static/team/rademaker.jpg",
  name := "Alexandre Rademaker",
  role := "CSLib Director and Professor at FGV/EMAp",
}

def kim : Member := {
  url := "/static/team/kim.jpg",
  name := "Kim Morrison",
  role := "Lean FRO. Continuous Integration and Deployment (CI/CD) with upstream (Lean, mathlib)",
}

def henson : Member := {
  url := "/static/team/chris-henson.jpg",
  name := "Chris Henson",
  role := "Drexel University. Lambda calculus, metaprogramming",
}


def SteeringCommittee : Array Member :=
  #[clark, swarat, jim, kohli, leo, fabrizio]

def leadMaintainer : Array Member := #[fabrizio]

def renphilTeam : Array Member := #[arademaker]

def techLeads : Array Member := #[arademaker, sorrachai]

def areaMaintainers : Array Member := #[henson, kim]

def teamData := #[
  ("renphilTeam", renphilTeam),
  ("SteeringCommittee", SteeringCommittee),
  ("leadMaintainer", leadMaintainer),
  ("techLeads", techLeads),
  ("areaMaintainers",areaMaintainers)]

block_component +directive teamDiv (whichTeam : String) where
  toHtml _id _json _goI _goB _contents := do
    let some (_, data) := teamData.find? (·.1 == whichTeam)
      | Verso.reportError s!"Didn't find '{whichTeam}'"
        return .empty
    return {{
        <div class="members-card">
          {{
            ← data.mapM Components.team
          }}
        </div>
    }}

#doc (Page) "Governance" =>

%%%
showInNav := true
%%%

As explained on our [About](/about) page, "CSLib" refers to two distinct structures, and governance reflects that split. The *Initiative* at  [Renaissance Philanthropy](https://www.renaissancephilanthropy.org)  provides funding, staffing, and strategic support. The open-source library and community that builds and maintains the code, with its own governance, a steering committee and a body of maintainers, independent of RenPhil. The same person may hold roles in both, but the roles themselves remain distinct.

# CSLib Project

The open-source project is governed by two main bodies:

- A {page_link Lang.Pages.Governance "steering-committee"}[steering committee], responsible for securing financial support and guiding the overall vision of the project.
- A {page_link Lang.Pages.Governance "maintainers"}[maintainer team], responsible for curating, expanding, and maintaining the code repository and its technical direction.

These groups work together to define the project's roadmap and foster a welcoming and productive environment. New members may be invited based on project needs and individual merit.

## Steering committee

The steering committee guides the overall vision of the project and secures its financial support. Its members also form the Strategic Advisory Board of the CSLib Initiative.

:::teamDiv "SteeringCommittee"
:::

## Maintainers

The maintainer team is responsible for the quality of the codebase, establishing technical standards and ensuring coherence across contributions. It is organized into a lead maintainer, technical leads, and area maintainers.

## Lead maintainer

The lead maintainer coordinates the overall work of the maintainer team and oversees the project's repositories.

:::teamDiv "leadMaintainer"
:::

## Technical leads

Technical leads guide long-term developments that may span multiple areas of the codebase, offering specialised expertise.

:::teamDiv "techLeads"
:::

## Area maintainers

Area maintainers are trusted contributors who take ownership of specific areas of the codebase, supporting their growth both as subject-matter experts and reviewers.

:::teamDiv "areaMaintainers"
:::

# Team at Renphil

The CSLib Initiative provides the professional resources to help the open-source project grow: funding, coordination, and strategic focus.

## Employees

:::teamDiv "renphilTeam"
:::

## Strategic Advisory Board

The Strategic Advisory Board helps set the Initiative's direction and priorities. It is composed of the same members as the CSLib project's {page_link Lang.Pages.Governance "steering-committee"}[steering committee].


# Contact

The best option is to post your question or message in the [CSLib Zulip channel](https://leanprover.zulipchat.com/#narrow/channel/513188-CSLib).
You can also open an issue on the [CSLib repository](https://github.com/leanprover/cslib). Alternatively, you may contact any of us.
