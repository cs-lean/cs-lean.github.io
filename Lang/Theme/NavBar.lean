import Verso.Doc.Html
import VersoBlog

import Lang.Components.NavBar

import Lang.Theme.Head
import Lang.Theme.Links

open Verso.Genre Blog
open Verso.Output Html
open Lang Components

namespace Lang

def buildNavBar : TemplateM Html := do
  let leftItems ← getPageItems
  -- let path ← currentPath

  let menuItems :=
    #[ { title := "Lean", url := some "https://lean-lang.org/", blank := true },
       { title := "Mathlib", url := some "https://mathlib-initiative.org/", blank := true },
       { title := "Reservoir", url := some "https://reservoir.lean-lang.org/", blank := true } ]

  let rightItems :=
    #[ { title := Icon.moon, alt := "Change Theme", classes := "change-theme" },
       { title := Icon.github, alt := "Github", url := "https://github.com/leanprover/cslib" } ]

  return ← Components.navBar leftItems rightItems menuItems #[]


end Lang
