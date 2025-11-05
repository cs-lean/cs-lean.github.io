import Lang.Components.Basic
import Lean.Elab
import VersoBlog

open Verso Genre
open Verso.Output Html
open Verso.Genre.Blog Template

namespace Lang
namespace Components

def badge (content : String) : Html :=
  {{
      <span>
        {{ content }}
      </span>
  }}

def sectionTitle [MonadStateOf Component.State m] [Monad m]  (tag : Option String) (title : String) (subtitle : Option Html) : m Html := do
  return {{
    <div class="heading-section">
      {{ tag <&> badge }}
      <h1 class="heading-title">{{title}}</h1>
      {{ subtitle <&> ({{<p class="heading-subtitle">{{·}}</p>}})}}
    </div>
  }}

block_component +directive sectionTitle' (tagg : Option String) (title : String) (subtitle : Option String) where
  toHtml _ _ _ _ _ := sectionTitle tagg title subtitle

block_component +directive pageTitle (level : Nat) (title : String) where
  toHtml _ _ _ _ _ := do
    return Html.tag s!"h{level}" #[("class", "page-title")] (.text true title)


block_component +directive header (level : Nat) (title : String) where
  toHtml _ _ _ _ _ := do
    return Html.tag s!"h{level}" #[("id", defaultPostName.slugify title)] (.text true title)

end Components
end Lang
