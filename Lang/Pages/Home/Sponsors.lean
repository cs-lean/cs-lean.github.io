import Verso.Doc.Html
import VersoBlog

import Lang.Components.Icon
import Lang.Components.Title
import Lang.Components.Sponsor

open Verso.Output Html
open Lang Components Icon

namespace Lang
namespace Page
namespace Home

def sponsorsContent : Array Sponsor := #[
  { name := "Amazon", logo := "/static/png/aws.png", link := "https://www.amazon.com" },
  { name := "Google", logo := "/static/png/deepmind.png", link := "https://www.google.com" },
  { name := "University of Southern Denmark", logo := "/static/png/sdu.png", link := "https://www.sdu.dk/" }
]

block_component +directive sponsors where
  toHtml _ _ _ _ _ := do
    let sponsors : Array Html ← sponsorsContent.mapM sponsor
    return {{
      <section class="sponsors section-container reveal active container" aria-label="Sponsors">
        {{ ← Components.sectionTitle "Sponsors and Partners" "" none }}
        <div class="sponsors-content">
          {{ sponsors }}
        </div>
      </section>
    }}

  cssFiles := #[
    ("title.css", include_str "../../../static/css/title.css"),
    ("sponsors.css", include_str "../../../static/css/sponsors.css")
  ]
