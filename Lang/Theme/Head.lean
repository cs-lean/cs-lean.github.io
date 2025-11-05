import Verso.Doc.Html
import VersoBlog

import Lang.Components.Basic
import Lang.Components.Icon

open Verso.Genre Blog Template
open Verso.Output Html

namespace Lang
namespace Theme

/--
Metadata for social media.
-/
structure SocialMeta where
  /--
  The website name.
  -/
  siteName : String

  /--
  The title, headline or name of the page.
  -/
  title : String

  /--
  The description of the page.
  -/
  description : String

  /--
  The type of the page.
  -/
  type : String := "article"

  /--
  he canonical URL for the page.
  -/
  url : String

  /--
  The URL of the image to use for the page.
  -/
  image : String

  /--
  The alt text for the image.
  -/
  alt : String

  /--
  Twitter article creator
  -/
  articleCreator : String

def SocialMeta.toHtml (data : SocialMeta) : Html :=
  {{
    <meta property="og:title" content={{data.title}}/>
    <meta property="og:type" content={{data.type}}/>
    <meta property="og:image" content={{data.image}}/>
    <meta property="og:url" content={{data.url}}/>
    <meta property="og:image:alt" content={{data.alt}}/>
    <meta property="og:site_name" content={{data.siteName}}/>
    <meta name="twitter:title" content={{data.title}}/>
    <meta name="twitter:description" content={{data.description}}/>
    <meta name="twitter:image" content={{data.image}}/>
    <meta name="twitter:image:alt" content={{data.alt}}/>
    <meta name="twitter:creator" content={{data.articleCreator}}/>
    <meta name="twitter:card" content="summary_large_image"/>
  }}

/--
The configuration for the head of a page.
-/
structure HeadConfig where
  /--
  Description of the page.
  -/
  description : String

  /--
  Favicon White Url
  -/
  faviconWhite : String

  /--
  Favicon Dark Url
  -/
  faviconDark : String

  /--
  appleTouchIcon : String
  -/
  appleTouchIcon : String

  /--
  The color of the page.
  -/
  color : String

/--
Builds the HTML for a head config.
-/
def HeadConfig.toHtml (data : HeadConfig) : Html :=
  {{
      <meta name="description" content={{ data.description }}/>
      <link rel="icon" href={{data.faviconWhite}} />
      <link rel="apple-touch-icon" href={{data.appleTouchIcon}} />
      <meta name="theme-color" content={{data.color}} />
  }}

/--
Builds the HTML for the head of a page.
-/
def head (siteName : String) (config : HeadConfig) (social : Option SocialMeta := none) (extraHead : Html := .empty) (base : Option String := none) : TemplateM Html := do
  let title ← param (α := String) "title"
  let page ← currentPath

  return {{
    <head>
      {{ base.map ({{ <base href={{·}} /> }}) }}

      <meta charset="UTF-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>

      {{
        if page == []
          then {{ <title> "Lean enables correct, maintainable, and formally verified code" </title> }}
          else {{ <title>{{ title }} s!" — {siteName} "</title> }}
      }}

      {{ HeadConfig.toHtml config }}
      {{ SocialMeta.toHtml <$> social |>.getD .empty }}

      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@300..700&family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Oranienbaum&display=swap" />
      <script src="/static/js/dark.js"/>

      <link rel="apple-touch-icon" href="/apple-touch-icon.png"/>

      <link rel="stylesheet" href="/static/css/reset.css"/>
      <link rel="stylesheet" href="/static/css/article.css"/>
      <link rel="stylesheet" href="/static/css/blog.css"/>
      <link rel="stylesheet" href="/static/css/style.css"/>
      <link rel="stylesheet" href="/static/css/navbar.css"/>
      <link rel="stylesheet" href="/static/css/footer.css"/>

      {{ extraHead }}
      {{ ← builtinHeader }}

    </head>
  }}

end Theme
end Lang
