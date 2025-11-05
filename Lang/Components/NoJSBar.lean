import Verso.Doc.Html
import VersoBlog
import Lang.Components.Icon

open Verso.Output Html
open Verso.Genre.Blog Template

namespace Lang
namespace Components

/--
Bar to display a message when JavaScript is disabled.
-/
def noJSBar [MonadStateOf Component.State m] [Monad m] : m Html := do
  Template.saveCss (include_str "../../static/css/noJS.css")

  return {{
    <noscript>
      <div class="no-js-warning">
          "If you want the full website experience, enable JS"
      </div>
    </noscript>
  }}

end Components
end Lang
