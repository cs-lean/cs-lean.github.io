import Verso.Doc.Html
import VersoBlog
import Lang.Components.Icon

open Verso.Output Html
open Verso.Genre.Blog Template

namespace Lang
namespace Components

/--
An item in the navigation bar.
-/
structure Item where
  title : Html
  url : Option String := none
  active : Bool := false
  alt : Option String := none
  classes : Option String := none
  blank := false
deriving Repr

/--
The navigation item component.
-/
def navItem (item : Item) : Html :=
  let classes := item.classes.map (s!" {·}") |>.getD ""

  {{
    <li class=s!"nav-item{ if item.active then " active" else ""}">
      {{
        if let some url := item.url then
          {{ <a href={{url}} class=s!"nav-link{classes}" aria-label={{item.alt.getD ""}} target={{if item.blank then "_blank" else "_self"}}>{{item.title}}</a>}} else
          {{ <button class=s!"nav-link{classes}" aria-label={{item.alt.getD ""}}> {{ item.title }} </button> }}
      }}
    </li>
  }}

/--
The lean lang logo.
-/
def logo : Html :=
  {{ <a class="nav-logo" href="."> {{ Icon.cslibLogo "var(--color-text)" (some 100) (some 50) (strokeWidth := 15) }} </a> }}

/--
The navigation bar component.
-/
def navBar {m} [MonadStateOf Component.State m] [Monad m] (leftItems : Array Item) (rightItems : Array Item) (_menuItems : Array Item) (externalLinks : Array Item) : m Html := do
  return {{
    <nav class="navbar" role="navigation" aria-label="Primary navigation">
      <div class="navbar-container container">
        {{ logo }}

        -- The mobile toggle button.
        <div class="nav-toggle">
            <input type="checkbox" id="nav-toggle" class="nav-toggle-checkbox" />
            <label for="nav-toggle" class="nav-toggle-label" aria-label="Toggle navigation menu">"☰"</label>
        </div>

        -- The desktop navigation menu.
        <menu class="desktop-menu">
          <ul class="desktop-menu-part">
            {{ leftItems.map navItem }}
            <li><span class="divider" /></li>
            {{ externalLinks.map navItem }}
          </ul>
          <ul class="desktop-menu-part">
            {{ rightItems.map navItem }}
          </ul>
        </menu>
      </div>
      -- The mobile navigation menu.
      <menu class="mobile-nav">
        <ul class="nav-list">
          {{ (leftItems.pop).map navItem }}
          {{ (externalLinks.pop).map navItem }}
        </ul>
      </menu>
    </nav>
  }}

/--
The sub-navigation bar component.
-/
def subNavBar [MonadStateOf Component.State m] [Monad m] (menuItems : Array Item) : m Html := do
  return {{
    <nav class="sub-navbar">
      <div class="navbar-container container">
        -- {{ froLogo }}

        <ul class="nav-list">
          {{ menuItems.map navItem }}
        </ul>
      </div>
    </nav>
  }}


end Components
end Lang
