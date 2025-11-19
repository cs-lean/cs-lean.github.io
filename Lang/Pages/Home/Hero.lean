import Verso.Doc.Html
import VersoBlog
import Lean

import Lang.Components.Feature
import Lang.Components.CodeBlock

open Verso.Output Html
open Lang Components Icon
open Lean Elab Term
open Verso Genre Blog ArgParse Doc Elab
open Verso.Output Html

namespace Lang
namespace Page
namespace Home

block_component +directive hero where
  cssFiles := #[("hero.css", include_str "../../../static/css/hero.css")]

  toHtml _id _json _goI _goB _content := do
    return {{
      <section id="cslib-hero" class="white-brown-gradient" aria-label="Hero">
        <div class="hero container">
          <div class="hero-content">
            <div class="hero-left">
              <div class="hero-branding reveal">
                {{ Icon.cslibLogo "black" (some 600) (some 240) (strokeWidth := 4) }}
                <p class="hero-tagline reveal transition-delay-medium">
                  "A Focused Effort on Formalizing Computer Science in Lean"
                </p>
              </div>
              <div class="hero-buttons reveal transition-delay-large">
                <a class="hero-button button secondary" href="/roadmap/">
                 {{ Icon.arrowForward "25" "black" }} "Roadmap"</a>
                <a class="hero-button button secondary" href="/api/">
                 {{ Icon.book (fill := "var(--color-primary)") (some 25) }} "API"</a>
              </div>
            </div>
            <div class="hero-right">
              <ul class="focus-list">
                <li><i>{{ Icon.clock (fill := "black") }}</i>
                 <div class="text"><strong>"Formalizing CS Foundations"</strong>
                 <br/>"Including computational models and complexity analysis tools."</div></li>
                <li><i>{{ Icon.link (fill := "black") }}</i>
                 <div class="text"><strong>"Reasoning about Code"</strong>
                 <br/>"Builds on the rich tradition of deductive verification techniques."</div></li>
                <li><i>{{ Icon.book (fill := "black") (some 25) }}</i>
                <div class="text"><strong>"Repository of Verified Code"</strong>
                <br/>"Cover all algorithms and data structures that a typical CS undergraduate encounter."</div></li>
                <li><i>{{ Icon.activity (fill := "black") }}</i>
                <div class="text"><strong>"AI Integration"</strong>
                <br/>"Training datasets and AI-assisted contribution tools"</div></li>
              </ul>
            </div>
          </div>
        </div>
      </section>
  }}

end Home
end Page
end Lang
