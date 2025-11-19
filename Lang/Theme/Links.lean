import Verso.Doc.Html
import VersoBlog

import Lang.Components.NavBar
import Lang.Theme.Head

open Verso.Genre Blog
open Verso.Output Html
open Lang

namespace Lang

/--
Function to get all the links from the pages that we created.
-/
def getDirLinks : TemplateM (Array (Bool × Option String × Html)) := do
  let pages := (← read).site
  let cur ← currentPath

  match pages with
  | .page _ _ subs =>
    subs.filterMapM fun
      | .page name _id txt .. | .blog name _id txt .. =>
        if txt.metadata.map (·.showInNav) |>.getD true then
          pure <| some (¬cur.isEmpty && cur[0]! == name, name, txt.titleString)
        else
          pure none
      | .static .. => pure none
  | .blog _ _ subs =>
    subs.mapM fun s => do
      let name ← s.postName'
      let url ← mkLink [name]
      return (false, url, s.contents.titleString)
where
  mkLink dest := do
    let dest' ← relative dest
    return String.join (dest'.map (· ++ "/"))

/--
Function to get all the items that redirect to pages.
-/
def getPageItems : TemplateM (Array Lang.Components.Item) := do
  let links ← getDirLinks

  return links.map fun (active, url, title) =>
    { title := title,
      url := url,
      active := active
    }
