import VersoBlog
import Lang.Components.Team

open Verso.Output Html
open Lang Components
open Verso.Genre.Blog (Page)

namespace Lang
namespace Components

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
  role := "CSLib Lead Maintainer, FORM Director",
  link := "https://www.fabriziomontesi.com"
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

def contactAlexandre : Array Member := #[arademaker]

def contactFabrizio : Array Member := #[fabrizio]

def teamData := #[
  ("renphilTeam", renphilTeam),
  ("SteeringCommittee", SteeringCommittee),
  ("leadMaintainer", leadMaintainer),
  ("techLeads", techLeads),
  ("areaMaintainers", areaMaintainers),
  ("contactAlexandre", contactAlexandre),
  ("contactFabrizio", contactFabrizio)]

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

end Components
end Lang
