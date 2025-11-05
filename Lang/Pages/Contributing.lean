import VersoBlog

import Lang.Components.Container
import Lang.Components.ZulipInfo

open Verso.Genre Blog Theme Template
open Verso.Output Html
open Lang.Components

open Verso.Genre.Blog (Page)

def calendar : Html := {{
  <div id="calendar-container"></div>
  <script type="text/javascript">r! r#"
    const timezone = Intl.DateTimeFormat().resolvedOptions().timeZone;
    document.getElementById('calendar-container').innerHTML = `<iframe src="https://calendar.google.com/calendar/embed?height=400&wkst=1&ctz=${timezone}&mode=AGENDA&showTitle=0&showNav=0&showPrint=0&showTabs=0&showCalendars=0&showDate=0&src=Y19hOTA2NWFkNDRiZjc4MGFiMzQ0YzhkNzE4MThhMjFkM2JhMzYzYTZkZjVhYjc3NzkxNzM3M2ZmZTA3NjNmNDUyQGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20&color=%234285F4" style="border-width:0" width="800" height="400" frameborder="0" scrolling="no"></iframe>`;"#
  </script>
}}

#doc (Page) "Contributing" =>

:::zulipBanner
:::

# Contributing to CSLib

Great that you're interested in contributing to CSLib! :tada:

Please read the rest of this document before submitting a pull request.
If you have any questions, a good place to ask them is the [Lean prover Zulip chat](https://leanprover.zulipchat.com/).

## Contribution model

To get your code approved, you need to submit a [pull request (PR)](https://github.com/leanprover/cslib/pulls).
Each PR needs to be approved by at least one relevant maintainer. You can read the [list of current maintainers](/GOVERNANCE.md#maintainers).

If you are adding something new to cslib and are in doubt about it, you are very welcome to contact us on the [Lean prover Zulip chat](https://leanprover.zulipchat.com/).

## Style and documentation

We generally follow the [mathlib style for coding and documentation](https://leanprover-community.github.io/contribute/style.html), so please read that as well. Some things worth mentioning and conventions specific to this library are explained next.

### Variable names

Feel free to use variable names that make sense in the domain that you are dealing with. For example, in the `Lts` library, `State` is used for types of states and `μ` is used as variable name for transition labels.

### Proof style and golfing :golf:

Please try to make proofs easy to follow.
Golfing and automation are welcome, as long as proofs remain reasonably readable and compilation does not noticeably slow down.

### Notation

The library hosts a number of languages with their own syntax and semantics, so we try to manage notation with reusability and maintainability in mind.

- If you want notation for a common concept, like reductions or transitions in an operational semantics, try to find an existing typeclass that fits your need.
- If you define new notation that in principle can apply to different types (e.g., syntax or semantics of other languages), keep it locally scoped or create a new typeclass.


# Looking for more support?

[Lean community website](https://leanprover-community.github.io/) \- A community maintained website that hosts a variety of helpful resources and is the main reference site for working with Mathlib, Lean's extensive community-built library of mathematics.

[Lean community YouTube channel](https://www.youtube.com/@leanprovercommunity5485) \- Hosts many instructional videos, lectures and guides recorded from conferences and workshops organized by the Lean community.
