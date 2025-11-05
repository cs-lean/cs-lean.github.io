import Lean.Elab
import VersoBlog

open Verso Genre
open Verso.Output Html

namespace Lang
namespace Components

structure Citation where
  authors : String
  title : String
  venue : String
  date : String
  pages : String
deriving Lean.ToJson, Lean.FromJson

/--
This is a method of grouping things inside of a `.seq` inside a Page or Post.
-/
def citation (citation : Citation) : Html :=
  {{
    <div class="citation-item" id="author2023">
        <span class="citation-authors">{{ citation.authors }}</span>
        <span class="citation-title">{{ citation.title }}</span>
        <span class="citation-venue">{{ citation.venue }}</span>
        <span class="citation-year">{{ citation.date }} </span>
        <span class="citation-pages">{{ citation.pages }}</span>
    </div>
  }}

end Components
end Lang
