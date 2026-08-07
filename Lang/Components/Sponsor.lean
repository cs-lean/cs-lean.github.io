import Verso.Doc.Html
import VersoBlog
import Lang.Components.Icon

open Verso.Output Html
open Lang Components Icon
open Verso.Genre.Blog Template

namespace Lang
namespace Components

structure Sponsor where
  name : String
  logo : String
  logoDark : Option String := none
  link : Option String := none

def sponsor [MonadStateOf Component.State m] [Monad m] (s : Sponsor) : m Html := do
  let img :=
    if let some logoDark := s.logoDark then
      {{
        <img src={{s.logo}} alt=s!"{s.name} logo" class="sponsor-logo light-display" style="filter: none !important;" />
        <img src={{logoDark}} alt=s!"{s.name} logo" class="sponsor-logo dark-display" style="filter: none !important;" />
      }}
    else
      {{ <img src={{s.logo}} alt=s!"{s.name} logo" class="sponsor-logo" /> }}
  if let some link := s.link then
    return {{
      <a class="sponsor" href={{link}} target="_blank" rel="noopener noreferrer">
        {{img}}
      </a>
    }}
  else
    return img
