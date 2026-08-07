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
                {{ Icon.cslibLogo "var(--color-text)" (some 600) (some 240) (strokeWidth := 4) }}
                <p class="hero-tagline reveal transition-delay-medium">
                  "An open-source library of reusable components for proving theorems in computer science and writing formally verified code in the Lean programming language and proof assistant."
                </p>
              </div>
              <div class="hero-buttons reveal transition-delay-large">
                <a class="hero-button button secondary" href="https://leanprover.github.io/cslib/docs/">
                 {{ Icon.book (fill := "var(--color-primary)") (some 25) }} "API"</a>
                <a class="hero-button button secondary" href="https://github.com/leanprover/cslib">
                 {{ Icon.github }} "Code"</a>
                <a class="hero-button button secondary" href="https://arxiv.org/abs/2602.04846">
                 {{ Icon.arrowForward "25" "var(--color-primary)" }} "Whitepaper"</a>
              </div>
            </div>
            <div class="hero-right">
              -- <h2 class="focus-list-title">"Why CSLib"</h2>
              <ul class="focus-list">
                <li><i>{{ Icon.clock (fill := "var(--color-text)") }}</i>
                 <div class="text"><strong>"Formalized foundations of computer science"</strong>
                 <br/>"Computational models, complexity, and core theory across many areas of CS."</div></li>
                <li><i>{{ Icon.link (fill := "var(--color-text)") }}</i>
                 <div class="text"><strong>"A toolkit for reasoning about programs"</strong>
                 <br/>"Verify properties of your code, building on decades of deductive verification."</div></li>
                <li><i>{{ Icon.book (fill := "var(--color-text)") (some 25) }}</i>
                <div class="text"><strong>"A repository of verified algorithms and data structures"</strong>
                <br/>"Reusable, machine-checked implementations you can build on."</div></li>
                <li><i>{{ Icon.activity (fill := "var(--color-text)") }}</i>
                <div class="text"><strong>"A foundation for trustworthy AI"</strong>
                <br/>"A shared vocabulary to train models on."</div></li>
              </ul>
            </div>
          </div>
        </div>
      </section>
  }}

end Home
end Page
end Lang
