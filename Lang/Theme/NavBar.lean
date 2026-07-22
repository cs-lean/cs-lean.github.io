import Verso.Doc.Html
import VersoBlog

import Lang.Components.NavBar

import Lang.Theme.Head
import Lang.Theme.Links

open Verso.Genre Blog
open Verso.Output Html
open Lang Components
open Verso.Multi

namespace Lang

def initiativeHome (path : Path) : Array Item := #[
  { title := "Home", url := "/initiative", active := path == #["initiative"] } ]

def initiativePaths (path : Path) : Array Item := #[
  { title := "About", url := "/initiative/about", active := path == #["initiative", "about"] },
  { title := "Team", url := "/initiative/team", active := path == #["initiative", "team"] },
  { title := "Roadmap", url := "/initiative/roadmap", active := path == #["initiative", "roadmap"] },
  { title := "Contact", url := "/initiative/contact", active := path == #["initiative", "contact"] } ]

def buildSubNavBar : TemplateM Html := do
  let path ← currentPath
  if path[0]? == some "initiative" then
    return ← Components.subNavBar (initiativeHome path ++ initiativePaths path)
  else
    return .empty

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
