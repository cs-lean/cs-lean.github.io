import VersoBlog
import Lean

import Lang.Components.NoJSBar
import Lang.Components.Footer
import Lang.Components.NavBar
import Lang.Components.Title
import Lang.Components.Aside

import Lang.Theme.Head
import Lang.Theme.Blog
import Lang.Theme.Links
import Lang.Theme.NavBar

open Verso Genre Blog Template Output Doc Output Html
open Lang Theme Components

namespace Lang

/--
Marks the layout of the page.
-/
def isMarkdownPage : List String → Bool
  | [] | ["404"] => false
  | _ => true

def indexPage : List String → Bool
  | _ => false

def needsTitle : List String → Bool
  | ["learn"] | ["install"] | ["404"] => false
  | _ => true

def isInstallPage : List String → Bool
  | "install" :: _ => true
  | _ => false

def isUseCases : List String → Bool
  | ["use-cases"] => true
  | _ => false

def isPagePost : List String → Bool
  | ["use-cases", _] => true
  | _ => false

def home : SocialMeta :=
  { title := "CSLib",
    description := "A Focused Effort on Formalizing Computer Science in Lean",
    image := "https://cs-lean.github.io/static/png/banner.png",
    url   := "https://cs-lean.github.io",
    siteName := "CSLib",
    alt := "CSLib",
    articleCreator := "@cslib",
  }

def config : HeadConfig :=
  { description := home.description,
    faviconWhite   := "https://cs-lean.github.io/static/favicon-light.ico",
    faviconDark    := "https://cs-lean.github.io/static/favicon-dark.ico",
    appleTouchIcon := "https://cs-lean.github.io/static/apple-touch-icon.png",
    color := "#3D6AC9"
  }

private def primaryTemplate (siteName : String) (extraHead : Html := .empty) : TemplateM Html := do
  Template.saveCss (include_str "../static/css/noJS.css")
  let path ← currentPath

  return {{
    <html lang="en">
      {{ ← head siteName config home extraHead (if path == ["404"] then some "/" else none) }}
      <body>
        {{ ← Components.noJSBar }}
        <header class="site-header">
          {{ ← buildNavBar }}
        </header>
        {{ ← param "content" }}
        {{ ← Components.footer }}
        <script src="/static/js/theme.js" />
        <script src="/static/js/copy.js" />
        <script id="MathJax-script" src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
      </body>
    </html>
  }}

/--
Templates that are basically pages with markdown content.
-/
private def markdownPageTemplate : TemplateM Html := do
  let content ← param "content"
  let title ← param "title"
  let nav := collectH1 content
  let path ← currentPath

  let postPageContent :=
    if nav.isSome ∧ indexPage path
      then "post-grid"
      else "post-center"

  let sectionTitle := {{
      <h1 class="page-title">
        {{ ← param "title"}}
      </h1>
  }}

  let postList :=
    match (← param? "posts") with
    | none => Html.empty
    | some html => html

  return {{
    <main class=s!"container">
      <div class=s!"{postPageContent} post-page">
        <article class="post-container">
          <div class="post-content">
            {{ if needsTitle path then sectionTitle else .empty }}
            {{ if isUseCases path then {{ <div class="use-cases-grid"> {{ postList }} </div> }} else postList }}
            {{ addSlug content }}
          </div>
        </article>
        {{ if indexPage path then aside title <$> nav else .empty }}
      </div>
    </main>
  }}

/--
Pages that have a free design with a lot of custom components, like the home page.
-/
private def freePageTemplate : TemplateM Html := do

  let postList :=
    match (← param? "posts") with
    | none => Html.empty
    | some html => {{ <section class="page-content container"> {{ html }} </section> }}

  return {{
    <main>
      {{ ← param "content" }}
      {{ postList }}
    </main>
  }}

/--
Templates for common pages.
-/
private def pageTemplate : TemplateM Html := do
  let path ← currentPath

  if isPagePost path then postTemplate
  else if isMarkdownPage path then markdownPageTemplate
  else freePageTemplate

/--
Template for category pages, which list posts in a category.
-/
private def categoryTemplate : TemplateM Html := do
  return {{
    <div class=s!"main content-page" role="main">
      <section class="page-section container">
       <h1 class="page-title">
        {{ ← param "title"}}
       </h1>
        {{ (← param? "posts" : Option Html) }}
      </section>
      </div>
    }}

/--
The final theme definition for Verso with custom templates.
-/
def theme (siteName : String) (extraHead : Html := .empty) : Theme :=
  { Theme.default with
    pageTemplate,
    categoryTemplate,
    postTemplate,
    primaryTemplate := primaryTemplate siteName extraHead,
    archiveEntryTemplate := archiveEntry,
  }

end Lang
