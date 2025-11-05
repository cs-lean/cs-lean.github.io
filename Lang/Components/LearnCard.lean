import Verso.Doc.Html
import VersoBlog
import Lang.Components.Icon
import Lean

open Verso.Output Html
open Verso Genre Lean
open Verso.Genre.Blog Template

namespace Lang
namespace Components

inductive ButtonType
  | book
  | game
  | website
deriving FromJson, ToJson, Repr

structure Card where
  icon : Icon
  title : String
  desc : String
  url : String
  tags : Array String := #[]
  type : ButtonType
deriving FromJson, ToJson, Repr

def learnCard (card : Card) : ComponentM Html := do
  Template.saveCss (include_str "../../static/css/card.css")
  return {{
    <article class="">
      <a href={{ card.url }} class="card-href card main-learn-card">
        <header>
          {{ card.icon }}
        </header>
        <p class="card-description">
          <strong>{{ card.title }}</strong>
          " "
          {{ card.desc }}
        </p>
        <footer>
          {{
            if card.tags.isEmpty then .empty else
              {{<div class="tags">
                {{ card.tags.map fun tag => {{ <span class="item-tag">{{ .text true tag }}</span> }} }}
                </div>
              }}
          }}
          <div class="read-more"> {{
            match card.type with
            | .book => "READ NOW"
            | .game => "PLAY NOW"
            | .website => "OPEN"
          }} {{ Icon.arrowForward (width := "17px") (fill := "var(--color-primary)") }} </div>
        </footer>
      </a>
    </article>
  }}

def cardGrid (cards : Array Card) : ComponentM Html := do
  return {{
    <div class="card-grid">
        {{ ← cards.mapM (learnCard ·) }}
    </div>
  }}

end Components
end Lang
