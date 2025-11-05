import Verso.Doc.Html
import VersoBlog
import Lean

import Lang.Components.Icon

open Lean Elab Term
open Verso.Output Html
open Lang Components Icon
open Verso Genre Blog ArgParse Doc Elab

namespace Lang
namespace Components

structure Feature where
  title : String
  desc : String
  icon : Icon
deriving ToJson, FromJson, Repr

def features : Array Feature := #[
  { title := "Trustworthy",
    desc := "Lean’s minimal trusted kernel guarantees absolute correctness in mathematical proof, software and hardware verification.",
    icon := Icon.handShake },
  { title := "Powerful",
    desc := "From elementary concepts to cutting-edge research, Lean's expressive language and extensive built-in tools let users focus on the big picture rather than routine details.",
    icon := Icon.rocket },
  { title := "Extensible",
    desc := "Lean's metaprogramming capabilities enable users to extend the language with domain-specific notations and new proof automation techniques.",
    icon := Icon.cog  }
]

block_component feature (feature : Feature) where
  toHtml _ _ _ _ _ := do
    return {{
      <article class="hero-feature">
        <header class="hero-feature-title">
          <figure class="feature-icon">
            <span class="feature-icon">{{Icon.render feature.icon}}</span>
          </figure>
          <h3 class="feature-text">{{feature.title}}</h3>
        </header>
        <p class="hero-feature-description">
          {{feature.desc}}
        </p>
      </article>
    }}

end Components
end Lang
