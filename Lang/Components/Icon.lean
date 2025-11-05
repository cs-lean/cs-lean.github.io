import Lean
import VersoBlog
import Verso.Doc.Html
import Lang.Meta.Svg
import Lang.Components.Basic

open Verso.Output Html
open Lean Elab Term
open Verso Genre Blog ArgParse Doc Elab
open Verso.Output Html
open Lang.Meta

namespace Lang
namespace Components

/--
The parameters to change an icon.
-/
structure IconParams where
  width : Option String := none
  height : Option String := none
  fill : Option String := none
  strokeWidth : Option Nat := none
  fontSize : Option String := none
  deriving ToJson, FromJson, Repr

/--
Icon categories.
-/
inductive IconKind
  | github | moon | search | cog | arrowForward | arrowRight | book | triangle | external
  | forall | lambda
  | team | handShake | rocket | globe
  | githubLogo | blueskyLogo | linkedinLogo | mastodonLogo | xLogo | zulipLogo
  | cslibLogo
  | clock | link | activity | heart
  | text (content : String)
deriving ToJson, FromJson, Repr

structure Icon where
  kind : IconKind
  params : IconParams := {}
deriving ToJson, FromJson, Repr

namespace Icon

def activity (fill : String := "#5185F4") (width : String := "25") : Icon :=
  ⟨.activity, { width := some width, fill }⟩

def book (fill : String := "white") (size : Option Nat := none) : Icon :=
  let sizeStr := size.map toString
  ⟨.book, { fill := some fill, width := sizeStr, height := sizeStr }⟩

def heart (fill : String := "#5185F4") (width : String := "25") : Icon :=
  ⟨.heart, { width := some width, fill }⟩

def link (fill : String := "#5185F4") (width : String := "25") : Icon :=
  ⟨.link, { width := some width, fill }⟩

def clock (fill : String := "#5185F4") (width : String := "25") : Icon :=
  ⟨.clock, { width := some width, fill }⟩

def github (width : String := "25") : Icon :=
  ⟨.github, { width := some width }⟩

def moon (width : String := "25") : Icon :=
  ⟨.moon, { width := some width }⟩

def search (width : String := "25") : Icon :=
  ⟨.search, { width := some width }⟩

def cog (fill : String := "#5185F4") (width : String := "28") (height : String := "28") : Icon :=
  ⟨.cog, { fill := some fill, width := some width, height := some height }⟩

def arrowForward (width : String := "20") (fill : Option String := none) : Icon :=
  ⟨.arrowForward, { width := some width, fill }⟩

def arrowRight (width : String := "20") (fill : Option String := none) : Icon :=
  ⟨.arrowRight, { width := some width, fill }⟩

def triangle (width : String := "25") (fill : String := "#5185F4") : Icon :=
  ⟨.triangle, { width := some width, fill := some fill }⟩

def forallSymbol (size : Option Nat := none) (fill : String := "white") : Icon :=
  let sizeStr := size.map toString
  ⟨.forall, { width := sizeStr, height := sizeStr, fill := some fill }⟩

def lambdaSymbol (size : Option Nat := none) (fill : String := "white") : Icon :=
  let sizeStr := size.map toString
  ⟨.lambda, { width := sizeStr, height := sizeStr, fill := some fill }⟩

def team (width : String := "25") : Icon :=
  ⟨.team, { width := some width }⟩

def handShake (width : String := "25") : Icon :=
  ⟨.handShake, { width := some width }⟩

def rocket (width : String := "25") : Icon :=
  ⟨.rocket, { width := some width }⟩

def globe (width : String := "25") (fill : String := "#5185F4") : Icon :=
  ⟨.globe, { width := some width, fill := some fill }⟩

def githubLogo (width : String := "20") : Icon :=
  ⟨.githubLogo, { width := some width }⟩

def blueskyLogo (width : String := "20") : Icon :=
  ⟨.blueskyLogo, { width := some width }⟩

def externalLink (width : String := "20") : Icon :=
  ⟨.external, { width := some width }⟩

def linkedinLogo (width : String := "20") : Icon :=
  ⟨.linkedinLogo, { width := some width }⟩

def mastodonLogo (width : String := "20") : Icon :=
  ⟨.mastodonLogo, { width := some width }⟩

def xLogo (width : String := "20") : Icon :=
  ⟨.xLogo, { width := some width }⟩

def zulipLogo (width : String := "20") : Icon :=
  ⟨.zulipLogo, { width := some width }⟩

def cslibLogo (fill : String := "#000") (width : Option Nat := none) (height : Option Nat := none) (strokeWidth : Nat := 4) : Icon :=
  let widthStr := width.map toString
  let heightStr := height.map toString
  ⟨.cslibLogo, { fill := some fill, width := widthStr, height := heightStr, strokeWidth := some strokeWidth }⟩

def textIcon (content : String := "?") (fill : String := "#386EE0") (fontSize : String := "40px") : Icon :=
  ⟨.text content, { fill := some fill, fontSize := some fontSize }⟩

private def setOptionalAttr (attr : String) (value : Option String) : Html → Html
  | elem => value.map (setAttribute attr · elem) |>.getD elem

private def iconSvg : IconKind → Html
  | .github => svg("./static/svg/github.svg")
  | .moon => svg("./static/svg/moon-outline.svg")
  | .search => svg("./static/svg/search-outline.svg")
  | .forall => svg("./static/svg/forall.svg")
  | .lambda => svg("./static/svg/lambda.svg")
  | .cog => svg("./static/svg/cog-outline.svg")
  | .arrowForward => svg("./static/svg/arrow-forward.svg")

  | .book => svg("./static/svg/book-outline.svg")
  | .activity => svg("./static/svg/activity-outline.svg")
  | .heart => svg("./static/svg/heart-outline.svg")
  | .link => svg("./static/svg/link-2-outline.svg")
  | .clock => svg("./static/svg/clock-outline.svg")

  | .arrowRight => svg("./static/svg/arrow-right-outline.svg")
  | .triangle => svg("./static/svg/arrowhead-right.svg")
  | .globe => svg("./static/svg/globe-outline.svg")
  | .cslibLogo => svg("./static/svg/cslib-logo-lines.svg")
  | .external => svg("./static/svg/external-link-outline.svg")
  | _ => .empty

private def renderSvgIcon (kind : IconKind) (params : IconParams) : Html :=
  iconSvg kind
  |> setOptionalAttr "width" params.width
  |> setOptionalAttr "height" params.height
  |> setOptionalAttr "fill" params.fill

private def renderImgIcon (src : String) (alt : String) (params : IconParams) : Html :=
  let width := params.width.getD "25"
  {{ <img width={{width}} src={{src}} alt={{alt}} /> }}

private def renderCslibLogo (params : IconParams) : Html :=
  let strokeWidth := params.strokeWidth.map toString |>.getD "4"
  let stroke := params.fill.getD "#000"
  svg("./static/svg/cslib-logo-lines.svg")
  |> setAttribute "stroke" stroke
  |> setAttribute "fill" "transparent"
  |> setAttribute "stroke-width" strokeWidth
  |> setOptionalAttr "width" params.width
  |> setOptionalAttr "height" params.height

private def renderTextIcon (content : String) (params : IconParams) : Html :=
  let color := params.fill.getD "#386EE0"
  let fontSize := params.fontSize.getD "40px"
  {{
    <i style=s!"width:{fontSize};height:{fontSize};color:{color};font-size:{fontSize};font-weight:500">
      {{content}}
    </i>
  }}

def render : Icon → Html
  | ⟨kind, params⟩ =>
    match kind with
    | .github | .moon | .search | .forall | .lambda | .cog
    | .clock | .activity | .heart | .link
    | .arrowForward | .book | .triangle | .globe
    | .external | .arrowRight => renderSvgIcon kind params
    | .cslibLogo => renderCslibLogo params
    | .team => renderImgIcon "/static/svg/employees.svg" "Team" params
    | .handShake => renderImgIcon "/static/svg/handshake.svg" "Handshake" params
    | .rocket => renderImgIcon "/static/svg/rocket-launch.svg" "Rocket" params
    | .githubLogo => renderImgIcon "/static/svg/github-white.svg" "GitHub" params
    | .blueskyLogo => renderImgIcon "/static/svg/bluesky-white.svg" "Bluesky" params
    | .linkedinLogo => renderImgIcon "/static/svg/linkedin-white.png" "LinkedIn" params
    | .mastodonLogo => renderImgIcon "/static/svg/mastodon-white.svg" "Mastodon" params
    | .xLogo => renderImgIcon "/static/svg/x-white.svg" "X" params
    | .zulipLogo => renderImgIcon "/static/svg/zulip-white.svg" "Zulip" params
    | .text content => renderTextIcon content params

private def generateFileName (kind : IconKind) (params : IconParams) : String :=
  let baseName := match kind with
    | .github => "github"
    | .moon => "moon"
    | .search => "search"
    | .external => "external-link-outline"
    | .forall => "forall"
    | .lambda => "lambda"
    | .cog => "cog"
    | .arrowForward => "arrow-forward"
    | .arrowRight => "arrow-right"
    | .book => "book"
    | .triangle => "triangle"
    | .globe => "globe"
    | .cslibLogo => "cslib-logo"
    | .team => "team"
    | .handShake => "handshake"
    | .rocket => "rocket"
    | .githubLogo => "github-logo"
    | .blueskyLogo => "bluesky-logo"
    | .linkedinLogo => "linkedin-logo"
    | .mastodonLogo => "mastodon-logo"
    | .xLogo => "x-logo"
    | .zulipLogo => "zulip-logo"
    | .clock => "clock"
    | .activity => "activity"
    | .heart => "heart"
    | .link => "link"
    | .text content => s!"text-{content.replace " " "-"}"

  let paramsSuffix :=
    let parts := []
    let parts := match params.width with
      | some w => parts ++ [s!"w{w}"]
      | none => parts
    let parts := match params.height with
      | some h => parts ++ [s!"h{h}"]
      | none => parts
    let parts := match params.fill with
      | some f => parts ++ [s!"fill{f.replace "#" ""}"]
      | none => parts
    let parts := match params.strokeWidth with
      | some sw => parts ++ [s!"sw{sw}"]
      | none => parts
    let parts := match params.fontSize with
      | some fs => parts ++ [s!"fs{fs.replace "px" ""}"]
      | none => parts
    if parts.isEmpty then "" else s!"-{String.intercalate "-" parts}"

  s!"{baseName}{paramsSuffix}.svg"

private def wrapInSvg (content : String) (params : IconParams) : String :=
  let width := params.width.getD "25"
  let height := params.height.getD "25"
  s!"<svg width=\"{width}\" height=\"{height}\" viewBox=\"0 0 {width} {height}\" xmlns=\"http://www.w3.org/2000/svg\">{content}</svg>"

def generateRender (icon : Icon) : IO Html := do
  let ⟨kind, params⟩ := icon
  let fileName := generateFileName kind params
  let filePath := s!"./static/icons/generated/{fileName}"

  let htmlContent := render icon
  let svgContent := match kind with
    | .clock | .activity | .link | .heart
    | .github | .moon | .search | .forall | .lambda | .cog | .external
    | .arrowForward | .book | .triangle | .globe | .cslibLogo
    | .team | .handShake | .rocket | .githubLogo | .blueskyLogo | .arrowRight
    | .linkedinLogo | .mastodonLogo | .xLogo | .zulipLogo => htmlContent.asString
    | .text content =>
      let color := params.fill.getD "#386EE0"
      let fontSize := params.fontSize.getD "40px"
      let size := fontSize.replace "px" ""
      s!"<svg width=\"{size}\" height=\"{size}\" viewBox=\"0 0 {size} {size}\" xmlns=\"http://www.w3.org/2000/svg\"><text x=\"50%\" y=\"50%\" text-anchor=\"middle\" dy=\".3em\" fill=\"{color}\" font-size=\"{fontSize}\" font-weight=\"500\">{content}</text></svg>"

  let dirPath := "./static/icons/generated"

  IO.FS.createDirAll dirPath
  IO.FS.writeFile filePath svgContent

  let width := params.width.getD "25"
  let height := params.height.getD "25"

  let altText := match kind with
    | .heart => "Heart"
    | .link => "Link"
    | .clock => "Clock"
    | .activity => "Activity"
    | .github => "GitHub"
    | .moon => "Moon"
    | .external => "External"
    | .search => "Search"
    | .forall => "For all"
    | .lambda => "Lambda"
    | .cog => "Settings"
    | .arrowForward => "Arrow Forward"
    | .arrowRight => "Arrow Right"
    | .book => "Book"
    | .triangle => "Triangle"
    | .globe => "Globe"
    | .cslibLogo => "Lean Logo"
    | .team => "Team"
    | .handShake => "Handshake"
    | .rocket => "Rocket"
    | .githubLogo => "GitHub"
    | .blueskyLogo => "Bluesky"
    | .linkedinLogo => "LinkedIn"
    | .mastodonLogo => "Mastodon"
    | .xLogo => "X"
    | .zulipLogo => "Zulip"
    | .text content => content

  return {{ <img width={{width}} height={{height}} src={{s!"/static/icons/generated/{fileName}"}} alt={{altText}} /> }}

instance : Coe Icon Html where
  coe := Icon.render

end Icon
end Components
end Lang
