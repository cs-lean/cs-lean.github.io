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
The Renaissance Philanthropy branding element.
-/
def renphilContent : Html :=
  {{ <a href="https://www.renaissancephilanthropy.org/initiatives" class="renphil-link" target="_blank">
       <svg width="28" height="35" viewBox="0 0 28 35" fill="none" xmlns="http://www.w3.org/2000/svg" class="renphil-svg">
         <path fill="#f87248" d="M6.36336 12.3831C6.89401 8.42993 10.3043 5.38035 14.4322 5.38035C18.9282 5.38035 22.5729 8.99791 22.5729 13.4604C22.5729 15.8285 21.5465 17.9587 19.9112 19.4365C19.544 19.7684 19.4903 20.3421 19.82 20.7108C20.6126 21.5972 21.3326 22.549 21.9709 23.5569C22.2295 23.9653 22.7846 24.0845 23.1566 23.7742C26.1179 21.3039 28 17.6003 28 13.4604C28 6.02291 21.9255 -0.00634766 14.4322 -0.00634766C7.21237 -0.00634766 1.30962 5.59104 0.888564 12.6523C0.862001 13.0977 1.22901 13.4604 1.6786 13.4604H3.57808C4.12969 13.4604 4.41524 13.4614 5.21775 13.5209C6.02028 13.5804 6.21874 13.4604 6.36336 12.3831Z"/>
         <path fill="#f87248" fill-rule="evenodd" clip-rule="evenodd" d="M0.864502 16.9611C0.864502 16.5148 1.22897 16.1531 1.67856 16.1531H3.57805C13.7957 16.1531 22.129 24.1605 22.5557 34.1979C22.5747 34.6437 22.2084 35.0065 21.7588 35.0065H17.9598C17.5102 35.0065 17.1483 34.6439 17.1218 34.1984C16.7007 27.1371 10.7979 21.5397 3.57805 21.5397H1.67856C1.22897 21.5397 0.864502 21.178 0.864502 20.7318V16.9611Z"/>
       </svg>
       <div class="renphil-text">
         <small>"A program of"</small>
         <strong>"Renaissance Philanthropy"</strong>
       </div>
     </a> }}

/--
The Renaissance Philanthropy branding for the navigation bar.
-/
def renphilBranding : Html :=
  {{ <div class="renphil-branding">
       {{ renphilContent }}
     </div> }}

/--
The navigation bar component.
-/
def navBar {m} [MonadStateOf Component.State m] [Monad m] (leftItems : Array Item) (rightItems : Array Item) (menuItems : Array Item) (_externalLinks : Array Item) : m Html := do
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
          </ul>
          <ul class="desktop-menu-part">
            <li><span class="divider" /></li>
            <li class="nav-item nav-item-dropdown">
              <div class="nav-link nav-dropdown-toggle" aria-label="External links menu">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                  <path d="M3 6h18M3 12h18M3 18h18" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                </svg>
              </div>
              <ul class="nav-dropdown">
                <div class="nav-dropdown-inner">
                  {{ menuItems.map navItem }}
                </div>
              </ul>
            </li>
            <li><span class="divider" /></li>
            {{ rightItems.map navItem }}
          </ul>
        </menu>
      </div>
      -- The mobile navigation menu.
      <menu class="mobile-nav">
        <ul class="nav-list">
          {{ leftItems.map navItem }}
          {{ menuItems.map navItem }}
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
