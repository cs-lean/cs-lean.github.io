import VersoBlog

import Lang.Pages
import Lang.Theme

open Verso.Genre.Blog
open Verso.Genre.Blog.Site.Syntax

def langSite : Site :=
  site Lang.Pages.Home /
    static "static" ← "static"
    static "papers" ← "static/papers"

    "404" Lang.Pages.«404»

    "about" Lang.Pages.About

    "contributing" Lang.Pages.Contributing

    "roadmap" Lang.Pages.Roadmap

    "governance" Lang.Pages.Governance

    "strategic-organizations" Lang.Pages.StrategicOrganizations
    "initiative" Lang.Pages.Initiative /
      "about" Lang.Pages.Initiative.About
      "team" Lang.Pages.Initiative.Team
      "roadmap" Lang.Pages.Initiative.Roadmap
      "contact" Lang.Pages.Initiative.Contact
    "form" Lang.Pages.FORM

    "CodeOfConduct" Lang.Pages.CodeOfConduct
    "License" Lang.Pages.License

    "resources" Lang.Pages.Publications

def main (args : List String) : IO UInt32 :=
  blogMain (Lang.theme "Lean Lang") langSite {} args
