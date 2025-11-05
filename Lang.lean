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

    "team" Lang.Pages.Team
    "contact" Lang.Pages.Contact

    "privacy" Lang.Pages.PrivacyPolicy
    "terms" Lang.Pages.TermsOfUse

    "documentation" Lang.Pages.Documentation

    "publications" Lang.Pages.Publications
    "links" Lang.Pages.Links

def main (args : List String) : IO UInt32 :=
  blogMain (Lang.theme "Lean Lang") langSite {} args
