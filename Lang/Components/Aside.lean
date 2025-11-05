import Verso.Doc.Html
import VersoBlog
import Lang.Components.Icon

open Verso.Output Html
open Verso.Genre.Blog Template

namespace Lang
namespace Components

/--
The `aside` component is used to create a sidebar with a title and content.
-/
def aside (title : String) (content : Html): Html :=
  {{
    <aside>
      <nav class="post-index">
        <h1 class="title">
          {{ title }}
        </h1>
        {{ content }}
      </nav>
    </aside>
  }}

end Components
end Lang
