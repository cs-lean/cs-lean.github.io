import Verso.Doc.Html
import VersoBlog

import Lang.Components.Icon
import Lang.Components.Title

open Verso.Output Html
open Verso.Genre.Blog Template

namespace Lang
namespace Components


block_component +directive zulipBanner where
  cssFiles := #[("zulipCard.css", include_str "../../static/css/zulipCard.css")]

  toHtml _ _ _ _ _ := do
    return {{
      <article href="." class="card card-item zulip-info white-blue-gradient">
        <img class="hexapus" src="/static/png/hexapus.png" aria-hidden="true" />
        <div class="zulip-card-content">
          <div class="zulip-card-title"> "Connect with Lean experts!" </div>
          <p class="zulip-card-text"> "The independently-run Lean Community Zulip chat is the central hub for everything Lean. Whether you are a new or experienced Lean user, it’s a welcoming place to ask questions, share ideas, and collaborate with other Lean users." </p>
        </div>
        <a class="button primary" href="https://leanprover.zulipchat.com/">"Visit Zulip"</a>
      </article>
    }}

end Components
end Lang
