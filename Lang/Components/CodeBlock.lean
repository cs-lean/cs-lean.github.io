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

def extractBlock : Block Page → Option String
  | .para #[.text t] => t
  | _ => none

block_component codeGallery where
  toHtml _ _ _ goB content := do
    Template.saveJs (include_str "../../static/js/code-block.js")

    let chunks := content.chunk 4

    let tabs ← chunks.mapIdxM fun idx chunk => do
      return {{
        <div class=s!"hero-code-tab{if idx == 0 then " active" else ""}" role="tab" aria-selected={{if idx = 0 then "true" else "false"}}>
          {{ ← goB <| chunk[0]! }}
        </div>
      }}

    let snippets ← chunks.mapIdxM fun idx chunk => do
      return {{
        <div class=s!"hero-code-snippet{if idx == 0 then " visible-code" else ""}">
          {{ ← goB <| chunk[1]! }}
        </div>
      }}

    let tips ← chunks.mapIdxM fun idx chunk => do
      return {{
        <div class=s!"hero-code-tip{if idx == 0 then " active" else ""}">
          <span>
            {{ ← goB <| chunk[2]! }}
          </span>
          <a class="hero-code-run" href={{extractBlock chunk[3]! |>.getD ""}}>
            {{ Icon.arrowRight (fill := "#386EE0") (width := "25px") }}
          </a>
        </div>
      }}

    return {{
      <div class="hero-code-box">
        <div class="hero-code-tabs" role="tablist">
          {{ tabs}}
          <div class="hero-code-tab filler"></div>
          <div class="hero-code-tab-border"></div>
        </div>
        <div class="hero-code-content" tabindex="-1">
          {{ snippets}}
        </div>
        <div class="hero-code-footer">
          <div class="hero-footer-left">
            {{ tips }}
          </div>
        </div>
      </div>
    }}

end Components
end Lang
