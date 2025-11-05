import Lang.Components.Basic
import Lean.Elab
import VersoBlog

open Verso Genre Blog Template
open Verso.Output Html

namespace Lang
namespace Components

block_component +directive modal (id : String) where
  toHtml _ _ _ goB contents := do
    saveCss (include_str "../../static/css/modal.css")
    saveJs (include_str "../../static/js/modal.js")

    return {{
      <div id={{id}} class="modal-backdrop hidden" data-modal="">
        <div class="modal">
          <button class="modal-close" aria-label="Close modal">"&times;"</button>
          <div class="modal-content">
            {{ ← contents.mapM goB }}
          </div>
        </div>
      </div>
    }}

end Components
end Lang
