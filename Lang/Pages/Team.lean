import VersoBlog
import Lang.Components.Team

open Verso.Output Html
open Lang Components
open Verso.Genre.Blog (Page)

def leo : Member := {
  url := "/static/team/leo.jpg",
  name := "Leo de Moura",
  role := "Lean Chief Architect, Co-Founder of Lean FRO",
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
  url := "/static/team/shadow.jpg",
  name := "Pushmeet Kohli",
  role := "Google DeepMind",
}

def teamMembers : Array Member := #[clark, swarat, jim, kohli, leo, fabrizio]

def arademaker : Member := {
  url := "/static/team/rademaker.jpg",
  name := "Alexandre Rademaker",
  role := "Atlas Computing and Getulio Vargas Foundation",
}

def sorrachai : Member := {
  url := "/static/team/sorrachai.jpg",
  name := "Sorrachai Yingchareonthawornchai",
  role := "ETH Zurich",
}

def techLeads : Array Member := #[arademaker, sorrachai]

def teamData := #[("teamMembers", teamMembers), ("techLeads", techLeads)]

block_component +directive teamDiv (whichTeam : String) where
  toHtml _id _json _goI _goB _contents := do
    let some (_, data) := teamData.find? (·.1 == whichTeam)
      | Verso.Doc.Html.HtmlT.logError s!"Didn't find '{whichTeam}'"
        return .empty
    return {{
        <div class="members-card">
          {{
            ← data.mapM Components.team
          }}
        </div>
    }}


#doc (Page) "Team" =>

%%%
showInNav := true
%%%

Cslib is governed by two main bodies:

- A [steering committee](#steering-committee), responsible for securing financial support and guiding the overall vision of the project.
- A [maintainer team](#maintainers), responsible for curating, expanding, and maintaining the code repository and its technical direction.

These groups work together to define the project's roadmap and foster a welcoming and productive environment.
New members may be invited based on project needs and individual merit (e.g., contributions, review activity).

# Steering committee

:::teamDiv "teamMembers"
:::

# Maintainers

The maintainer team is responsible for the quality of the codebase, establishing technical standards and ensuring coherence across contributions.

# Lead maintainer

The lead maintainer coordinates the overall work of the maintainer team and oversees the project's repositories.

- Fabrizio Montesi (@fmontesi), University of Southern Denmark and Danish Institute for Advanced Study.

# Technical leads

Technical leads guide long-term developments that may span multiple areas of the codebase, offering specialised expertise.

:::teamDiv "techLeads"
:::

# Area maintainers

Area maintainers are trusted contributors who take ownership of specific areas of the codebase, supporting their growth both as subject-matter experts and reviewers.

- Chris Henson (@chenson2018), Drexel University. Areas: Lambda calculus, metaprogramming.
- Kim Morrison (@kim-em), Lean FRO. Areas: Continuous Integration and Deployment (CI/CD) with upstream (Lean, mathlib).
