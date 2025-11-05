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

  let outItems :=
    #[ { title := "Lean", url := "https://lean-lang.org/" },
       { title := "Mathlib", url := "https://mathlib-initiative.org/" },
       { title := "Playground", url := "https://live.lean-lang.org/" },
       { title := "Reservoir", url := "https://reservoir.lean-lang.org/" } ]

  let rightItems :=
    #[ { title := Icon.moon, alt := "Change Theme", classes := "change-theme" },
       { title := Icon.github, alt := "Github", url := "https://github.com/leanprover/cslib" } ]

  return ← Components.navBar leftItems rightItems #[] outItems


end Lang
