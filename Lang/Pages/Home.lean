import VersoBlog

import Lang.Pages.Home.Hero
import Lang.Pages.Home.Sponsors

open Verso.Genre.Blog (Page)
open Verso.Genre Blog Theme Template
open Verso.Genre.Blog.Site.Syntax
open Verso.Output Html
open Verso.Genre.Blog
open Verso.Doc
open Lang.Components

set_option verso.exampleProject "examples/hero"
set_option verso.exampleModule "Hero"

open Verso.Code.External

#doc (Page) "Home" =>

```leanInit codeExamples
set_option grind.warning false
```

:::Lang.Page.Home.hero
:::

:::Lang.Page.Home.sponsors
:::
