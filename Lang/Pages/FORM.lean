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
        "You can read more about FORM on "
        <a href="https://www.sdu.dk/form" target="_blank" rel="noopener noreferrer">"FORM's official website"</a>
        " (opens in another tab)."
      </p>
    }}

#doc (Page) "FORM" =>

%%%
showInNav := false
%%%

# FORM: Centre for Formal Methods and Future Computing

FORM is the first research centre focused on the development of CSLib, hosted by the Danish Institute for Advanced Study, University of Southern Denmark. Its mission is to unlock the large-scale application of formal methods in software development.

The centre acts as an international hub for research projects on the development of CSLib and strategic downstream projects.
On top of planning and carrying out projects on CSLib and formal methods in general, FORM is a platform for the education and career development of researchers interested in these areas.
The centre also offers expert supervision, support for CSLib's roadmapping, research capacity, workshops, and possibilities for funded scientific visits.

FORM has a tight collaboration with the CSLib governance body and the [CSLib Initiative](/initiative).

:::formWebsite
:::

# Contact

If you want to get in touch with FORM to discuss collaborations or general inquiries, you can contact the Centre Director Fabrizio Montesi or write directly to [form@sdu.dk](mailto:form@sdu.dk).

:::teamDiv "contactFabrizio"
:::
