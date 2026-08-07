import VersoBlog
import Lang.Components.Team
import Lang.Components.TeamData
open Verso.Output Html
open Lang Components
open Verso.Genre.Blog (Page page_link)

#doc (Page) "Governance" =>

%%%
showInNav := true
%%%

CSLib is governed by two main bodies:

- A {page_link Lang.Pages.Governance "steering-committee"}[steering committee], responsible for securing financial support and guiding the overall vision of the project.
- A {page_link Lang.Pages.Governance "maintainers"}[maintainer team], responsible for curating, expanding, and maintaining the code repository and its technical direction.

These groups work together to define the project's roadmap and foster a welcoming and productive environment. New members may be invited based on project needs and individual merit.

# Steering committee

The steering committee guides the overall vision of the project and secures its financial support. Its members also form the Strategic Advisory Board of the CSLib Initiative.

:::teamDiv "SteeringCommittee"
:::

# Maintainers

The maintainer team is responsible for the quality of the codebase, establishing technical standards and ensuring coherence across contributions. It is organized into a lead maintainer, technical leads, and area maintainers.

## Lead maintainer

The lead maintainer coordinates the overall work of the maintainer team and oversees the project's repositories.

:::teamDiv "leadMaintainer"
:::

## Technical leads

Technical leads guide long-term developments that may span multiple areas of the codebase, offering specialised expertise.

:::teamDiv "techLeads"
:::

## Area maintainers

Area maintainers are trusted contributors who take ownership of specific areas of the codebase, supporting their growth both as subject-matter experts and reviewers.

:::teamDiv "areaMaintainers"
:::

# Contact

The best option is to post your question or message in the [CSLib Zulip channel](https://leanprover.zulipchat.com/#narrow/channel/513188-CSLib).
You can also open an issue on the [CSLib repository](https://github.com/leanprover/cslib). Alternatively, you may contact any of us.
