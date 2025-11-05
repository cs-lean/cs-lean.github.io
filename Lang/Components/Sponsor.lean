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
  link : Option String := none

def sponsor [MonadStateOf Component.State m] [Monad m] (s : Sponsor) : m Html := do
  if let some link := s.link then
    return {{
      <a class="sponsor" href={{link}} target="_blank" rel="noopener noreferrer">
        <img src={{s.logo}} alt=s!"{s.name} logo" class="sponsor-logo" />
      </a>
    }}
  else
    return {{ <img src={{s.logo}} alt=s!"{s.name} logo" class="sponsor-logo" /> }}
