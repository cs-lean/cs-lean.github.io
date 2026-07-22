import VersoBlog
import Lang.Components.Team
import Lang.Components.TeamData
open Verso.Output Html
open Lang Components
open Verso.Genre.Blog (Page)

block_component +directive formWebsite where
  toHtml _id _json _goI _goB _contents := do
    return {{
      <p>
        "For more information, see "
        <a href="https://www.sdu.dk/form" target="_blank" rel="noopener noreferrer">"FORM's website"</a>
        " (opens in another tab)."
      </p>
    }}

#doc (Page) "FORM" =>

%%%
showInNav := false
%%%

# Opening

FORM is the Centre for Formal Methods and Future Computing, a strategic organisation supporting CSLib through a tight collaboration on the development of formal methods and their long-term roadmap.

# Contact

:::teamDiv "contactFabrizio"
:::

# More information

:::formWebsite
:::
