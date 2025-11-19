import Verso.Doc.Html
import VersoBlog
import Lang.Components.Icon

open Verso.Output Html
open Verso.Genre.Blog Template

namespace Lang
namespace Components

/--
The footer for the site. It includes links to resources, social media, and other information.
-/
def footer [MonadStateOf Component.State m] [Monad m] : m Html := do
  Template.saveCss (include_str "../../static/css/footer.css")

  return {{
    <footer role="contentinfo" class="white-brown-gradient" aria-label="Site footer">
      <div class="footer-grid container">
        <nav class="footer-column" aria-label="LEAN">
          <a href=".">
            {{ Icon.cslibLogo "var(--color-text)" (some 300) (some 80) (strokeWidth := 10) }}
          </a>
        </nav>

        <nav class="footer-column" aria-label="LEAN">
          <h3 id="get-started" class="footer-heading">"Lean Language"</h3>
          <ul class="footer-links">
            <li><a href="https://lean-lang.org/install/" class="footer-text">"Install"</a></li>
            <li><a href="https://lean-lang.org/learn/" class="footer-text">"Learn"</a></li>
            <li><a href="https://lean-lang.org/community/" class="footer-text">"Community"</a></li>
          </ul>
        </nav>

        <nav class="footer-column" aria-label="Documentation">
            <h3 id="documentation" class="footer-heading">"Documentation"</h3>
            <ul class="footer-links">
                <li><a href="https://cs-lean.github.io/" class="footer-text">"CSLib API"</a></li>
                <li><a href="https://lean-lang.org/doc/reference/latest/" class="footer-text">"Lean Language Reference"</a></li>
            </ul>
        </nav>

        <nav class="footer-column" aria-label="Resources">
            <h3 id="resources" class="footer-heading">"Resources"</h3>
            <ul class="footer-links">
                <li><a href="https://live.lean-lang.org/" class="footer-text">"Lean playground"</a></li>
                <li><a href="https://marketplace.visualstudio.com/items?itemName=leanprover.lean4" class="footer-text">
                "VS Code extension"</a></li>
                <li><a href="https://loogle.lean-lang.org/" class="footer-text">"Loogle"</a></li>
                <li><a href="https://reservoir.lean-lang.org/" class="footer-text">"Reservoir"</a></li>
                <li><a href="https://github.com/leanprover-community/mathlib4" class="footer-text">"Mathlib"</a></li>
            </ul>
        </nav>

        <nav class="footer-column" aria-label="Policies">
          <h3 id="policies" class="footer-heading">"Policies"</h3>
          <ul class="footer-links">
              <li><a href="/CodeOfConduct" class="footer-text">"Code of Conduct"</a></li>
              <li><a href="/License" class="footer-text">"License"</a></li>
          </ul>
        </nav>
      </div>

      <div class="footer-divider container" role="separator"></div>
      <div class="footer-bottom container">
        <div class="footer-copy">
          "© 2025 CSLib. All rights reserved."
        </div>
        <div class="footer-socials">
          <label class="theme-switch">
            <input type="checkbox" class="change-theme" />
            <div class="switch-container">
                <span class="slider"></span>
            </div>
          </label>
          <a href="https://bsky.app/profile/lean-lang.org"> {{ Icon.blueskyLogo }} </a>
          <a href="https://www.linkedin.com/company/lean-fro"> {{ Icon.linkedinLogo }} </a>
          <a href="https://functional.cafe/@leanprover"> {{ Icon.mastodonLogo }} </a>
          <a href="https://x.com/leanprover"> {{ Icon.xLogo }} </a>
          <a href="https://leanprover.zulipchat.com/"> {{ Icon.zulipLogo }} </a>
          <a href="https://github.com/leanprover/cslib/"> {{ Icon.githubLogo }} </a>
        </div>
      </div>
    </footer>
  }}

end Components
end Lang
